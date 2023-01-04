# Whats new in PHP 8

PHP 8 has been officially released on November 26, 2020, for general users. PHP8 is a major version that has some breaking changes, as well as lots of new features and performance improvements.

We will be able to build asynchronous applications in PHP 8 which is a big deal for websites.

As of the breaking changes, there is a higher chance that we will need to make some changes in our code to get it running on PHP 8. Besides breaking changes PHP 8 also brings a nice set of new features that we are going to discuss.

## Table of Contents
1. [Named Arguments](#new-features)
1. [Attributes](#attributes)
1. [Constructor property promotion](#constructor-property-promotion)
1. [Union Types](#union-types)
1. [Match expression](#match-expression)
1. [Nullsafe operator](#nullsafe-operator)
1. [Saner string to number comparisons](#saner-string-to-number-comparisons)
1. [Consistent type errors for internal functions](#consistent-type-errors-for-internal-functions)
1. [Type system and error handling improvements](#type-system-and-error-handling-improvements)
1. [Other syntax tweaks and improvements](#other-syntax-tweaks-and-improvements)
1. [New Classes, Interfaces, and Functions](#new-classes-interfaces-and-functions)

# New features
## Named Arguments

[TOC](#table-of-contents)

When we are developing some features in our application project we might have faced a situation where we have a reusable class method/global function declaration which has lots of parameters. And it is hard to maintain those arguments when calling that method/function. PHP 8 has introduced [Named arguments](https://wiki.php.net/rfc/named_params) which is most welcomed feature we were waiting for.

Named arguments allow passing arguments to a function based on the parameter name, rather than the parameter position. This makes the meaning of the argument self-documenting, makes the arguments order-independent, and allows skipping default values arbitrarily.

To give a simple example:

```php
// Using positional arguments:
array_fill(0, 100, 50);
 
// Using named arguments:
array_fill(start_index: 0, num: 100, value: 50);
```

The order in which the named arguments are passed does not matter. The above example passes them in the same order as they are declared in the function signature, but any other order is possible too:

```php
array_fill(value: 50, num: 100, start_index: 0);
```

Let's understand this using following basic code snippet:

```php
<?php

function testFunc(
    string $firstName,
    string $lastName,
    string $about,
    int $age,
    bool $showDashes = true
) {
    echo "Full name: " . $firstName . " ". $lastName . "\n";
    echo "Age: ". $age . "\n";
    echo "Profession: " . $about . "\n";   
    echo $showDashes ? "------------------------------------" . "\n\n" : "\n";
}

testFunc(
    age: 35,
    firstName: "John",
    lastName: "Doe",
    about: "I am an unknown person."
);
testFunc(
    about: "I am a pirate.",
    showDashes: false,
    age: 28,
    lastName: "sparrow",
    firstName: "Jack"
);

```

[TOP](#whats-new-in-php-8)

## Attributes

[TOC](#table-of-contents)

Instead of PHPDoc annotations, we can now use structured metadata with PHP's native syntax.
Until PHP7.4 doc-comments were the only way to add metadata to declarations of classes, methods, functions etc. and PHP8 introduces [attributes](https://www.php.net/manual/en/language.attributes.overview.php) which offers the ability to add structured, machine-readable metadata on declarations in code: Classes, methods, functions, parameters, properties and class constants etc. This can be then be inspected during runtime using the Reflection APIs. Therefore, it could be thought of a configuration language embedded directly into code. It annotates extra information and configuration in code.

** Example **
```php
<?php

#[ExampleAttribute]
class Foo {
    #[ExampleAttribute]
    public const FOO = 'foo';

    #[ExampleAttribute]
    public $x;

    #[ExampleAttribute]
    public function foo(#[ExampleAttribute] $bar) {}
}

$object = new #[ExampleAttribute] class () {};

#[ExampleAttribute]
function f1() { }

$f2 = #[ExampleAttribute] function () { };

$f3 = #[ExampleAttribute] fn() => 1;
```

### Use case of Attribute
A simple example of attributes usage is to convert an interface that has optional methods to use attributes. Let us assume an `ActionHandler` interface representing an operation in an application, where some implementations of an action handler require setup and others do not. Instead of requiring all classes that implement `ActionHandler` to implement a method `setup()`, an attribute can be used. One benefit of this approach is that we can use the attribute several times.

[TOP](#whats-new-in-php-8)

## Constructor property promotion

[TOC](#table-of-contents)

Less boilerplate code to define and initialize properties. This [Constructor Property Promotion](https://wiki.php.net/rfc/constructor_promotion) syntax will simplify the property declaration, making it shorter and less redundant. Before PHP 8, all properties have to be repeated several times (at least four times) before we can use them with objects. Consider the following example from the RFC:

```php
<?php
class NavaInvoiceMailable extends BaseMailable
{
    private $emailAddress;
    private $invoiceId;
    private $sentPaymentLink;
    private $isForPaymentConfirmation;
    private $isQuotation;
    private $forQuotationReminder;
    private $reminderType;

    public function __construct(
        $invoiceId,
        $email,
        $sentPaymentLink = false,
        $isForPaymentConfirmation = false,
        $isQuotation = false,
        $forQuotationReminder = false,
        $reminderType = null
    )
    {
        parent::__construct();

        $this->invoiceId = $invoiceId;
        $this->emailAddress = $email;
        $this->sentPaymentLink = $sentPaymentLink;
        $this->isForPaymentConfirmation = $isForPaymentConfirmation;
        $this->isQuotation = $isQuotation;
        $this->forQuotationReminder = $forQuotationReminder;
        $this->reminderType = $reminderType;
    }

    /* Rest of codes...*/
}
```

We have to write the property name at least four times in three different places: the property declaration, the constructor parameters, and the property assignment. This syntax is not particularly usable, especially in classes with many properties and more descriptive names.

The above code can be changed as shown below:
```php
<?php
class NavaInvoiceMailable extends BaseMailable
{
    public function __construct(
        private int $invoiceId,
        private string $email,
        private bool $sentPaymentLink = false,
        private bool $isForPaymentConfirmation = false,
        private bool $isQuotation = false,
        private bool $forQuotationReminder = false,
        private ?int $reminderType = null
    ) {
        parent::__construct();
    }
}
```
And that’s it. So we have a new way to promote properties that are shorter, more readable, and less prone to errors.

**Key to remember before using promoted properties:** 

Promoted parameters may only occur inside non-abstract constructors. As such, all the following are illegal:
```php
// Error: Not a constructor.
function test(private $x) {}
 
abstract class Test {
    // Error: Abstract constructor.
    abstract public function __construct(private $x);
}
 
interface Test {
    // Error: Abstract constructor.
    public function __construct(private $x);
}
```

While unusual, promoted parameters may occur inside trait constructors.

Promoted properties have to be prefixed by one of the visibility keywords, use of var is not supported:

```php
class Test {
    // Error: "var" keyword is not supported.
    public function __construct(var $prop) {}
}
```

Properties declared through promoted parameters are subject to the same restrictions as normal property declarations. In particular, it is not possible to declare the same property twice:

```php
class Test {
    public $prop;
 
    // Error: Redeclaration of property.
    public function __construct(public $prop) {}
}
```
It is also not possible to use the callable type, because it is not supported as a property type:

```php
class Test {
    // Error: Callable type not supported for properties.
    public function __construct(public callable $callback) {}
}
```
Similarly, because promoted parameters imply a property declaration, nullability must be explicitly declared, and is not inferred from a null default value:

```php
class Test {
    // Error: Using null default on non-nullable property
    public function __construct(public Type $prop = null) {}
 
    // Correct: Make the type explicitly nullable instead
    public function __construct(public ?Type $prop = null) {}
}
```
Variadic parameters cannot be promoted:

```php
class Test {
    // Error: Variadic parameter.
    public function __construct(public string ...$strings) {}
}
```
The reason is that in this case the type of the individual arguments (here: string), and the type of the variadic (one which accepts a variable number of arguments) parameter into which they are collected (here: array of string) differ. While we could implicitly give the `$strings` property an array type for variadic parameters, this makes the transform less transparent.

Explicit property declarations and properties promoted from constructor arguments may be combined. A constructor may also have both promoted and non-promoted parameters.

```php
// Legal.
class Test {
    public string $explicitProp;
 
    public function __construct(public int $promotedProp, int $normalArg) {
        $this->explicitProp = (string) $normalArg;
    }
}
```
[TOP](#whats-new-in-php-8)

## Union Types
[TOC](#table-of-contents)

A “union type” accepts values of multiple different types, rather than a single one. PHP already supports two special union types:

- Type or null, using the special ?Type syntax.
- array or Traversable, using the special iterable type.

However, arbitrary union types are currently not supported by the language. Instead, phpdoc annotations have to be used, such as in the following example:

```php
<?php
class Number {
    /**
     * @var int|float $number
     */
    private $number;
 
    /**
     * @param int|float $number
     */
    public function setNumber($number) {
        $this->number = $number;
    }
 
    /**
     * @return int|float
     */
    public function getNumber() {
        return $this->number;
    }
}
```
Supporting union types in the language allows us to move more type information from phpdoc into function signatures, with the usual advantages this brings:

- Types are actually enforced, so mistakes can be caught early.
- Because they are enforced, type information is less likely to become outdated or miss edge-cases.
- Types are checked during inheritance, enforcing the Liskov Substitution Principle.
- Types are available through Reflection.
- The syntax is a lot less boilerplate-y than phpdoc.

Union types support all available types, with some limitations:

- The `void` type could not be part of a union, as void means that a function [does not return any value](https://wiki.php.net/rfc/void_return_type).
- The `null` type is only supported in union types but it’s usage as a standalone type is not allowed.
- The nullable type notation `(?T)` is also allowed, meaning `T|null`, but we are not allowed to include the `?TS` notation in union types `(?T1|T2` is not allowed and we should use `T1|T2|null` instead).
- As many functions (i.e. `strpos()`, `strstr()`, `substr()`, etc.) include false among the possible return types, the `false` pseudo-type is also supported.

[TOP](#whats-new-in-php-8)

## Match expression
[TOC](#table-of-contents)

The new match is similar to switch and has the following features:

- Match is an expression, meaning its result can be stored in a variable or returned.
- Match branches only support single-line expressions and do not need a break; statement.
- Match does strict comparisons.

__In PHP 7.0__:
```php
<?php
switch (8.0) {
  case '8.0':
    $result = "Oh no!";
    break;
  case 8.0:
    $result = "This is what I expected";
    break;
}
echo $result;
//> Oh no!
```

__PHP 8.0__:
```php
<?php
echo match (8.0) {
  '8.0' => "Oh no!",
  8.0 => "This is what I expected",
};
//> This is what I expected
```

The match expression branches evaluation based on an identity check of a value. Similarly to a switch statement, a match expression has a subject expression that is compared against multiple alternatives. Unlike switch, it will evaluate to a value much like ternary expressions. Unlike switch, the comparison is an identity check `(===)` rather than a weak equality check `(==)`. Match expressions are available as of PHP 8.0.0.

__Structure of a match expression__:
```php
<?php
$return_value = match (subject_expression) {
    single_conditional_expression => return_expression,
    conditional_expression1, conditional_expression2 => return_expression,
};
?>
```

__Basic match usage__:
```php
<?php
$food = 'cake';

$return_value = match ($food) {
    'apple' => 'This food is an apple',
    'bar' => 'This food is a bar',
    'cake' => 'This food is a cake',
};

var_dump($return_value);
?>
```
The above example will output:

```
string(19) "This food is a cake"
```

__NOTE__:
1. The result of a match expression does not need to be used.
1. A match expression must be terminated by a semicolon (`;`).
1. Multiple default patterns will raise a `E_FATAL_ERROR` error.

[TOP](#whats-new-in-php-8)

## Nullsafe operator
[TOC](#table-of-contents)

Instead of null check conditions, we can now use a chain of calls with the new nullsafe operator. When the evaluation of one element in the chain fails, the execution of the entire chain aborts and the entire chain evaluates to null.

__In PHP 7.0__:

```php
<?php

$country =  null;

if ($session !== null) {
  $user = $session->user;

  if ($user !== null) {
    $address = $user->getAddress();
 
    if ($address !== null) {
      $country = $address->country;
    }
  }
}

```

__PHP 8.0__:

```php
<?php
$country = $session?->user?->getAddress()?->country;
```
In ___short-circuit evaluation___, the second operator is evaluated only if the first operator does not evaluate to null. If an operator in a chain evaluates to null, the execution of the entire chain stops and evaluates to null.

Consider the following examples from the [RFC](https://wiki.php.net/rfc/nullsafe_operator):
```php
$foo = $a?->b();
```
If `$a` is null, method `b()` isn't called and `$foo` is set to null

Chains are automatically inferred. Only the closest chain will terminate. The following examples will try to illustrate.

```php
   $foo = $a?->b();
// --------------- chain 1
//        -------- chain 2
// If $a is null chain 2 is aborted, method b() isn't called, null is assigned to $foo
 
   $a?->b($c->d());
// --------------- chain 1
//        -------  chain 2
// If $a is null chain 1 is aborted, method b() isn't called,
// the expression `$c->d()` is not evaluated
 
   $a->b($c?->d());
// --------------- chain 1
//       --------  chain 2
// If $c is null chain 2 is aborted, method d() isn't called, null is passed to `$a->b()`
```

See the [nullsafe operator RFC](https://wiki.php.net/rfc/nullsafe_operator) for additional examples, exceptions, and future scope.

[TOP](#whats-new-in-php-8)

## Saner string to number comparisons
[TOC](#table-of-contents)

When comparing to a numeric string, PHP 8 uses a number comparison. Otherwise, it converts the number to a string and uses a string comparison.

__In PHP 7.0__:
```php
0 == 'foobar' // true
```

__PHP 8.0__:
```php
0 == 'foobar' // false
```
|Comparison |Before|After|
|:-----------:|:------:|:----:|
|0 == "0"| true   | true |
|0 == "0.0"| true   | true |
|0 == "foo"| true   | false |
|0 == ""| true | false |
|42 == "   42" | true | true |
|42 == "42foo" | true | false |

This [RFC](https://wiki.php.net/rfc/string_to_number_comparison) fixes the very strange case in PHP where 0 == "foo" results in true. There are some other edge cases like that one, and this RFC fixes them.

[TOP](#whats-new-in-php-8)

## Consistent type errors for internal functions
[TOC](#table-of-contents)

Most of the internal functions now throw an Error exception if the validation of the parameters fails.
When passing a parameter of illegal type, internal and user-defined functions behave differently.

User-defined functions throw a TypeError, but internal functions behave in various ways, depending on several conditions. Anyway, the typical behavior is to throw a warning and return null. See the following example in PHP 7.4:

```php
strlen([]); // Warning: strlen() expects parameter 1 to be string, array given

array_chunk([], -1); // Warning: array_chunk(): Size parameter expected to be greater than 0

var_dump(strlen(new stdClass)); // Warning: strlen() expects parameter 1 to be string, object given
```

If `strict_types` is enabled, or argument information specifies types, the behavior would be different. In such scenarios, the type error is detected and results in a `TypeError`.

This situation would lead to a number of problems well explained in the [RFC’s issues section](https://wiki.php.net/rfc/consistent_type_errors#issues).

To remove these inconsistencies, [this RFC proposes](https://wiki.php.net/rfc/consistent_type_errors) to make the internal parameter parsing APIs to always generate a `ThrowError` in case of a parameter type mismatch.

In PHP 8, the code above throws the following error:

```
Fatal error: Uncaught TypeError: strlen(): Argument #1 ($str) must be of type string, object given in /path/to/wer/test.php:4
Stack trace:
#0 {main}
  thrown in /path/to/wer/test.php on line 4
```

[TOP](#whats-new-in-php-8)

## Type system and error handling improvements
[TOC](#table-of-contents)

- [Stricter type checks for arithmetic/bitwise operators](#stricter-type-checks-for-arithmetic-or-bitwise-operators) 
- [Abstract trait method validation](#abstract-trait-method-validation)
- [Reclassified engine warnings](#reclassified-engine-warnings)
- [Fatal error for incompatible method signatures](#fatal-error-for-incompatible-method-signatures)
- [The @ operator no longer silences fatal errors](#the-%40-operator-no-longer-silences-fatal-errors)
- [Inheritance with private methods](#inheritance-with-private-methods)
- [Mixed type](#new-mixed-type)
- [Static return type](#static-return-type)
- [Types for internal functions](#types-for-internal-functions)

### Stricter type checks for arithmetic or bitwise operators
[RFC](https://wiki.php.net/rfc/arithmetic_operator_type_checks)

Before PHP 8, it was possible to apply arithmetic or bitwise operators on arrays, resources or objects. This isn't possible anymore, and will throw a `TypeError`:

```php
[] % [42];
$object + 4;
```
### Abstract trait method validation
[RFC](https://wiki.php.net/rfc/abstract_trait_method_validation)

Traits can specify abstract methods which must be implemented by the classes using them. There's a caveat though: before PHP 8 the signature of these method implementations weren't validated. The following was valid:

```php
trait Test {
    abstract public function test(int $input): int;
}

class UsesTrait
{
    use Test;

    public function test($input)
    {
        return $input;
    }
}
```
PHP 8 will perform proper method signature validation when using a trait and implementing its abstract methods. This means we'll need to write this instead:

```php
class UsesTrait
{
    use Test;

    public function test(int $input): int
    {
        return $input;
    }
}
```
### Reclassified engine warnings
[RFC](https://wiki.php.net/rfc/engine_warnings)

Lots of errors that previously only triggered warnings or notices, have been converted to proper errors. The following warnings were changed.

- Undefined variable: warning instead of notice
- Undefined array index: warning instead of notice
- Division by zero: `DivisionByZeroError` exception instead of warning
- Attempt to increment/decrement property '%s' of non-object: `Error` exception instead of warning
- Attempt to modify property '%s' of non-object: `Error` exception instead of warning
- Attempt to assign property '%s' of non-object: `Error` exception instead of warning
- Creating default object from empty value: `Error` exception instead of warning
- Trying to get property '%s' of non-object: warning instead of notice
- Undefined property: `%s::$%s:` warning instead of notice
- Cannot add element to the array as the next element is already occupied: `Error` exception instead of warning
- Cannot unset offset in a non-array variable: `Error` exception instead of warning
- Cannot use a scalar value as an array: `Error` exception instead of warning
- Only arrays and `Traversables` can be unpacked: `TypeError` exception instead of warning
- Invalid argument supplied for foreach(): `TypeError` exception instead of warning
- Illegal offset type: `TypeError` exception instead of warning
- Illegal offset type in isset or empty: `TypeError` exception instead of warning
- Illegal offset type in unset: `TypeError` exception instead of warning
- Array to string conversion: warning instead of notice
- Resource ID#%d used as offset, casting to integer (%d): warning instead of notice
- String offset cast occurred: warning instead of notice
- Uninitialized string offset: %d: warning instead of notice
- Cannot assign an empty string to a string offset: `Error` exception instead of warning
- Supplied resource is not a valid stream resource: `TypeError` exception instead of warning

### Fatal error for incompatible method signatures
[RFC](https://wiki.php.net/rfc/lsp_errors)

From the RFC: Inheritance errors due to incompatible method signatures (LSP [Language Server Protocol] violations) currently either throw a fatal error or a warning depending on the cause of the error and the inheritance hierarchy. This RFC proposes to always throw a fatal error in PHP 8.

The following code currently generates a fatal error, because the signature of C::method() is incompatible with I::method().

```php
interface I {
    public function method(array $a);
}
class C implements I {
    public function method(int $a) {}
}
// Fatal error: Declaration of C::method(int $a) must be compatible with I::method(array $a)
```
### The @ operator no longer silences fatal errors
PHP 8.0 corrects the behavior of @ error suppression operator, where it silenced fatal errors, which lead to a script failure, because the @ operator does not prevent fatal errors, but rather hide the error message display.

### Inheritance with private methods

[RFC](https://wiki.php.net/rfc/inheritance_private_methods)

Previously, PHP used to apply the same inheritance checks on public, protected and private methods. In other words: private methods should follow the same method signature rules as protected and public methods. This doesn't make sense, since private methods won't be accessible by child classes.

This RFC changed that behaviour, so that these inheritance checks are not performed on private methods anymore. Furthermore, the use of final private function also didn't make sense, so doing so will now trigger a warning:

```
Warning: Private methods cannot be final as they are never overridden by other classes
```

```php
<?php
 
class A 
{ 
    final private function finalPrivate() { 
        echo __METHOD__ . PHP_EOL; 
    } 
} 
 
class B extends A 
{ 
    private function finalPrivate() { 
        echo __METHOD__ . PHP_EOL; 
    } 
}
```

Produces:

```
Fatal error: Cannot override final method A::finalPrivate()
```

## New `mixed` type
[RFC](https://wiki.php.net/rfc/mixed_type_v2)

Some might call it a necessary evil: the `mixed` type causes many to have mixed feelings. There's a very good argument to make for it though: a missing type can mean lots of things in PHP:

- A function returns nothing or null
- We're expecting one of several types
- We're expecting a type that can't be type hinted in PHP

Because of the reasons above, it's a good thing the `mixed` type is added. `mixed` itself means one of these types:

- `array`
- `bool`
- `callable`
- `int`
- `float`
- `null`
- `object`
- `resource`
- `string`

Note that `mixed` can also be used as a parameter or property type, not just as a return type.

Also note that since `mixed` already includes `null,` it's not allowed to make it nullable. The following will trigger an error:

```
// Fatal error: Mixed types cannot be nullable, null is already part of the mixed type.
function bar(): ?mixed {}
```
### Static return type
[RFC](https://wiki.php.net/rfc/static_return_type)

The static special class name in PHP refers to the class a method was actually called on, even if the method is inherited. This is known as "late static binding" (LSB). This RFC proposes to make static also usable as a return type (next to the already usable self and parent types).

There are a number of typical use-cases where static return types appear (currently in the form of @return static).

One are named constructors:

```php
class Test {
    public function createFromWhatever($whatever): static {
        return new static($whatever);
    }
}
```

Here we want to specify that `XXX::createFromWhatever()` will always create an instance of XXX, not of some parent class.

Another are `withXXX()` style interfaces for mutating immutable objects:

```php
class Test {
    public function withWhatever($whatever): static {
        $clone = clone $this;
        $clone->whatever = $whatever;
        return $clone;
    }
}
```
Here we want to specify that `$foobar->withWhatever()` will return a new object of class `get_class($foobar),` not of some parent class.

Finally, the likely most common use case are fluent methods:

```php
class Test {
    public function doWhatever(): static {
        // Do whatever.
        return $this;
    }
}
```
Here we actually have a stronger contract than in the previous two cases, in that we require not just an object of the same class to be returned, but exactly the same object. However, from the type system perspective, the important property we need is that the return value is an instance of the same class, not a parent class.

### Types for internal functions

[Email Thread](https://externals.io/message/106522)

Lots of people pitched in to add proper type annotations to all internal functions. This was a long standing issue, and finally solvable with all the changes made to PHP in previous versions. This means that internal functions and methods will have complete type information in reflection.

[TOP](#whats-new-in-php-8)

## Other syntax tweaks and improvements
[TOC](#table-of-contents)

- [Allow a trailing comma in parameter lists RFC and closure use lists](#trailing-comma-in-parameter-list)
- [Non-capturing catches](#non-capturing-catches)
- [Treat namespaced names as single token](#treat-namespaced-names-as-single-token)
- [Throw is now an expression](#throw-is-now-an-expression)
- [Allow `::class` syntax on objects](#allow-%3A%3Aclass-syntax-on-objects)

### Trailing Comma in Parameter List

[RFC](https://wiki.php.net/rfc/trailing_comma_in_closure_use_list)

Trailing commas are commas appended to lists of items in different contexts. PHP 7.2 introduced [trailing commas in list syntax](https://wiki.php.net/rfc/list-syntax-trailing-commas), PHP 7.3 introduced [trailing commas in function calls](https://en.wikipedia.org/wiki/Variadic_function).

PHP 8 now introduces [trailing commas in parameter lists](https://wiki.php.net/rfc/trailing_comma_in_parameter_list) with functions, methods, and closures, as shown in the following example:

```php
class Foo {
	public function __construct(
		string $x,
		int $y,
		float $z, // trailing comma
	) {
		// do something
	}
}
```

## Non-capturing catches

[RFC](https://wiki.php.net/rfc/non-capturing_catches)

Whenever we wanted to catch an exception before PHP 8, we had to store it in a variable, regardless whether we used that variable or not. With non-capturing catches, we can omit the variable, so instead of this:

```php
try {
    // Something goes wrong
} catch (MySpecialException $exception) {
    Log::error("Something went wrong");
}
```

We can now do this:

```php
try {
    // Something goes wrong
} catch (MySpecialException) {
    Log::error("Something went wrong");
}
```

Note that it's required to always specify the type, we're not allowed to have an empty catch. If we want to catch all exceptions and errors, we can use Throwable as the catching type.

### Treat namespaced names as single token
[RFC](https://wiki.php.net/rfc/namespaced_names_as_token)

PHP currently treats namespaced names like Foo\Bar as a sequence of identifiers and namespace separator tokens. This RFC proposes to treat namespaced names as a single token, and as such allow reserved keywords to appear inside them.

### Throw is now an expression
[RFC](https://wiki.php.net/rfc/throw_expression)

Since in PHP throw is a statement it makes it impossible to throw exceptions in places where only expressions are allowed, like arrow functions, the coalesce operator and the ternary/elvis operator. This RFC proposes converting the throw statement into an expression so that these cases become possible.

```php
// This was previously not possible since arrow functions only accept
// a single expression while throw was a statement.
$callable = fn() => throw new Exception();
 
// $value is non-nullable.
$value = $nullableValue ?? throw new InvalidArgumentException();
 
// $value is truthy.
$value = $falsableValue ?: throw new InvalidArgumentException();
 
// $value is only set if the array is not empty.
$value = !empty($array)
    ? reset($array)
    : throw new InvalidArgumentException();
```

There are other places where it could be used which are more controversial. These cases are allowed in this RFC.

```php
// An if statement could make the intention clearer
$condition && throw new Exception();
$condition || throw new Exception();
$condition and throw new Exception();
$condition or throw new Exception();
```

### Allow `::class` syntax on objects

[RFC](https://wiki.php.net/rfc/class_name_literal_on_object)

To fetch the name of a class, we can use the `Foo\Bar::class` syntax. This RFC proposes to extend the same syntax to objects so that it's now possible to fetch the name of the class of a given object, as shown in the example below:

```php
$object = new stdClass;
var_dump($object::class); // "stdClass"
 
$object = null;
var_dump($object::class); // TypeError
```
With PHP 8, `$object::class` provides the same result as `get_class($object)`. If $object is not an object, it throws a `TypeError` exception.

[TOP](#whats-new-in-php-8)

## New Classes, Interfaces, and Functions
[TOC](#table-of-contents)

- [Weak Map class](#weak-map-class)
- [New `Stringable` interface](#new-stringable-interface)
- [New `str_contains`, `str_starts_with`, `str_ends_with` functions](#new-str_contains%2C-str_starts_with%2C-str_ends_with-functions)

### Weak Map class

[RFC](https://wiki.php.net/rfc/weak_maps)

Weak map is a collection of data or objects in which keys are weakly referenced, which means they are not prevented from being garbage collected.

This RFC introduces a `WeakMap` class to create objects to be used as weak maps keys that can be destroyed and removed from the weak map if there aren't any further reference to the key object.

In long-running processes, this would prevent memory leaks and improve performance.

 For example, a weak map may be used to memoize a computation result:

 ```php
class FooBar {
    private WeakMap $cache;

    public function getSomethingWithCaching(object $obj) {
        return $this->cache[$obj] ??= $this->computeSomethingExpensive($obj);
    }
}
 ```

 This will invoke the computeSomethingExpensive() method only once for each object. At the same time it will also drop the cached value from the map if the object is destroyed. Doing the same with a normal array (or rather SplObjectStorage) would result in a memory leak.

Objects used as weak map keys are "weakly referenced", which means that they are not prevented from being garbage collected. If an object that is used as a weak map key is garbage collected, the key is removed from the weak map. This is illustated in the following example:

```
php > $map = new WeakMap;
php > $obj = new stdClass;
php > $map[$obj] = 42;
php > var_dump($map);
object(WeakMap)#1 (1) {
  [0]=>
  array(2) {
    ["key"]=>
    object(stdClass)#2 (0) {
    }
    ["value"]=>
    int(42)
  }
}
php > unset($obj);
php > var_dump($map);
object(WeakMap)#1 (0) {
}
```

### New `Stringable` interface

[RFC](https://wiki.php.net/rfc/stringable)

The `Stringable` interface can be used to type hint anything that implements `__toString()`. Whenever a class implements `__toString()`, it automatically implements the interface behind the scenes and there's no need to manually implement it.

```php
class Foo
{
    public function __toString(): string
    {
        return 'foo';
    }
}

function bar(string|Stringable $stringable) { /* … */ }

bar(new Foo());
bar('abc');
```

### New `str_contains`, `str_starts_with`, `str_ends_with` functions

#### `str_contains`

[RFC](https://wiki.php.net/rfc/str_contains)

`str_contains` checks if a string is contained in another string and returns a boolean value (true/false) whether or not the string was found.

```php
str_contains ( string $haystack , string $needle ) : bool
```

__Why `str_contains` introduced when php alerady has `strpos` and `strstr` functions?__

Repurposing `strpos` and `strstr` for this use-case has a few down sides. Either, they are:

- not very intuitive for a reader
- easy to get wrong (especially with the !== comparison)
- or hard to remember for new PHP developers.

#### `str_starts_with` and `str_ends_with`

[RFC](https://wiki.php.net/rfc/add_str_starts_with_and_ends_with_functions)

`str_starts_with` checks if a string begins with another string and returns a boolean value (true/false) whether it does.
`str_ends_with` checks if a string ends with another string and returns a boolean value (true/false) whether it does.

__Why this two new functions introduced?__

Typically this functionality is accomplished by using existing string functions such as `substr`, `strpos/strrpos`, `strncmp`, or `substr_compare` (often combined with `strlen`). These bespoke userland implementations have various downsides, discussed further below.

The `str_starts_with` and `str_ends_with` functionality is so commonly needed that many major PHP frameworks support it, including __Symfony, Laravel, Yii, FuelPHP, and Phalcon 1__).

Checking the start and end of strings is a very common task which should be easy. Accomplishing this task is not easy now and that is why many frameworks have chosen to include it. This is also why other high-level programming languages---as diverse as JavaScript, Java, Haskell, and Matlab---have implemented this functionality. Checking the start and end of a string should not be a task which requires pulling in a PHP framework or developing a potentially suboptimal (or worse, buggy) function in userland.

[TOP](#whats-new-in-php-8)
