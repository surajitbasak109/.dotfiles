# Javascript Interview Questions

1. **[What is the difference between null and undefined?](#what-is-the-difference-between-null-and-undefined%3F)**
1. **[What is a closure and how/why would we use one?](#what-is-a-closure-and-how%2Fwhy-would-we-use-one%3F)**
1. **[What is the difference between == and ===?](#what-is-the-difference-between-%3D%3D-and-%3D%3D%3D%3F)**
1. **[What is the difference between a forEach loop and a for loop?](#what-is-the-difference-between-a-foreach-loop-and-a-for-loop%3F)**
1. **[What is a promise and how do we use it?](#what-is-a-promise-and-how-do-we-use-it%3F)**
1. **[What is the difference between synchronous and asynchronous code?](#what-is-the-difference-between-synchronous-and-asynchronous-code%3F)**
1. **[What is a pure function?](#what-is-a-pure-function%3F)**
1. **[What is "this" in JavaScript and how does it work?](#what-is-%E2%80%9Cthis%E2%80%9D-in-javascript-and-how-does-it-work%3F)**
1. **[What is the difference between let and var?](#what-is-the-difference-between-let-and-var%3F)**
1. **[How do we handle errors in JavaScript?](#how-do-we-handle-errors-in-javascript%3F)**
1. **[What is a JavaScript module and how do we use it?](#what-is-a-javascript-module-and-how-do-we-use-it%3F)**
1. **[What is the difference between a JavaScript library and a framework?](#what-is-the-difference-between-a-javascript-library-and-a-framework%3F)**
1. **[What is a JavaScript callback function and how do we use it?](#what-is-a-javascript-callback-function%2C-and-how-do-you-use-it%3F)**
1. **[What is event bubbling in JavaScript and how does it work?](#what-is-event-bubbling-in-javascript%2C-and-how-does-it-work%3F)**
1. **[How do we implement type checking in JavaScript?](#how-do-you-implement-type-checking-in-javascript%3F)**
1. **[How do we optimize the performance of a JavaScript application?](#how-do-you-optimize-the-performance-of-a-javascript-application%3F)**
1. **[What is the purpose of the "default" keyword in a JavaScript switch statement?](#what-is-the-purpose-of-the-%E2%80%9Cdefault%E2%80%9D-keyword-in-a-javascript-switch-statement%3F)**
1. **[What is a JavaScript proxy and how do we use it?](#what-is-a-javascript-proxy-and-how-do-we-use-it%3F)**
1. **[What is a JavaScript symbol and how do we use it?](#what-is-a-javascript-symbol-and-how-do-we-use-it%3F)**
1. **[What is the difference between a JavaScript class and an interface?](#what-is-the-difference-between-a-javascript-class-and-an-interface%3F)**
1. **[Why do we call JavaScript as dynamic language?](#why-do-we-call-javascript-as-dynamic-language%3F)**
1. **[how does JavaScript determine data types?](#how-does-javascript-determine-data-types%3F)**
1. **[What is typeof functions?](#what-is-typeof-functions%3F)**
1. **[How to check data type in JavaScript?](#how-to-check-data-type-in-javascript%3F)**
1. **[What are different datatypes in JavaScript?](#what-are-different-datatypes-in-javascript%3F)**
1. **[Explain Undefined Data types?](#explain-undefined-data-types%3F)**
1. **[What is Null?](#what-is-null%3F)**
1. **[Differentiate between Null and Undefined?](#differentiate-between-null-and-undefined%3F)**
1. **[Explain Hoisting?](#explain-hoisting%3F)**
1. **[Are JavaScript initialization hoisted?](#are-javascript-initialization-hoisted%3F)**
1. **[What are global variables?](#what-are-global-variables%3F)**
1. **[What are the issues with Global variables?](#what-are-the-issues-with-global-variables%3F)**
1. **[What happens when you declare variable with out VAR?](#what-happens-when-you-declare-variable-with-out-var%3F)**
1. **[What is Use Strict?](#what-is-use-strict%3F)**
1. **[How to force developers to use Var keyword?](#how-to-force-developers-to-use-var-keyword%3F)**
1. **[How can we handle Global Variables?](#how-can-we-handle-global-variables%3F)**
1. **[What are Closures?](#what-are-closures%3F)**
1. **[Why do we need Closures?](#why-do-we-need-closures%3F)**
1. **[Explain IIFE?](#explain-iife%3F)**
1. **[What is the use of IIFE?](#what-is-the-use-of-iife%3F)**
1. **[What is name collision in global scope?](#what-is-name-collision-in-global-scope%3F)**
1. **[IIFE vs Normal Function?]()**
1. **[What are design patterns?](#iife-vs-normal-function%3F)**
1. **[Which is the most used design pattern?](#which-is-the-most-used-design-pattern%3F)**
1. **[What is module Pattern and revealing module pattern?](#what-is-module-pattern-and-revealing-module-pattern%3F)**
1. **[What are the various ways to create JavaScript objects?](#what-are-the-various-ways-to-create-javascript-objects%3F)**
1. **[How can we do inheritance in JavaScript?](#how-can-we-do-inheritance-in-javascript%3F)**
1. **[What is prototype in JavaScript?](#what-is-prototype-in-javascript%3F)**
1. **[Explain Prototype chaining?](#explain-prototype-chaining%3F)**
1. **[What is Let Keyword?](#what-is-let-keyword%3F)**
1. **[Are Let variables hoisted?](#are-let-variables-hoisted%3F)**
1. **[Explain Temporal Dead Zone?](#explain-temporal-dead-zone%3F)**
1. **[What is class in ES6?](#what-is-class-in-es6%3F)**
1. **[So with class Keyword does it imply JavaScript is a OOP language?](#so-with-class-keyword-does-it-imply-javascript-is-a-oop-language%3F)**
1. **[Differentiate between class and normal function?](#differentiate-between-class-and-normal-function%3F)**
1. **[What is a Arrow function?](#what-is-a-arrow-function%3F)**
1. **[Why do we use Arrow function?](#why-do-we-use-arrow-function%3F)**
1. **[Does Arrow function create its own this?](#does-arrow-function-create-its-own-this%3F)**
1. **[Explain Synchronous execution?](#explain-synchronous-execution%3F)**
1. **[What is a call Stack?](#what-is-a-call-stack%3F)**
1. **[What is a blocking call?](#what-is-a-blocking-call%3F)**
1. **[How to avoid blocking calls?](#how-to-avoid-blocking-calls%3F)**
1. **[Explain Asynchronous execution?](#explain-asynchronous-execution%3F)**
1. **[Synch vs Asynch?](#synch-vs-asynch%3F)**
1. **[How can we do Asynch calls?](#how-can-we-do-asynch-calls%3F)**
1. **[What is a thread?](#what-is-a-thread%3F)**
1. **[Explain Multi-threading?](#explain-multi-threading%3F)**
1. **[Is JavaScript Multi-threaded?](#is-javascript-multi-threaded%3F)**
1. **[Then how does Settimeout run?](#then-how-does-settimeout-run%3F)**
1. **[What is a WebAPI/Browser API?](#what-is-a-webapi%2Fbrowser-api%3F)**
1. **[What is a Event loop and callback queue?](#what-is-a-event-loop-and-callback-queue%3F)**
1. **[What is a promise?]()**

#### What is the difference between null and undefined?

In JavaScript, null and undefined are both primitive values that represent the absence of a value or object. However, they are two distinct types of values with different meanings.

undefined is a property of the global object that represents the absence of any value. It is a value that is automatically assigned to variables that are declared but not initialized, and to function arguments that have not been passed.

```js
let x;
console.log(x); // Output: undefined

function greet(name) {
  console.log(`Hello, ${name}!`);
}

greet(); // Output: Hello, undefined!
```
`null`, on the other hand, is a value that represents the absence of an object. It is an explicit indication that an object is not present.

```js
let x = null;
console.log(x); // Output: null
```

we can use the typeof operator to determine the type of a value. For undefined it will return "undefined", and for null it will return "object".

```js
console.log(typeof undefined); // Output: "undefined"
console.log(typeof null); // Output: "object"
```

It is worth noting that null is also considered a falsy value, while undefined is not. This means that when used in a boolean context, null will be treated as false while undefined will be treated as true.

```js
if (null) {
  console.log("null is truthy");
} else {
  console.log("null is falsy"); // Output: "null is falsy"
}

if (undefined) {
  console.log("undefined is truthy"); // Output: "undefined is truthy"
} else {
  console.log("undefined is falsy");
}
```

**Summary**: Null is a value that represents the absence of a value or a null reference. It is an assignment value that means no value or object is assigned to a variable. On the other hand, undefined is a value that is automatically assigned to a variable that has not been assigned a value.

#### What is a closure and how/why would we use one?

A closure is a function that retains access to the variables of its enclosing scope even after the function has exited the scope. This means that we can use a closure to access and manipulate the variables from a parent function even after the parent function has returned.

One common use for closures is to create private variables in JavaScript. Because closures retain access to the variables of their enclosing scope, we can use them to create a variable that is only accessible within a certain block of code, but not from the outside.

Here's an example of a closure that creates a private variable counter:

```js
function counter() {
  let count = 0;
  return function() {
    return ++count;
  }
}

let increment = counter();
console.log(increment()); // Output: 1
console.log(increment()); // Output: 2
```

In the example above, the counter function returns an anonymous function that increments and returns the value of count. Because the anonymous function is a closure, it has access to the count variable even after the counter function has returned.

Closures can also be used to create functions that can be passed around and used in different contexts. For example, we can use a closure to create a function that remembers the user's name and always greets the user with the correct name:

```js
function greet(name) {
  return function() {
    console.log(`Hello, ${name}!`);
  }
}

let greetJohn = greet("John");
greetJohn(); // Output: "Hello, John!"
```

In the example above, the `greet` function returns a closure that remembers the value of name and uses it to greet the user when the closure is called.

**Summary**: A closure is a function that remembers the variables from its enclosing lexical scope, even when the function is executed outside of that scope. we would use a closure to create private variables or to create functions that have access to an outer function's variables.

#### What is the difference between == and ===?

The double assignment operattor only checks for value. It does not check for its type. For example "9" == 9 will return true. But triple assignment operator used for strict checking. It checks the value as well the type.

**Summary**: The == operator checks if the values of two operands are equal, while the === operator checks if the values and data types of the operands are equal. For example, 1 == '1' would evaluate to true, but 1 === '1' would evaluate to false because the operands are of different data types.

#### What is the difference between a forEach loop and a for loop?

A forEach loop is an array method that allows we to iterate over an array and execute a callback function for each element in the array. It is designed to be used on arrays and is not a general-purpose looping construct.

Here is an example of using a forEach loop to iterate over an array of numbers and print each number to the console:

```js
let numbers = [1, 2, 3, 4, 5];

numbers.forEach(function(number) {
  console.log(number);
});

// Output:
// 1
// 2
// 3
// 4
// 5
```

A for loop, on the other hand, is a general-purpose looping construct that allows we to specify a loop counter and execute a block of code as long as the counter meets certain conditions.

Here is the equivalent code using a for loop:

```js
let numbers = [1, 2, 3, 4, 5];

for (let i = 0; i < numbers.length; i++) {
  console.log(numbers[i]);
}

// Output:
// 1
// 2
// 3
// 4
// 5
```

One advantage of using a forEach loop is that it is easier to read and write, especially for simple loops that do not require a loop counter or complex termination conditions. However, a for loop can be more flexible and poourful, especially when we need to perform more advanced looping tasks such as looping in reverse or skipping certain iterations.

**Summary**: A forEach loop is used to iterate over an array, and it calls a provided function for each element in the array. A for loop is a more general looping construct that can be used to iterate over elements in an array or other iterable objects, as well as perform a set of statements a certain number of times.

#### What is a promise and how do we use it?

A promise is an object that represents the result of an asynchronous operation. It allows we to write asynchronous code in a way that is easier to read and reason about, by chaining async operations together using a simple, synchronous-looking syntax.

A promise has three states: pending, fulfilled, and rejected. When we create a promise, it starts in the pending state. Once the async operation is complete, the promise is either fulfilled with a value, or rejected with an error.

we use a promise by creating a new Promise object and passing it a function that contains the async operation. The function should take two arguments: resolve and reject, which are functions that we call to indicate the completion of the async operation.

Here's an example of using a promise to load a JSON file asynchronously:

```js
const loadJSON = function(url) {
  return new Promise(function(resolve, reject) {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.onload = function() {
      if (xhr.status === 200) {
        resolve(JSON.parse(xhr.responseText));
      } else {
        reject(new Error(xhr.statusText));
      }
    };
    xhr.onerror = function() {
      reject(new Error("Network error"));
    };
    xhr.send();
  });
};
```

To use the promise, we call the then method on the promise and pass it callback functions for the fulfillment and rejection cases:

```js
loadJSON("data.json")
  .then(function(data) {
    // called when the async operation is successful
    console.log(data);
  })
  .catch(function(error) {
    // called when the async operation fails
    console.error(error);
  });
```

we can also use the finally method to execute a callback regardless of whether the async operation was successful or not. This can be useful for cleaning up resources or performing other tasks that should be done regardless of the outcome of the async operation.

```js
loadJSON("data.json")
  .then(function(data) {
    console.log(data);
  })
  .catch(function(error) {
    console.error(error);
  })
  .finally(function() {
    console.log("Done!");
  });
```

**Summary**: A promise is an object that represents the result of an asynchronous operation. It has three states: pending, fulfilled, and rejected. we can use a promise to handle asynchronous results by chaining callback functions to the promise's then method, and handling any errors with the catch method.

#### What is the difference between synchronous and asynchronous code?

Synchronous code is code that is executed in a blocking manner, meaning that the interpreter will execute each line of code in order, and pause at each line until the code has completed execution. This means that the interpreter will wait for blocking operations such as reading a file from disk or waiting for a network request to complete before moving on to the next line of code.

Asynchronous code, on the other hand, is code that is executed in a non-blocking manner. This means that the interpreter will not wait for async operations to complete before moving on to the next line of code. Instead, it will start the async operation and then immediately move on to the next line of code. When the async operation is complete, a callback function is called to handle the result of the operation.

Here's an example of synchronous and asynchronous code in JavaScript:

```js
// Synchronous code

console.log("Start");

let data = readFileSync("data.txt"); // blocking operation
console.log(data);

console.log("End");

// Output:
// Start
// (contents of data.txt)
// End

// Asynchronous code

console.log("Start");

readFile("data.txt", function(error, data) { // non-blocking operation
  console.log(data);
});

console.log("End");

// Output:
// Start
// End
// (contents of data.txt)
```

Asynchronous code can be more efficient because it allows the interpreter to perform other tasks while waiting for async operations to complete. However, it can also make the code more difficult to read and debug because the flow of execution is not linear.

**Summary**: Synchronous code is code that is executed in a blocking manner, meaning that the program will wait for the synchronous code to complete before moving on to the next line of code. Asynchronous code, on the other hand, is code that is executed in a non-blocking manner, allowing the program to continue running while the asynchronous code is being executed.

#### What is a pure function?

A pure function is a function that has the following properties:

- It does not have any side effects. This means that it does not modify any external state, such as global variables or the input arguments.
- It always returns the same result for the same input. This means that the output of the function depends only on the input arguments and not on any external state or variables.
- It does not depend on any external state or variables. This means that the function does not access or modify any external state or variables, and that the result of the function is not affected by any external state or variables.

Here is an example of a pure function in JavaScript:
```js
function add(x, y) {
  return x + y;
}
```

The add function is a pure function because it does not have any side effects, it always returns the same result for the same input, and it does not depend on any external state or variables.

Pure functions have several benefits. They are easier to reason about because they have no side effects and the result of the function is determined solely by the input arguments. They are also easier to test because we can simply call the function with different input arguments and verify that the output is correct. In addition, pure functions can be optimized and cached more easily because the result of the function is determined solely by the input arguments.

__Summary__: A pure function is a function that returns the same output given the same input, and has no side effects. This means that a pure function does not modify any external state, and does not depend on any external state.

#### What is "this" in JavaScript and how does it work?

In JavaScript, this is a keyword that refers to the current context of a function. The value of this depends on how the function is called, and it can be used to access and manipulate the context in which the function is executed.

Here are a few examples of how this works in JavaScript:

```js
// In a global context, 'this' refers to the global object (window in a browser)

console.log(this); // Output: window

// In a function, 'this' refers to the global object

function foo() {
  console.log(this);
}

foo(); // Output: window

// In an object method, 'this' refers to the object

const obj = {
  name: "My object",
  sayName: function() {
    console.log(this.name);
  }
};

obj.sayName(); // Output: "My object"

// In a constructor function, 'this' refers to the new object being created

function Person(name) {
  this.name = name;
}

const person = new Person("John");
console.log(person.name); // Output: "John"
```

we can also use the bind, call, and apply methods to change the value of this when calling a function. These methods allow we to specify the value of this when calling a function, and can be useful for reusing functions in different contexts.

Here's an example of using the call method to change the value of this:

```js
function greet() {
  console.log(`Hello, ${this.name}!`);
}

const person = { name: "John" };

greet.call(person); // Output: "Hello, John!"
```

It is worth noting that in arrow functions, the value of this is lexically scoped, meaning that it is determined by the surrounding code and cannot be changed using bind, call, or apply.

__Summary__: "This" in JavaScript refers to the object that is executing the current function. The value of "this" can change depending on how the function is called. In general, "this" refers to the object that the function is a method of, but it can also be bound to a different object using the bind, call, or apply methods.

#### What is the difference between let and var?

In JavaScript, let and var are both keywords that are used to declare variables. However, they have some key differences in their behavior:

- __Scope__: The scope of a variable declared with let is limited to the block in which it is defined, while the scope of a variable declared with var is the entire enclosing function.
- __Hoisting__: Variables declared with var are hoisted to the top of their scope, meaning that they are accessible before the declaration. Variables declared with let are not hoisted, and are only accessible after the declaration.
- __Redeclaration__: we cannot redeclare a variable with let in the same block, but we can redeclare a variable with var.

Here is an example that demonstrates the difference between let and var:

```js
function foo() {
  if (true) {
    let x = 1;
    var y = 2;
  }
  console.log(x); // ReferenceError: x is not defined
  console.log(y); // Output: 2
}

foo();
```

In the example above, the `x` variable is declared with `let` and is only accessible within the block in which it is defined. When we try to access it outside of the block, a `ReferenceError` is thrown. The `y` variable, on the other hand, is declared with `var` and is accessible throughout the entire function.

It is worth noting that `let` and `const` (which declares a constant variable) oure introduced in ECMAScript 6 (also known as ECMAScript 2015), and are considered more modern alternatives to `var`. They offer more advanced features such as block-scoping and immutability, and it is generally recommended to use them instead of `var` when possible.

__Summary__: Both `let` and `var` are used to declare variables in JavaScript, but there are some key differences between the two. Var is function-scoped, meaning that the variable is only accessible within the function in which it is declared. Let is block-scoped, meaning that the variable is only accessible within the block in which it is declared. Additionally, variables declared with let are not accessible before they are declared, unlike variables declared with var.

#### How do we handle errors in JavaScript?

In JavaScript, we can use the try and catch statements to handle errors that might occur in our code. The try statement allows we to specify a block of code that might throw an error, and the catch statement allows we to handle the error if it occurs.

Here is an example of using try and catch to handle an error:

```js
try {
  // code that might throw an error
  const x = y + 1;
} catch (error) {
  // code to handle the error
  console.error(error);
}
```

In the example above, the try block contains a line of code that tries to access the y variable, which is not defined. This will cause a ReferenceError to be thrown. The catch block will catch the error and log it to the console.

we can also use the throw statement to throw our own errors. This can be useful when we want to indicate that something went wrong in our code and provide a custom error message.

Here is an example of using throw to throw a custom error:

```js
function divide(x, y) {
  if (y === 0) {
    throw new Error("Cannot divide by zero");
  }
  return x / y;
}

try {
  console.log(divide(1, 0));
} catch (error) {
  console.error(error); // Output: "Error: Cannot divide by zero"
}
```

In addition to try and catch, JavaScript also has the finally statement, which allows we to specify a block of code that should be executed whether or not an error occurs. This can be useful for cleaning up resources or performing other tasks that should be done regardless of the outcome of the code.

Here is an example of using finally to execute a cleanup function:

```js
function readFile(filename) {
  try {
    // code that might throw an error
  } catch (error) {
    // code to handle the error
  } finally {
    // code to be executed regardless of whether an error occurred
    closeFile(filename);
  }
}
```

#### What is a JavaScript module and how do we use it?
A JavaScript module is a piece of code that is executed once it is loaded.
Modules are used to organize code, create reusable components, and manage dependencies.
In JavaScript, we can use modules with a module bundler like Webpack or Rollup, or with the native JavaScript module system (ES6 modules).
To use a module, we can import it using the "import" keyword, and then use the functions or variables that the module exports.

#### What is the difference between a JavaScript library and a framework?
A JavaScript library is a collection of functions that we can call from our own code to perform a specific task.
A library is generally used to solve a specific problem or set of problems, and it is up to the developer to use the library in the right way to solve their problem.
A JavaScript framework, on the other hand, is a pre-written set of code that provides a structure for building web applications.
A framework provides a set of conventions for organizing our code and a set of tools for common tasks, and the developer is expected to follow the conventions and use the tools provided by the framework.

#### What is a JavaScript callback function, and how do you use it?
A callback function is a function that is passed as an argument to another function and is executed after the outer function has completed.
Callback functions are commonly used in JavaScript to perform tasks asynchronously, such as making an HTTP request or handling a user event.
To use a callback function, you pass it as an argument to the function that will execute it, and then define the function code in the callback.

#### What is event bubbling in JavaScript, and how does it work?
Event bubbling is a process in JavaScript where an event that is triggered on a child element will also trigger on its parent element, and then on its parent's parent, and so on up the DOM tree.
This happens because the event is "bubbled" up the DOM tree from the element on which it was triggered.
You can use event bubbling to handle events on multiple elements at once, or to handle events that are dynamically added to the DOM.

#### How do you implement type checking in JavaScript?
There are several ways to implement type checking in JavaScript. You can use the typeof operator to check the type of a value, like this:
```js
typeof myValue === 'string'
```
You can also use the instanceof operator to check if an object is an instance of a particular constructor function, like this:
```js
    myValue instanceof String
```
Or you can use the Object.prototype.toString method to check the type of an object, like this:
```js
Object.prototype.toString.call(myValue) === '[object String]'
```

#### How do you optimize the performance of a JavaScript application?
There are several ways to optimize the performance of a JavaScript application.
Some strategies include minimizing the number of function calls, minimizing the amount of DOM manipulation, and minimizing the use of complex data structures.
You can also use techniques like lazy loading, code splitting, and server-side rendering to improve the performance of your application.

#### What is the purpose of the "default" keyword in a JavaScript switch statement?
The "default" keyword in a JavaScript switch statement is used to specify a block of code that should be executed if none of the case clauses match the provided value.
The "default" keyword can be used to provide a fallback option

#### What is a JavaScript proxy and how do we use it?
A JavaScript proxy is an object that acts as an intermediary between a target object and the code that accesses it.
You can use a proxy to intercept and modify operations on the target object, such as getting or setting a property, calling a function, or constructing an object.

To use a JavaScript proxy, you create a new Proxy object and pass it the target object and a handler object as arguments.
The handler object contains methods that define the behavior of the proxy when certain operations are performed on the target object.

Here is an example of how you might use a JavaScript proxy to log all property accesses on an object:

```js
const target = {};
const handler = {
  get: function(target, key) {
    console.log(`Accessing property ${key}`);
    return target[key];
  }
};
const proxy = new Proxy(target, handler);

proxy.a = 1; // logs "Setting property a"
console.log(proxy.a); // logs "Getting property a"
```

In this example, the proxy intercepts any attempts to get or set properties on the target object and logs a message to the console. The proxy then forwards the operation to the target object, allowing the operation to be completed as normal.

#### What is a JavaScript symbol and how do we use it?
A JavaScript symbol is a primitive data type that represents a unique, non-string identifier.
Symbols are used to create unique keys for object properties, and are particularly useful for avoiding name conflicts when creating multiple properties with the same name.

To create a symbol, you use the Symbol() function, like this:

```js
const mySymbol = Symbol();
```
You can also create a symbol with a description, which is useful for debugging and can be displayed by calling the symbol's toString() method:

```js
const mySymbol = Symbol('my description');
console.log(mySymbol.toString()); // logs "Symbol(my description)"
```
To use a symbol as a property key, you can use the square bracket notation, like this:

```js
const myObject = {};
const mySymbol = Symbol();
myObject[mySymbol] = 'my value';
```
You can also use the symbol as a computed property name in an object literal, like this:

Copy code
```js
const mySymbol = Symbol();
const myObject = {
  [mySymbol]: 'my value'
};
```
Symbols are not enumerable, which means that they are not included in the default enumeration of an object's properties.
This makes them useful for creating private properties that are not accessible from outside the object.

```js
const _privateProperty = Symbol();

class MyClass {
  constructor() {
    this[_privateProperty] = 'my private value';
  }
}

const instance = new MyClass();
console.log(instance[_privateProperty]); // logs "my private value"
```

#### What is the difference between a JavaScript class and an interface?
In JavaScript, a class is a syntax for creating objects and defining their properties and methods. A class is a blueprint for creating objects, and an object created from a class is called an instance of that class. Classes are a way to define the structure and behavior of objects in a more declarative way, using syntax that is similar to object-oriented languages like Java or C#.

An interface, on the other hand, is a way to define a set of related methods that a class or object must implement. In JavaScript, interfaces are not a built-in language feature, but they can be implemented using various techniques, such as object contracts or mixins. Interfaces are used to define a common set of methods that must be implemented by any object that implements the interface, and to ensure that objects have a certain set of capabilities.

Here is an example of a class and an interface in JavaScript:

```js
// class definition
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return `(${this.x}, ${this.y})`;
  }
}

// interface definition
const M
```

__Summary:__
In JavaScript, a class is a blueprint for creating objects that defines the structure and behavior of those objects.
An interface, on the other hand, is a way to define a set of related methods that a class or object must implement in order to have certain capabilities.
Interfaces are not a built-in language feature in JavaScript, but they can be implemented using various techniques such as object contracts or mixins.

#### Why do we call JavaScript as dynamic language?
JavaScript is often referred to as a dynamic language because it can execute actions and modify the behavior of a program at runtime.
This is in contrast to static languages, which typically have to be fully compiled before they can be executed.

One of the main features that makes JavaScript a dynamic language is its ability to add or change properties and methods on objects at runtime.
For example, you can add a new property to an object like this:

```js
const myObject = {};
myObject.newProperty = 'Hello';
```

You can also modify the behavior of an object by adding or changing its methods at runtime, like this:

```js
const myObject = {
  oldMethod: function() {
    console.log('Old method');
  }
};

myObject.newMethod = function() {
  console.log('New method');
};

myObject.oldMethod = function() {
  console.log('Modified old method');
};
```

JavaScript's ability to modify the behavior of a program at runtime makes it a very flexible language, but it can also make it more difficult to reason about the behavior of a program, especially in larger code bases.

__Summary__: JavaScript is referred to as a dynamic language because it can execute actions and modify the behavior of a program at runtime.
This is in contrast to static languages, which must be fully compiled before they can be executed.
JavaScript's dynamic nature allows for flexibility in the behavior of a program, but can also make it more difficult to reason about the behavior of a program in larger code bases.

#### How does JavaScript determine data types?
In JavaScript, data types are determined automatically based on the value assigned to a variable.
JavaScript is a loosely typed or weakly typed language, which means that you do not have to explicitly specify the data type of a variable when you declare it.
Instead, the data type of the variable is determined by the value that is assigned to it.

For example, if you assign a string value to a variable, JavaScript will automatically set the data type of the variable to "string":

```js
let myVariable = 'Hello'; // data type is string
```
If you assign a numeric value to the same variable, the data type will be automatically set to "number":

```js
myVariable = 42; // data type is now number
```
JavaScript also has a few other data types, such as boolean, null, and undefined, which are determined based on the values that are assigned to them. For example, the value "null" is interpreted as the null data type, and the value "undefined" is interpreted as the undefined data type.

```js
let myVariable = null; // data type is null
myVariable = undefined; // data type is undefined
```
JavaScript also has a special data type called "object" which is used to represent more complex data structures, such as arrays and objects.

```js
let myVariable = {}; // data type is object
myVariable = []; // data type is also object
```
In JavaScript, it is possible to change the data type of a variable by reassigning a value of a different data type to it.
This is one of the characteristics of a dynamically typed language.

__Summary__: In JavaScript, data types are determined automatically based on the values assigned to variables.
JavaScript is a loosely typed or weakly typed language, meaning that the data type of a variable is determined by the value that is assigned to it.
JavaScript has several data types, including string, number, boolean, null, undefined, and object.
It is possible to change the data type of a variable in JavaScript by reassigning a value of a different data type to it.

#### What is typeof functions?
In JavaScript, the "typeof" operator is used to determine the data type of a value. The "typeof" operator returns a string that represents the data type of the value.

Here is an example of how you can use the "typeof" operator:

```js
let myValue = 'Hello';
console.log(typeof myValue); // logs 'string'

myValue = 42;
console.log(typeof myValue); // logs 'number'

myValue = true;
console.log(typeof myValue); // logs 'boolean'

myValue = {};
console.log(typeof myValue); // logs 'object'

myValue = [];
console.log(typeof myValue); // logs 'object'

myValue = null;
console.log(typeof myValue); // logs 'object'

myValue = undefined;
console.log(typeof myValue); // logs 'undefined'

myValue = function() {};
console.log(typeof myValue); // logs 'function'
```

As you can see, the "typeof" operator returns a string representation of the data type of the value. However, there are a few nuances to be aware of when using the "typeof" operator. For example, "typeof null"

#### How to check data type in JavaScript?
There are several ways to check the data type of a value in JavaScript:

1. Using the "typeof" operator: The "typeof" operator is a unary operator that returns a string representation of the data type of a value.
The "typeof" operator is generally considered the easiest way to check the data type of a value in JavaScript.

```js
let myValue = 'Hello';
console.log(typeof myValue); // logs 'string'

myValue = 42;
console.log(typeof myValue); // logs 'number'

myValue = true;
console.log(typeof myValue); // logs 'boolean'
```

2. Using the "instanceof" operator: The "instanceof" operator is used to check if an object is an instance of a particular constructor function. It returns a boolean value indicating whether or not the object is an instance of the constructor.

```js
let myValue = 'Hello';
console.log(myValue instanceof String); // logs false

myValue = new String('Hello');
console.log(myValue instanceof String); // logs true
```

3. Using the Object.prototype.toString method: The Object.prototype.toString method is a built-in method that returns a string representation of the object's data type. You can use this method to check the data type of an object by calling it with the "call" method and passing in the object as an argument.

```js
let myValue = 'Hello';
console.log(Object.prototype.toString.call(myValue)); // logs '[object String]'

myValue = 42;
console.log(Object.prototype.toString.call(myValue)); // logs '[object Number]'
```

4. Using type-checking functions: You can also define your own type-checking functions to check the data type of a value in JavaScript. These functions can use any of the methods described above, or other techniques, to determine the data type of a value.

```js
function isString(value) {
  return typeof value === 'string';
}

let myValue = 'Hello';
console.log(isString(myValue)); // logs true

myValue = 42;
console.log(isString(myValue)); // logs false
```

__Summary__: There are several ways to check the data type of a value in JavaScript: using the "typeof" operator, using the "instanceof" operator, using the Object.prototype.toString method, or using type-checking functions.
The "typeof" operator is generally considered the easiest way to check the data type of a value, while the "instanceof" operator is used to check if an object is an instance of a particular constructor function.
The Object.prototype.toString method is a built-in method that returns a string representation of the object's data type, and you can define your own type-checking functions to check the data type of a value using any of these methods or other techniques.

#### What are different datatypes in JavaScript?

In JavaScript, there are several data types that can be used to represent different kinds of values:

**String**: A string is a sequence of characters used to represent text. Strings are enclosed in single or double quotes.
```js
let myString = 'Hello';
```
**Number**: A number is a numeric value used to represent a quantity. In JavaScript, all numbers are stored as double-precision floating-point values.
```js
let myNumber = 42;
```
**Null**: The null data type represents an intentional absence of a value. It is different from undefined, which represents a value that has not been assigned.
```js
let myNull = null;
```
**Undefined**: The undefined data type represents a value that has not been assigned. When a variable is declared but not assigned a value, it is automatically assigned the value "undefined".
```js
let myUndefined;
console.log(myUndefined); // logs "undefined"
```
**Boolean**: A boolean is a value that can be either true or false. Booleans are often used in conditional statements to control the flow of a program.
```js
let myBoolean = true;
```

**Bigint**: In JavaScript, a BigInt is a new data type that represents an integer with a greater range than the standard "number" data type. BigInts can be created by using the "n" suffix after a numeric literal or by using the BigInt() function. BigInts behave similar to numbers in many ways, but there are a few differences to be aware of, such as the fact that you cannot mix BigInts and numbers in arithmetic operations and must use special methods to convert between them. BigInts are a recent addition to JavaScript and are not supported in all browsers, so you should check compatibility before using them.
```js
const bigIntValue = 123456789012345678901234567890n;
// OR
const bigIntValue = BigInt('123456789012345678901234567890');
```

**Object**: An object is a data type that represents a complex data structure. Objects can contain multiple properties and methods, and can be used to represent real-world entities or complex data structures such as arrays and dictionaries.
```js
let myObject = {};
```

**Symbol**: A symbol is a unique, non-string identifier. Symbols are used to create unique keys for object properties and are particularly useful for avoiding name conflicts when creating multiple properties with the same name.
```js
let mySymbol = Symbol();
```

Remember the following acronym:
- S => String
- N => Number
- N => Null
- U => Undefined
- B => Boolean
- O => Object

#### Explain Undefined Data types?
In JavaScript, the "undefined" data type represents a value that has not been assigned. When a variable is declared but not assigned a value, it is automatically assigned the value "undefined".

Here is an example of how you can declare a variable and assign it the value "undefined":
```js
let myVariable;
console.log(myVariable); // logs "undefined"
```
You can also explicitly assign a value of "undefined" to a variable like this:
```js
let myVariable = undefined;
console.log(myVariable); // logs "undefined"
```
It is important to note that the value "undefined" is different from the null value, which represents an intentional absence of a value.
```js
let myVariable = null;
console.log(myVariable); // logs "null"
```
You can use the "typeof" operator to determine if a value is "undefined":

```js
console.log(typeof myVariable); // logs "undefined"
```
It is generally considered a best practice to avoid using the undefined value in your code, and to instead use null to represent an absence of value. This can help to avoid confusion and make your code easier to understand.

__Summary__: In JavaScript, the "undefined" data type represents a value that has not been assigned.
When a variable is declared but not assigned a value, it is automatically assigned the value "undefined".
The value "undefined" is different from the null value, which represents an intentional absence of a value.
It is generally considered a best practice to avoid using the undefined value in your code and to instead use null to represent an absence of value.
You can use the "typeof" operator to determine if a value is "undefined".

#### What is Null?
In JavaScript, the "null" data type represents an intentional absence of a value.
It is different from the "undefined" value, which represents a value that has not been assigned.

You can assign the value "null" to a variable like this:

```js
let myVariable = null;
```
The value "null" is often used to represent an empty or unknown value. For example, you might use "null" to represent a user's age if it is unknown:

```js
let user = {
  name: 'John',
  age: null
};
```
You can use the "typeof" operator to determine if a value is "null":

```js
console.log(typeof myVariable); // logs "object"
```
Note that the "typeof" operator returns "object" for "null" values, even though "null" is a primitive data type in JavaScript.
This is a quirk of the language and is not considered a bug.

You can also use the strict equality operator (===) to check if a value is "null":

```js
console.log(myVariable === null); // logs "true"
```
The null value is often used to represent an absent or unknown value, and is a useful tool for representing missing data in your code.

#### Differentiate between Null and Undefined?
In JavaScript, "null" and "undefined" are both primitive data types that represent the absence of a value.
However, there are a few key differences between the two:

- "Undefined" represents a value that has not been assigned.
When a variable is declared but not assigned a value, it is automatically assigned the value "undefined".

```js
let myVariable;
console.log(myVariable); // logs "undefined"
```

- "Null" represents an intentional absence of a value. It is often used to represent an empty or unknown value.

```js
let myVariable = null;
```

- "Typeof null" returns "object", while "typeof undefined" returns "undefined".

```js
console.log(typeof null); // logs "object"
console.log(typeof undefined); // logs "undefined"
```

- The strict equality operator (===) treats "null" and "undefined" as different values.

```js
console.log(null === undefined); // logs "false"
```

It is important to understand the differences between "null" and "undefined" in JavaScript, as they can behave differently in certain situations and can affect the behavior of your code. In general, it is a good idea to use "null" to represent an intentional absence of a value, and to use "undefined" only when a value has not been assigned.

#### Explain Hoisting?
In JavaScript, "hoisting" refers to the behavior of variable declarations being moved to the top of their scope before code execution.

Here is an example of how hoisting works:

```js
console.log(myVariable); // logs "undefined"

var myVariable = 'Hello';
```
In this example, the declaration of the "myVariable" variable is hoisted to the top of the current scope, so the code is equivalent to the following:
```js
var myVariable;
console.log(myVariable); // logs "undefined"

myVariable = 'Hello';
```
It is important to note that hoisting only affects the declarations of variables and functions, not their assignments. In the example above, the assignment of the value "Hello" to "myVariable" is not hoisted, so the value of "myVariable" is "undefined" when it is logged to the console.

Hoisting can lead to some confusing behavior if you are not aware of it. It is generally considered a good practice to declare all variables at the top of their scope to avoid any confusion.

```js
var myVariable;

console.log(myVariable); // logs "undefined"

myVariable = 'Hello';
```

#### Are JavaScript initialization hoisted?
In JavaScript, only the declarations of variables and functions are hoisted to the top of their scope, not their assignments or initializations.

For example:
```js
console.log(myVariable); // logs "undefined"

var myVariable = 'Hello';
```
In this example, the declaration of the "myVariable" variable is hoisted to the top of the current scope, so the code is equivalent to the following:
```js
var myVariable;
console.log(myVariable); // logs "undefined"

myVariable = 'Hello';
```
As you can see, the initialization of "myVariable" with the value "Hello" is not hoisted, so the value of "myVariable" is "undefined" when it is logged to the console.

It is important to understand that hoisting only affects declarations, and not assignments or initializations. This can lead to some confusing behavior if you are not aware of it, so it is generally considered a good practice to declare all variables at the top of their scope to avoid any confusion.

```js
var myVariable;

console.log(myVariable); // logs "undefined"

myVariable = 'Hello';
```

#### What are global variables?
In JavaScript, global variables are variables that are defined outside of a function or block scope and are therefore available to be accessed and modified from anywhere in your code.

Global variables are typically declared using the "var" keyword, like this:

```js
var myGlobalVariable = 'Hello';
```
You can access global variables from anywhere in your code by simply using their names. For example:

```js
function myFunction() {
  console.log(myGlobalVariable); // logs "Hello"
}
```
It is important to note that global variables are a potentially dangerous feature of JavaScript, as they can lead to unintended side effects and make it difficult to reason about the behavior of your code. In general, it is a good practice to avoid using global variables and to instead use local variables or function arguments to pass data between functions.

You can also use the "window" object to create global variables in JavaScript. For example:

```js
window.myGlobalVariable = 'Hello';
```
This is equivalent to using the "var" keyword, but is less commonly used.

#### What are the issues with Global variables?
There are several issues with global variables in JavaScript that can make them a potentially dangerous feature of the language:

1. Global variables are accessible from anywhere in your code, which can make it difficult to reason about the behavior of your code and can lead to unintended side effects.
1. Global variables can be modified by any code in your program, which can lead to unpredictable behavior and can make it difficult to debug and maintain your code.
1. Global variables can pollute the global namespace and can cause naming conflicts with other variables or functions.
1. Global variables can make it difficult to test your code, as they can introduce dependencies between different parts of your program.

To avoid these issues, it is generally considered a good practice to avoid using global variables in your code and to instead use local variables or function arguments to pass data between functions. This can help to improve the maintainability and reliability of your code.

#### What happens when you declare variable with out VAR?
In JavaScript, when you declare a variable without using the "var" keyword, the variable is automatically created as a global variable, even if it is inside a function or block scope.

For example:

```js
function myFunction() {
  myVariable = 'Hello';
}

console.log(myVariable); // logs "Hello"
```
In this example, the "myVariable" variable is created as a global variable because it is not declared using the "var" keyword. This means that it is accessible from anywhere in your code and can be modified by any code in your program.

Declaring variables without using the "var" keyword is generally considered a bad practice, as it can lead to unintended side effects and make it difficult to reason about the behavior of your code. It is a good idea to always use the "var" keyword to explicitly declare your variables, and to avoid creating global variables whenever possible.

```js
function myFunction() {
  var myVariable = 'Hello';
}

console.log(myVariable); // logs "undefined"
```

#### What is Use Strict?
"Use strict" is a directive that can be used to enable strict mode in JavaScript. Strict mode is a way to opt in to a "restricted" variant of JavaScript that makes it easier to write "secure" JavaScript.

To use strict mode, you can include a "use strict" directive at the top of your code, like this:

```js
'use strict';

// your code goes here
```
Alternatively, you can use strict mode for an individual function by including the directive at the top of the function, like this:

```js
function myFunction() {
  'use strict';

  // your code goes here
}
```
Strict mode makes several changes to the way that JavaScript behaves, including:

- Disallowing the use of "implicit" global variables (variables that are not declared with the "var" keyword)
- Disallowing the use of certain syntax that is potentially confusing or error-prone
- Throwing more exceptions for coding mistakes

Using strict mode can help you to catch potential errors and bugs in your code, and can make your code more secure and reliable. It is generally considered a good practice to use strict mode in your code whenever possible.

#### How to force developers to use Var keyword?
There is no way to force developers to use the "var" keyword in JavaScript, as JavaScript does not have a feature like "strict mode" that can be used to enforce this behavior.

However, you can encourage developers to use the "var" keyword by establishing coding conventions and best practices for your team, and by reviewing and enforcing these conventions during code reviews.

You can also use tools like linters to automatically check for the use of the "var" keyword in your codebase. For example, you can use the JSLint or ESLint tools to automatically check for the use of implicit global variables (variables that are not declared with the "var" keyword).

Additionally, you can use strict mode to catch and prevent the use of implicit global variables. Strict mode is a way to opt in to a "restricted" variant of JavaScript that makes it easier to write "secure" code, and it disallows the use of implicit global variables.

```js
'use strict';

function myFunction() {
  // This will throw an error because "myVariable" is not declared with "var"
  myVariable = 'Hello';
}
```
By using strict mode and establishing coding conventions, you can help to encourage the use of the "var" keyword and reduce the likelihood of unintended side effects and errors in your code.

#### How can we handle Global Variables?
There are several ways to handle global variables in JavaScript:

1. Avoid using global variables whenever possible.
Instead, use local variables or function arguments to pass data between functions. This can help to reduce the likelihood of unintended side effects and can make your code easier to understand and maintain.

1. If you do need to use global variables, make sure to properly name and document them to avoid conflicts and make them easier to understand.

1. Use strict mode to catch and prevent the use of implicit global variables (variables that are not declared with the "var" keyword).
Strict mode is a way to opt in to a "restricted" variant of JavaScript that makes it easier to write "secure" code, and it disallows the use of implicit global variables.

    ```js
    'use strict';

    function myFunction() {
      // This will throw an error because "myVariable" is not declared with "var"
      myVariable = 'Hello';
    }
    ```
1. Use a tool like JSLint or ESLint to automatically check for the use of implicit global variables in your codebase.

1. Consider using a module system like CommonJS or AMD to explicitly define and manage the dependencies between different parts of your code. This can help to reduce the reliance on global variables and can make your code more modular and easier to maintain.

#### What are Closures?

In JavaScript, a closure is a function that has access to the outer variables of a function in which it was created, even after the outer function has returned.

Here is an example of a closure in JavaScript:

```js
function outerFunction(x) {
  return function innerFunction(y) {
    return x + y;
  }
}

const addFive = outerFunction(5);
console.log(addFive(3)); // logs 8
```
In this example, the "innerFunction" is a closure that has access to the "x" variable of the "outerFunction", even after the "outerFunction" has returned.
When the "addFive" function is called, it is able to access the value of "x" (5) and add it to the value of "y" (3) to produce the result (8).

Closures are a powerful feature of JavaScript and are often used to create functions that have access to private variables or to create helper functions that can be passed around and used in different contexts.
They are an important concept to understand in JavaScript, and are widely used in modern JavaScript programming.

#### Why do we need Closures?
Closures are useful in JavaScript for a number of reasons:

1. Closures allow you to create functions that have access to private variables. This can be useful for creating encapsulated, self-contained units of code that can be easily reused and tested.

1. Closures allow you to create helper functions that can be passed around and used in different contexts. This can be useful for creating functions that abstract away complex or repetitive logic, and can make your code more modular and easier to understand.

1. Closures can be used to create function factories, which are functions that create and return other functions. This can be useful for creating functions that are customized for specific use cases.

1. Closures can be used to create curried functions, which are functions that are partially applied and can be called multiple times with different arguments. This can be useful for creating more flexible and reusable functions.

Overall, closures are an important and powerful feature of JavaScript that can be used to create more modular, reusable, and flexible code.

#### Explain IIFE?
An immediately-invoked function expression (IIFE, pronounced "iffy") is a JavaScript design pattern that allows you to define and execute a function immediately, as soon as it is defined.

IIFEs are often used to create self-contained units of code that can be easily reused and tested, and to avoid creating global variables that could potentially cause naming conflicts or other unintended side effects.

Here is an example of an IIFE in JavaScript:

```js
(function () {
  // your code goes here
})();
```
In this example, the function is defined and then immediately invoked using the () operator. The function is executed as soon as it is defined, and the result of the function is discarded.

You can also pass arguments to an IIFE, like this:

```js
(function (x, y) {
  console.log(x + y);
})(5, 3); // logs 8
```
IIFEs are a useful and commonly-used pattern in JavaScript, and can be a powerful tool for creating self-contained, reusable units of code.

#### What is the use of IIFE?
There are several uses for immediately-invoked function expressions (IIFEs) in JavaScript:

1. IIFEs can be used to create self-contained units of code that can be easily reused and tested. By encapsulating your code inside an IIFE, you can avoid creating global variables that could potentially cause naming conflicts or other unintended side effects.

1. IIFEs can be used to create helper functions that can be passed around and used in different contexts. This can be useful for creating functions that abstract away complex or repetitive logic, and can make your code more modular and easier to understand.

1. IIFEs can be used to create function factories, which are functions that create and return other functions. This can be useful for creating functions that are customized for specific use cases.

1. IIFEs can be used to create curried functions, which are functions that are partially applied and can be called multiple times with different arguments. This can be useful for creating more flexible and reusable functions.

Overall, IIFEs are a useful and commonly-used pattern in JavaScript, and can be a powerful tool for creating self-contained, reusable units of code.

#### What is name collision in global scope?
In JavaScript, a name collision in the global scope occurs when two or more variables or functions in your code have the same name, and they overwrite or conflict with each other.

Name collisions can occur in the global scope (i.e., outside of any function or block scope) when you declare global variables or functions without properly checking for existing variables or functions with the same name.

For example:

```js
var myVar = 'Hello';

function myFunction() {
  console.log('Hello World');
}

// Later in your code...

var myVar = 'Goodbye';

function myFunction() {
  console.log('Goodbye World');
}
```
In this example, the second declaration of "myVar" and "myFunction" overwrite the first declarations, and the original values are lost. This can cause unexpected behavior and can make it difficult to understand and maintain your code.

To avoid name collisions in the global scope, it is a good practice to properly namespace your variables and functions and to use unique, descriptive names that are unlikely to conflict with other variables or functions. You can also use strict mode to catch and prevent the use of implicit global variables (variables that are not declared with the "var" keyword).

#### IIFE vs Normal Function?

An immediately-invoked function expression (IIFE) is a function that is defined and immediately executed as soon as it is defined. A normal function is a function that is defined and can be called at a later point in your code.

Here is an example of an IIFE in JavaScript:

```js
(function () {
  console.log('Hello World');
})();
```
And here is an example of a normal function:

```js
function myFunction() {
  console.log('Hello World');
}

myFunction();
```
The main difference between IIFEs and normal functions is that IIFEs are executed as soon as they are defined, while normal functions are not executed until they are called.

IIFEs are often used to create self-contained units of code that can be easily reused and tested, and to avoid creating global variables that could potentially cause naming conflicts or other unintended side effects. Normal functions are used to define reusable blocks of code that can be called multiple times from different parts of your code.

Overall, both IIFEs and normal functions are useful and commonly-used patterns in JavaScript, and can be used to create modular, reusable, and flexible code. The choice between using an IIFE or a normal function will depend on your specific needs and the requirements of your code.

#### Which is the most used design pattern?
It is difficult to say which design pattern is the most used, as different design patterns are used in different contexts and for different purposes.

However, some of the most commonly used design patterns in JavaScript include:

1. The module pattern, which is used to create self-contained, reusable units of code.

1. The singleton pattern, which is used to create objects with a single instance that can be shared across your code.

1. The factory pattern, which is used to create objects from a common interface, but with different implementations.

1. The observer pattern, which is used to create objects that can observe and react to changes in other objects.

1. The prototype pattern, which is used to create objects that inherit from other objects.

Overall, the choice of which design pattern to use will depend on the specific needs and requirements of your code, and there is no "one size fits all" design pattern that is suitable for all situations.

#### What is module Pattern and revealing module pattern?
The module pattern is a design pattern in JavaScript that is used to create self-contained, reusable units of code. It is based on the idea of creating a single object that contains all of the functions and variables needed for a specific task or module, and exposing only the functions and variables that should be available to the outside world.

Here is an example of the module pattern in JavaScript:

```js
const myModule = (function () {
  let privateVariable = 'Hello';

  function privateFunction() {
    console.log(privateVariable);
  }

  return {
    publicFunction: function () {
      privateFunction();
    }
  };
})();

myModule.publicFunction(); // logs 'Hello'
```
In this example, the "myModule" object contains a private variable ("privateVariable") and a private function ("privateFunction"). The private variable and function are not accessible from the outside, but the "publicFunction" is exposed and can be called from the outside.

The revealing module pattern is a variant of the module pattern that exposes only the functions and variables that should be available to the outside world, and hides the rest. It is based on the idea of revealing only the necessary functions and variables, and hiding the rest.

Here is an example of the revealing module pattern in JavaScript:

```js
const myModule = (function () {
  let privateVariable = 'Hello';

  function privateFunction() {
    console.log(privateVariable);
  }

  function publicFunction() {
    privateFunction();
  }

  return {
    publicFunction: publicFunction
  };
})();

myModule.publicFunction(); // logs 'Hello'
```
In this example, the "publicFunction" is exposed and can be called from the outside, while the "privateVariable" and "privateFunction" are hidden and are not accessible from the outside.

Both the module pattern and the revealing module pattern are useful for creating self-contained, reusable units of code, and can help to avoid naming conflicts and other unintended side effects. The choice between using the module pattern or the revealing module pattern will depend on your specific needs and the requirements of your code.

#### What are the various ways to create JavaScript objects?
There are several ways to create objects in JavaScript:

The object literal syntax is a simple and concise way to create objects. With the object literal syntax, you can create an object by enclosing a comma-separated list of key-value pairs in curly braces {}.
```js
const myObject = {
  key1: 'value1',
  key2: 'value2',
  key3: 'value3'
};
```
The object constructor syntax is a way to create objects using the "new" operator and the "Object" constructor. With the object constructor syntax, you can create an object by calling the "Object" constructor with the "new" operator and passing in any properties and methods that you want to define on the object.
```js
const myObject = new Object();
myObject.key1 = 'value1';
myObject.key2 = 'value2';
myObject.key3 = 'value3';
```
The Object.create() method is a way to create objects that have a specific prototype. With the Object.create() method, you can create an object by passing in an existing object as the prototype and any properties and methods that you want to define on the object.
```js
const myObject = Object.create(Object.prototype, {
  key1: {
    value: 'value1',
    writable: true,
    enumerable: true,
    configurable: true
  },
  key2: {
    value: 'value2',
    writable: true,
    enumerable: true,
    configurable: true
  },
  key3: {
    value: 'value3',
    writable: true,
    enumerable: true,
    configurable: true
  }
});
```
The class syntax is a way to create objects using classes and constructor functions. With the class syntax, you can create an object by defining a class with a constructor function and any methods that you want to define on the object.
```js
class MyClass {
  constructor(key1, key2, key3) {
    this.key1 = key1;
    this.key2 = key2;
    this.key3 = key3;
  }

  myMethod() {
    console.log('Hello World');
  }
}

const myObject = new MyClass("k1", "k2", "k3")
```

Using constructor function:
```js
function Person(name, age, country) {
    this.name = name;
    this.age = age;
    this.country = country;

    this.greet = function () {
        console.log("Hello, my name is " + this.name);
    }
}

const john = new Person("John Doe", 32, "USA");
john.greet();
```

#### How can we do inheritance in JavaScript?
In JavaScript, you can use the prototype chain to implement inheritance. With the prototype chain, you can create an object that inherits from another object by linking the prototype of the new object to the existing object.

Here is an example of how you can use the prototype chain to implement inheritance in JavaScript:

```js

// Define a base object

const baseObject = {
  sayHello: function() {
    console.log('Hello');
  }
};

// Define a new object that inherits from the base object
const derivedObject = Object.create(baseObject);

// The derived object has access to the sayHello method of the base object
derivedObject.sayHello(); // logs 'Hello'
```
In this example, the "derivedObject" inherits the "sayHello" method from the "baseObject" through the prototype chain. The "derivedObject" can access the "sayHello" method as if it were a property of the "derivedObject" itself.

You can also use the class syntax to implement inheritance in JavaScript. With the class syntax, you can define a base class and a derived class, and the derived class can inherit from the base class using the "extends" keyword.

Here is an example of how you can use the class syntax to implement inheritance in JavaScript:

```js
// Define a base class
class BaseClass {
  sayHello() {
    console.log('Hello');
  }
}

// Define a derived class that inherits from the base class
class DerivedClass extends BaseClass {
  sayGoodbye() {
    console.log('Goodbye');
  }
}

// Create an instance of the derived class
const derivedObject = new DerivedClass();

// The derived object has access to the sayHello and sayGoodbye
// methods of the base and derived classes
derivedObject.sayHello(); // logs 'Hello'
derivedObject.sayGoodbye(); // logs 'Goodbye'
```
Overall, there are several ways to implement inheritance in JavaScript, and the choice of which method to use will depend on your specific needs and the requirements of your code.

#### What is prototype in JavaScript?
In JavaScript, a prototype is an object that is associated with every function and object, and that serves as a fallback source of properties. When you access a property of an object, the JavaScript runtime will first check the object itself for the property, and if it is not found, it will check the object's prototype for the property. This process is called prototype inheritance.

For example:

```js
const myObject = {
  key1: 'value1'
};

console.log(myObject.key1); // logs 'value1'
console.log(myObject.key2); // logs 'undefined'

// Add a property to the object's prototype
myObject.__proto__.key2 = 'value2';

console.log(myObject.key2); // logs 'value2'
```

In this example, the "myObject" has a property called "key1", but it does not have a property called "key2". When you access the "key2" property of the "myObject", it is not found on the "myObject" itself, so the JavaScript runtime checks the "myObject"'s prototype for the property. The prototype of the "myObject" has a property called "key2", so the value of the "key2" property is found and returned.

The prototype of an object is itself an object, and it can have its own prototype, forming a prototype chain. This allows you to create a hierarchy of objects that inherit properties from each other through the prototype chain.

Overall, the prototype is an important concept in JavaScript, and it is used to implement inheritance and to add shared properties and methods to objects.

#### Explain Prototype chaining?
Prototype chaining is a technique in JavaScript that allows you to create a hierarchy of objects that inherit properties from each other through the prototype chain.

Every function and object in JavaScript has a prototype, which is an object that serves as a fallback source of properties. When you access a property of an object, the JavaScript runtime will first check the object itself for the property, and if it is not found, it will check the object's prototype for the property. This process is called prototype inheritance.

For example:

```js
const baseObject = {
  key1: 'value1'
};

const derivedObject = Object.create(baseObject);

console.log(derivedObject.key1); // logs 'value1'
console.log(derivedObject.key2); // logs 'undefined'

// Add a property to the base object
baseObject.key2 = 'value2';

console.log(derivedObject.key2); // logs 'value2'
```

In this example, the "derivedObject" inherits the "key1" property from the "baseObject" through the prototype chain. The "derivedObject" does not have a property called "key2", so the JavaScript runtime checks the "derivedObject"'s prototype (which is the "baseObject") for the property. The "baseObject" has a property called "key2", so the value of the "key2" property is found and returned.

Prototype chaining allows you to create a hierarchy of objects, with each object inheriting properties from its prototype, and its prototype inheriting properties from its own prototype, and so on. This allows you to reuse common properties and methods across a hierarchy of objects, and to add new properties and methods to the prototype of an object to make them available to all objects that inherit from it.

Overall, prototype chaining is an important technique in JavaScript, and it is used to implement inheritance and to add shared properties and methods to objects.

#### What is Let Keyword?

The "let" keyword is a new keyword in JavaScript that is used to declare variables. It is similar to the "var" keyword, but there are some key differences between the two.

One difference between "let" and "var" is that "let" variables are block-scoped, while "var" variables are function-scoped. This means that "let" variables are only accessible within the block in which they are declared, while "var" variables are accessible within the entire function in which they are declared.

For example:

```js
if (true) {
  let x = 'Hello';
  var y = 'World';
}

console.log(x); // ReferenceError: x is not defined
console.log(y); // logs 'World'
```

In this example, the "x" variable is declared with "let" and is only accessible within the block in which it is declared (the if statement). The "y" variable is declared with "var" and is accessible within the entire function in which it is declared (the global scope).

Another difference between "let" and "var" is that "let" variables cannot be re-declared within the same block, while "var" variables can be re-declared within the same function.

For example:

```js
let x = 'Hello';
let x = 'World'; // SyntaxError: Identifier 'x' has already been declared

var y = 'Hello';
var y = 'World'; // No error, y is now 'World'
```

In this example, the "x" variable is declared with "let" and is then re-declared with "let" within the same block. This causes a syntax error, because "let" variables cannot be re-declared within the same block. The "y" variable is declared with "var" and is then re-declared with "var" within the same function. This does not cause an error, and the value of the "y" variable is now "World".

Overall, the "let" keyword is a useful addition to JavaScript, and it provides a more flexible and powerful way to declare variables than the "var"

#### Are Let variables hoisted?
No, "let" variables are not hoisted in JavaScript.

In JavaScript, "hoisting" is the process of moving declarations to the top of the current scope. Declarations made with the "var" keyword are hoisted to the top of the current scope, which means that you can use a "var" variable before it is declared.

For example:

```js
console.log(x); // logs 'undefined'
var x = 'Hello';
```
In this example, the "x" variable is declared with "var" and is not initialized until later in the code. However, because "var" variables are hoisted to the top of the current scope, you can use the "x" variable before it is declared. When you access the "x" variable before it is declared, it has the value "undefined".

In contrast, "let" variables are not hoisted in JavaScript. This means that you cannot use a "let" variable before it is declared.

For example:

```js
console.log(x); // ReferenceError: x is not defined
let x = 'Hello';
```
In this example, the "x" variable is declared with "let" and is not initialized until later in the code. However, because "let" variables are not hoisted, you cannot use the "x" variable before it is declared. This causes a reference error, because the "x" variable is not defined.

Overall, the "let" keyword provides a more flexible and powerful way to declare variables than the "var" keyword, but it does not have the same hoisting behavior. It is important to be aware of the differences between "let" and "var", and to use the appropriate keyword for your specific needs.

#### Explain Temporal Dead Zone?
The temporal dead zone (TDZ) is a concept in JavaScript that refers to the period of time during which a "let" or "const" variable is declared, but not yet initialized.

In JavaScript, "let" and "const" variables are block-scoped, which means that they are only accessible within the block in which they are declared. When you declare a "let" or "const" variable, it is not initialized until the line of code in which it is declared is executed. This means that you cannot access the value of a "let" or "const" variable before it is initialized.

For example:

```js
console.log(x); // ReferenceError: x is not defined
let x = 'Hello';
```

In this example, the "x" variable is declared with "let" and is not initialized until later in the code. However, because "let" variables are block-scoped, you cannot access the "x" variable before it is initialized. This causes a reference error, because the "x" variable is not defined.

The period of time during which a "let" or "const" variable is declared, but not yet initialized, is known as the temporal dead zone. In the temporal dead zone, you cannot access the value of the "let" or "const" variable, and you cannot assign a value to the variable.

Overall, the temporal dead zone is an important concept in JavaScript, and it is important to be aware of it when working with "let" and "const" variables. It is important to initialize "let" and "const" variables as soon as they are declared, in order to avoid any issues with the temporal dead zone.

#### What is class in ES6?
In ECMAScript 6 (also known as ECMAScript 2015), a "class" is a new feature that provides a simple and familiar syntax for defining constructor functions and creating objects.

A class is defined using the "class" keyword, followed by the name of the class and a pair of curly braces. The body of the class defines the properties and methods of the class.

For example:

```js
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log(`Hello, my name is ${this.name} and I am ${this.age} years old.`);
  }
}

const person = new Person('John', 30);
person.greet(); // logs 'Hello, my name is John and I am 30 years old.'
```

In this example, the "Person" class has a constructor function that takes two arguments: "name" and "age". The constructor function sets the "name" and "age" properties of the object that is created from the class. The class also has a "greet" method that logs a message to the console.

To create an object from a class, you use the "new" operator followed by the name of the class and the arguments to pass to the constructor function. In this example, the "new Person('John', 30)" creates a new object from the "Person" class with the "name" property set to "John" and the "age" property set to "30".

Overall, the "class" syntax in ECMAScript 6 provides a simpler and more familiar way to define constructor functions and create objects in JavaScript. It is a useful addition to the language, and it is widely used in modern JavaScript development.

#### So with class Keyword does it imply JavaScript is a OOP language?
The "class" keyword in ECMAScript 6 (also known as ECMAScript 2015) provides a simple and familiar syntax for defining constructor functions and creating objects, and it is often used in object-oriented programming (OOP) in JavaScript. However, JavaScript is not a fully object-oriented language in the same way that languages like Java and C# are.

JavaScript is a prototype-based language, which means that it uses prototypes to define object behavior. In a prototype-based language, objects can inherit properties and methods from other objects through the prototype chain. This is different from a class-based language, in which objects inherit from classes and classes define the structure and behavior of objects.

The "class" syntax in ECMAScript 6 provides a more familiar and simpler way to define constructor functions and create objects in JavaScript, and it is often used in OOP in JavaScript. However, underneath the syntax, the "class" syntax is just a thin layer on top of the prototype-based nature of the language.

Overall, while the "class" syntax in ECMAScript 6 is often used in OOP in JavaScript, it is important to understand that JavaScript is not a fully class-based language like Java or C#. It is a prototype-based language that uses prototypes to define object behavior and inheritance.

#### Differentiate between class and normal function?
In JavaScript, a "class" is a type of function that is defined using the "class" keyword in ECMAScript 6 (also known as ECMAScript 2015). A normal function is a function that is defined using the "function" keyword or as an arrow function.

There are several key differences between classes and normal functions in JavaScript:

- Syntax: The syntax for defining a class is different from the syntax for defining a normal function. A class is defined using the "class" keyword, followed by the name of the class and a pair of curly braces. A normal function is defined using the "function" keyword, followed by the name of the function and a pair of parentheses.
- Constructor function: A class has a special function called the "constructor" function, which is called when an object is created from the class. The constructor function is used to initialize the object and set its properties. A normal function does not have a special constructor function.
- Inheritance: A class can inherit properties and methods from another class using the "extends" keyword. A normal function cannot inherit from another function.
- "new" operator: To create an object from a class, you use the "new" operator followed by the name of the class and the arguments to pass to the constructor function. You cannot use the "new" operator with a normal function.

Overall, there are several key differences between classes and normal functions in JavaScript. It is important to understand these differences, and to use the appropriate type of function for your specific needs.

#### What is a Arrow function?

An arrow function is a type of function in JavaScript that is defined using the "=>" syntax. Arrow functions are shorter and more concise than regular function expressions, and they have a different "this" binding than regular functions.

Here is an example of an arrow function:

```js
const greet = (name) => {
  console.log(`Hello, ${name}!`);
}

greet('John'); // logs 'Hello, John!'
```
In this example, the "greet" function is defined as an arrow function that takes one argument, "name". The arrow function has a single statement in its body, which logs a greeting to the console.

Arrow functions are shorter and more concise than regular function expressions, because they do not have a "function" keyword, a pair of parentheses around the arguments, or a pair of curly braces around the function body. Instead, the arguments are specified before the "=>" syntax, and the function body is specified after the "=>" syntax.

Arrow functions also have a different "this" binding than regular functions. In a regular function, the "this" keyword is dynamically bound to the object that calls the function. In an arrow function, the "this" keyword is lexically bound to the surrounding scope. This means that the "this" value is determined by the context in which the arrow function is defined, rather than by the object that calls the function.

Overall, arrow functions are a useful and concise way to define functions in JavaScript, and they are widely used in modern JavaScript development. It is important to understand their syntax and behavior, and to use them appropriately in your code.

#### Why do we use Arrow function?
Arrow functions are used in JavaScript for several reasons, including:

- Concise syntax: Arrow functions are shorter and more concise than regular function expressions, because they do not have a "function" keyword, a pair of parentheses around the arguments, or a pair of curly braces around the function body. This makes them easier to read and write, especially for simple functions that only have a single statement in their body.
- Lexical "this" binding: Arrow functions have a lexical "this" binding, which means that the "this" keyword is bound to the surrounding scope, rather than being dynamically bound to the object that calls the function. This can make it easier to write functions that rely on the "this" value, because you don't have to worry about the "this" value being changed by the object that calls the function.
- Improved readability: Because arrow functions are shorter and more concise than regular function expressions, they can make your code more readable, especially in situations where you are passing a function as an argument or returning a function from another function.

Overall, arrow functions are a useful and widely used feature of JavaScript, and they can make your code more concise, readable, and easier to work with. It is important to understand their syntax and behavior, and to use them appropriately in your code.

#### Does Arrow function create its own this?
No, an arrow function does not create its own "this" value. The "this" value in an arrow function is determined by the context in which the arrow function is defined, rather than by the object that calls the function.

In a regular function, the "this" keyword is dynamically bound to the object that calls the function. This means that the "this" value can change depending on how the function is called.

For example:

```js
const obj = {
  name: 'John',
  greet: function() {
    console.log(`Hello, my name is ${this.name}.`);
  }
};

obj.greet(); // logs 'Hello, my name is John.'

const greet = obj.greet;
greet(); // logs 'Hello, my name is undefined.'
```

In this example, the "greet" function is defined as a method on the "obj" object, and it logs a greeting to the console using the `this.name` property. When the "greet" method is called directly on the "obj" object, the "this" value is bound to the "obj" object, and the greeting is displayed correctly.

However, when the "greet" function is assigned to a variable and called as a standalone function, the "this" value is not bound to any object, and the `this.name` property is undefined. This is because the "this" value is dynamically bound to the object that calls the function, and in this case, there is no object calling the function.

In contrast, an arrow function has a lexical "this" binding, which means that the "this" value is determined by the context in which the arrow function is defined. The "this" value is not affected by the object that calls the function, and it is always the same within the body of the arrow function.

For example:

```js
const obj = {
  name: 'John',
  greet: () => {
    console.log(`Hello, my name is ${this.name}.`);
  }
};

obj.greet(); // logs 'Hello, my name is undefined.'

const greet = obj.greet;
greet(); // logs 'Hello, my name is undefined.'
```

In this example, the "greet" function is defined as an arrow function, and it logs a greeting to the console using the `this.name` property. When the "greet" function is called directly on the "obj" object, or when it is assigned to a variable and called as a standalone function, the "this" value is always the same (the global object), and the `this.name` property is undefined.

Overall, it is important to understand the difference between the dynamic "this" binding of regular functions and the lexical "this" binding of arrow functions. This can help you write code that relies on the "this" value more effectively and with fewer unexpected results.

#### Explain Synchronous execution?
In JavaScript, synchronous execution means that code is executed in the order that it appears, one statement at a time. When a JavaScript program runs, it starts at the top of the file and executes each statement in order, from top to bottom.

For example:
```js
console.log(1);
console.log(2);
console.log(3);
```
In this example, the three "console.log" statements will be executed in order, one after the other. The first "console.log" statement will log the value "1" to the console, the second "console.log" statement will log the value "2" to the console, and the third "console.log" statement will log the value "3" to the console.

Synchronous execution is the default behavior of JavaScript, and it is important to understand how it works, because it can affect the behavior of your code. For example, if you have a long-running operation in your code (such as a network request), it will block the execution of the rest of the code until it is complete. This can cause delays and performance issues, especially if you have multiple long-running operations in your code.

To avoid these issues, you can use asynchronous programming techniques, such as using callbacks, promises, or async/await, to execute code asynchronously and in parallel with other code. This allows you to perform long-running operations without blocking the execution of the rest of your code.

Overall, it is important to understand synchronous execution in JavaScript, and to use appropriate asynchronous programming techniques to avoid delays and performance issues in your code.

#### What is a call Stack?
A call stack is a data structure that stores information about the current state of a program's function calls. It is used to keep track of the current function being executed, as well as the functions that called it and the functions that it will call.

In JavaScript, the call stack is used to store information about the execution context of each function call. An execution context is an object that contains information about the current state of a function's execution, including the values of its variables and the current location in the code.

When a function is called, an execution context is created for the function and pushed onto the call stack. When the function returns, its execution context is removed from the call stack.

For example:

```js
function foo() {
  console.log('foo');
  bar();
}

function bar() {
  console.log('bar');
  baz();
}

function baz() {
  console.log('baz');
}

foo();
```

In this example, the "foo" function is called first, and an execution context is created for it and pushed onto the call stack. The "foo" function calls the "bar" function, and an execution context is created for it and pushed onto the call stack. The "bar" function calls the "baz" function, and an execution context is created for it and pushed onto the call stack. The "baz" function returns, and its execution context is removed from the call stack. The "bar" function returns, and its execution context is removed from the call stack. The "foo" function returns, and its execution context is removed from the call stack.

The call stack is used to keep track of the current function being executed, as well as the functions that called it and the functions that it will call. It is an important part of the JavaScript runtime, and it is used to manage the execution of functions in your code.

Overall, it is important to understand how the call stack works, because it can affect the behavior of your code, especially when dealing with recursive functions or long-running operations.


#### What is a blocking call?
A blocking call is a type of function call that stops the execution of the program until it completes. In JavaScript, blocking calls are typically used to perform synchronous operations, such as reading or writing to a file, or making a network request.

Blocking calls can be useful in certain situations, because they allow you to perform synchronous operations in a simple and straightforward way. However, they can also cause delays and performance issues, because they block the execution of the rest of the program until they complete.

For example:

```js
const fs = require('fs');

console.log('Start');

// blocking call
const data = fs.readFileSync('file.txt');

console.log('End');
```

In this example, the "readFileSync" function is a blocking call that reads the contents of a file from the file system. When it is called, the execution of the program is stopped until the file is read, and the contents of the file are stored in the "data" variable. Once the file has been read, the execution of the program continues, and the "End" message is logged to the console.

Blocking calls can cause delays and performance issues, because they block the execution of the rest of the program until they complete. This can be a problem if you have multiple blocking calls in your code, or if you have a long-running blocking call that takes a long time to complete.

To avoid these issues, you can use asynchronous programming techniques, such as using callbacks, promises, or async/await, to execute code asynchronously and in parallel with other code. This allows you to perform long-running operations without blocking the execution of the rest of your code.

Overall, it is important to understand the difference between blocking and non-blocking calls in JavaScript, and to use appropriate asynchronous programming techniques to avoid delays and performance issues in your code.

#### How to avoid blocking calls?
To avoid blocking calls in JavaScript, you can use asynchronous programming techniques, such as using callbacks, promises, or async/await.

A callback is a function that is passed as an argument to another function, and is executed after the other function has completed. Callbacks allow you to execute code asynchronously, by passing a function to be called later, rather than blocking the execution of the program until the function completes.

For example:

```js
const fs = require('fs');

console.log('Start');

// non-blocking call
fs.readFile('file.txt', (err, data) => {
  if (err) throw err;
  console.log(data);
});

console.log('End');
```

In this example, the "readFile" function is a non-blocking call that reads the contents of a file from the file system. When it is called, it takes a callback function as an argument, which will be executed once the file has been read. The "readFile" function returns immediately, and the execution of the program continues, logging the "End" message to the console. When the file has been read, the callback function is executed, and the contents of the file are logged to the console.

Promises are another way to execute code asynchronously in JavaScript. A promise represents the result of an asynchronous operation, and allows you to write code that will be executed when the operation completes, either successfully or with an error.

For example:

```js
const fs = require('fs');

console.log('Start');

// non-blocking call
const promise = fs.promises.readFile('file.txt');

promise.then((data) => {
  console.log(data);
}).catch((err) => {
  throw err;
});

console.log('End');
```
In this example, the "readFile" function returns a promise that represents the result of the file reading operation. The "then" method of the promise is used to specify a callback function that will be executed when the operation completes successfully, and the "catch" method is used to specify a callback function that will be executed if the operation fails. The "readFile" function returns immediately, and the execution of the program continues, logging the "End" message to the console. When the file has been read, the appropriate callback function is executed, and the contents of the file are logged to the console.

#### Explain Asynchronous execution?
Asynchronous execution is a type of execution in which code is executed concurrently, rather than sequentially. In JavaScript, asynchronous execution is used to perform long-running operations, such as making network requests or reading and writing to files, without blocking the execution of the rest of the program.

There are several ways to execute code asynchronously in JavaScript, including using callbacks, promises, and async/await.

A callback is a function that is passed as an argument to another function, and is executed after the other function has completed. Callbacks allow you to execute code asynchronously, by passing a function to be called later, rather than blocking the execution of the program until the function completes.

For example:

```js
const fs = require('fs');

console.log('Start');

// non-blocking call
fs.readFile('file.txt', (err, data) => {
  if (err) throw err;
  console.log(data);
});

console.log('End');
```
In this example, the "readFile" function is a non-blocking call that reads the contents of a file from the file system. When it is called, it takes a callback function as an argument, which will be executed once the file has been read. The "readFile" function returns immediately, and the execution of the program continues, logging the "End" message to the console. When the file has been read, the callback function is executed, and the contents of the file are logged to the console.

Promises are another way to execute code asynchronously in JavaScript. A promise represents the result of an asynchronous operation, and allows you to write code that will be executed when the operation completes, either successfully or with an error.

For example:

```js
const fs = require('fs');

console.log('Start');

// non-blocking call
const promise = fs.promises.readFile('file.txt');

promise.then((data) => {
  console.log(data);
}).catch((err) => {
  throw err;
});

console.log('End');
```
In this example, the "readFile" function returns a promise that represents the result of the file reading operation. The "then" method of the promise is used to specify a callback function that will be executed when the operation completes successfully, and the "catch" method is used to specify a callback function that will be executed if the operation fails. The "readFile" function returns immediately, and the execution of the program continues, logging the "End" message to the console. When the file has been read, the appropriate callback function is executed, and the contents of the file are logged to the console.

Async/await is another way to execute code asynchronously

#### Synch vs Asynch?
Synchronous execution means that code is executed in the order that it appears, one statement at a time. When a JavaScript program runs, it starts at the top of the file and executes each statement in order, from top to bottom.

For example:

```js
console.log(1);
console.log(2);
console.log(3);
```

In this example, the three "console.log" statements will be executed in order, one after the other. The first "console.log" statement will log the value "1" to the console, the second "console.log" statement will log the value "2" to the console, and the third "console.log" statement will log the value "3" to the console.

Synchronous execution is the default behavior of JavaScript, and it is important to understand how it works, because it can affect the behavior of your code. For example, if you have a long-running operation in your code (such as a network request), it will block the execution of the rest of the code until it is complete. This can cause delays and performance issues, especially if you have multiple long-running operations in your code.

Asynchronous execution, on the other hand, means that code is executed concurrently, rather than sequentially. In JavaScript, asynchronous execution is used to perform long-running operations, such as making network requests or reading and writing to files, without blocking the execution of the rest of the program.

There are several ways to execute code asynchronously in JavaScript, including using callbacks, promises, and async/await.

For example:

```js
const fs = require('fs');

console.log('Start');

// non-blocking call
fs.readFile('file.txt', (err, data) => {
  if (err) throw err;
  console.log(data);
});

console.log('End');
```

In this example, the "readFile" function is a non-blocking call that reads the contents of a file from the file system. When it is called, it takes a callback function as an argument, which will be executed once the file has been read. The "readFile" function returns immediately, and the execution of the program continues, logging the "End" message to the console. When the file has been read, the callback function is executed, and the contents of the file are logged to the console.

Overall, it is important to understand the difference between synchronous and asynchronous execution in JavaScript, and to use appropriate asynchronous programming techniques to avoid delays and performance issues in your code.

#### How can we do Asynch calls?
There are several ways to execute code asynchronously in JavaScript, including using callbacks, promises, and async/await.

A callback is a function that is passed as an argument to another function, and is executed after the other function has completed. Callbacks allow you to execute code asynchronously, by passing a function to be called later, rather than blocking the execution of the program until the function completes.

For example:

```js
const fs = require('fs');

console.log('Start');

// non-blocking call
fs.readFile('file.txt', (err, data) => {
  if (err) throw err;
  console.log(data);
});

console.log('End');
```

In this example, the "readFile" function is a non-blocking call that reads the contents of a file from the file system. When it is called, it takes a callback function as an argument, which will be executed once the file has been read. The "readFile" function returns immediately, and the execution of the program continues, logging the "End" message to the console. When the file has been read, the callback function is executed, and the contents of the file are logged to the console.

Promises are another way to execute code asynchronously in JavaScript. A promise represents the result of an asynchronous operation, and allows you to write code that will be executed when the operation completes, either successfully or with an error.

For example:

```js
const fs = require('fs');

console.log('Start');

// non-blocking call
const promise = fs.promises.readFile('file.txt');

promise.then((data) => {
  console.log(data);
}).catch((err) => {
  throw err;
});

console.log('End');
```

In this example, the "readFile" function returns a promise that represents the result of the file reading operation. The "then" method of the promise is used to specify a callback function that will be executed when the operation completes successfully, and the "catch" method is used to specify a callback function that will be executed if the operation fails. The "readFile" function returns immediately, and the execution of the program continues, logging the "End" message to the console. When the file has been read, the appropriate callback function is executed, and the contents of the file are logged to the console.

Async/await is another way to execute code asynchronously in JavaScript. Async/await allows you to write asynchronous code that looks and behaves like synchronous code, using the "async" and "await" keywords.

For example:

```js
const fs = require('fs');

async function readFile() {
  console.log('Start');

  // non-blocking call
  const data = await fs.promises.readFile('file.txt');

  console.log(data);

  console.log('End');
}

readFile();
```

In this example, the "readFile" function is an async function that reads the contents of a file from the file system using the "await" keyword. When the "await" keyword is encountered, the execution of the function is paused until the asynchronous operation completes. The "readFile" function returns a promise, and the resolved value of the promise is stored in the "data" variable. The execution of the function is then resumed

#### What is a thread?

A thread is a unit of execution that represents a flow of control within a program. It is a lightweight process that can be spawned by a program to perform a specific task, and can run concurrently with other threads within the same program.

Threads are useful for programs that need to perform multiple tasks concurrently, because they allow you to divide your code into smaller, independent units that can be executed in parallel. This can improve the performance of your program, because it allows you to take advantage of multiple CPU cores, and can also make your program more responsive, because it allows you to execute tasks in the background while the main thread of your program continues to run.

In JavaScript, the concept of threads is not explicit, because the language is single-threaded. However, JavaScript programs can still take advantage of concurrency by using asynchronous programming techniques, such as callbacks, promises, and async/await. These techniques allow you to perform long-running operations, such as making network requests or reading and writing to files, without blocking the main thread of your program.

#### Explain Multi-threading?
Multi-threading is a programming model that allows a program to perform multiple tasks concurrently, by creating and managing multiple threads of execution.

In a multi-threaded program, each thread represents a separate flow of control within the program, and can execute independently of the other threads. This allows the program to perform multiple tasks concurrently, by dividing the tasks among the different threads.

Multi-threading can improve the performance of a program, because it allows you to take advantage of multiple CPU cores, and can also make a program more responsive, because it allows you to execute tasks in the background while the main thread of the program continues to run.

However, it is important to carefully design and manage the threads in a multi-threaded program, because it can be difficult to coordinate the execution of the different threads, and to avoid conflicts and race conditions when accessing shared resources.

In JavaScript, the concept of threads is not explicit, because the language is single-threaded. However, JavaScript programs can still take advantage of concurrency by using asynchronous programming techniques, such as callbacks, promises, and async/await. These techniques allow you to perform long-running operations, such as making network requests or reading and writing to files, without blocking the main thread of your program.

#### Is JavaScript Multi-threaded?
No, JavaScript is a single-threaded language, which means that it can only execute one task at a time.

In JavaScript, all code is executed in the main thread of the program, and the language does not provide any direct means of creating or managing additional threads. This means that JavaScript programs cannot perform multiple tasks concurrently, in the sense of executing them simultaneously on different CPU cores.

However, JavaScript programs can still take advantage of concurrency by using asynchronous programming techniques, such as callbacks, promises, and async/await. These techniques allow you to perform long-running operations, such as making network requests or reading and writing to files, without blocking the main thread of your program. This allows you to write code that looks and behaves like it is executing concurrently, even though it is still running on a single thread.

Overall, it is important to understand the single-threaded nature of JavaScript, and to use appropriate asynchronous programming techniques to avoid delays and performance issues in your code.

#### Then how does Settimeout run?
The "setTimeout" function is a non-blocking function that is used to schedule a callback function to be executed after a specified delay.

In JavaScript, the "setTimeout" function works by adding the callback function to the event loop, along with a timer that counts down the specified delay. When the timer reaches zero, the callback function is placed on the callback queue, and is executed by the main thread of the program when it becomes available.

This means that the "setTimeout" function does not block the execution of the rest of the program, and the callback function is executed asynchronously, after the specified delay.

For example:

```js
console.log('Start');

setTimeout(() => {
  console.log('Timeout');
}, 1000);

console.log('End');
```

In this example, the "setTimeout" function is called with a callback function and a delay of 1000 milliseconds (1 second). The "setTimeout" function returns immediately, and the execution of the program continues, logging the "End" message to the console. After 1 second, the callback function is executed, and the "Timeout" message is logged to the console.

Overall, the "setTimeout" function is a useful tool for scheduling callback functions to be executed asynchronously in JavaScript, and can be used to avoid blocking the main thread of the program when performing long-running operations.

#### What is a WebAPI/Browser API?
A WebAPI, also known as a Browser API, is a set of programming interfaces that are built into web browsers, and allow web applications to access and interact with various resources and functionality on the client side.

WebAPIs provide web developers with a way to access and manipulate various aspects of the web browser and the operating system it is running on, such as the DOM (Document Object Model), the file system, the network, and the hardware. This allows web applications to perform a wide range of tasks, such as reading and writing to the file system, making network requests, displaying notifications, and interacting with hardware devices such as cameras and microphones.

Some examples of WebAPIs include:

- The DOM API, which allows web applications to access and manipulate the content and structure of web pages
- The Fetch API, which allows web applications to make network requests and fetch data from servers
- The File API, which allows web applications to read and write files on the client side
- The Notification API, which allows web applications to display notifications to the user
- The Geolocation API, which allows web applications to access the user's location

WebAPIs are an important part of modern web development, because they allow web applications to perform tasks that were previously only possible with native applications. They also enable web developers to build more powerful and feature-rich applications, by providing access to a wide range of resources and functionality on the client side.

#### What is a Event loop and callback queue?
The event loop and callback queue are key concepts in JavaScript that are used to manage the execution of asynchronous code.

The event loop is a mechanism that continuously checks the callback queue for pending tasks, and executes them when the main thread of the program is idle. This allows asynchronous tasks to be executed in the background, without blocking the main thread of the program.

The callback queue is a data structure that stores the callback functions that are waiting to be executed by the event loop. When an asynchronous operation completes, or a timer expires, the callback function associated with that operation is added to the callback queue. The event loop then executes the callback function when the main thread of the program is idle.

For example:

```js
console.log('Start');

setTimeout(() => {
  console.log('Timeout');
}, 1000);

console.log('End');
```
In this example, the "setTimeout" function is called with a callback function and a delay of 1000 milliseconds (1 second). The "setTimeout" function returns immediately, and the execution of the program continues, logging the "End" message to the console. The callback function is added to the callback queue, along with a timer that counts down the specified delay. When the timer reaches zero, the callback function is placed on the callback queue, and is executed by the event loop when the main thread of the program is idle.

Overall, the event loop and callback queue are important mechanisms that enable asynchronous programming in JavaScript, and allow web applications to perform tasks in the background without blocking the main thread of the program.

#### What is promise?
A promise is an object in JavaScript that represents the result of an asynchronous operation. It is a placeholder for a value that may not be available yet, and allows you to write asynchronous code that looks and behaves like synchronous code.

Promises have a state, which can be either "pending", "fulfilled", or "rejected". When a promise is "pending", it means that the asynchronous operation it represents has not yet completed. When the operation completes successfully, the promise is "fulfilled", and the resolved value is available. When the operation fails, the promise is "rejected", and the rejected value is available.

Promises are used to handle asynchronous operations in a more convenient and predictable way, by providing a standard interface for representing the result of the operation, and allowing you to attach callback functions to be executed when the promise is resolved or rejected.

For example:

```js
const promise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('Done');
  }, 1000);
});

promise.then(result => {
  console.log(result); // 'Done'
});
```
In this example, a new promise is created with a callback function that is executed after a delay of 1000 milliseconds (1 second). The callback function calls the "resolve" function with the value "Done", which fulfills the promise. The "then" method is called on the promise, with a callback function that logs the resolved value to the console. When the promise is fulfilled, the callback function is executed, and the resolved value is logged to the console.

Promises are a powerful and useful tool for managing asynchronous operations in JavaScript, and are an essential part of modern web development. They allow you to write asynchronous code that is easier to read and maintain, and provide a standard way to handle errors and exceptions in asynchronous operations.
