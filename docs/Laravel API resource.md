# Introduction
When building an API, you may need a transformation layer that sits between your Eloquent models and the JSON responses that are actually rturned to your application's users. For example, you may wish to display certain attributes for a subset of users and not others, or you may wish to always include certain relationships in the JSOn representation of your models. Eloquent's resource classes alow you to expressively and easily transform your models and model collections into JSON.

Of course, you may always convert Eloquent models or collections to JSON using their toJSON methods, however, Eloquent resources provide more granular and robus control over the JSON serializationo f your models and their relationships.

# Generating Resources
To generate a resource class, you may use the make:resource Artisan command. By default, resources will be placed in the `app/Http/Resources` directory of your application. Resources extend the `Illuminate\http\Resources\Json\JsonResource` class:

```bash
php artisan make:resource UserResource
```

## Resource Collections
In addition to generating resources that transform individual models, you may generate resources that are responsible for transofrming collections of models. This allows your JSON responses to include links and other meta information that is relevant to an entire collection of a given resource.


to create a resource collection, you should use the --collection flag when crating the resource. Or, including the word `collection` in the resource name will indicate to Laravel that it should create a collection resource. Collection resources extend the `Illuminate\Http\Resources\Json\ResourceCollection` class:

```bash
php artisan make:resource User --collection

php artisan make:resource UserCollection
```

# Concept Overview

This is a high-level overview of resources and resource collections. You are highly encouraged to read the other sectionsof this documentation to gain a deeper understanding of the customization and power offered to you by resources.

Before diving into all of the options available to you when writing resources, let's first take a hight-level look at how resources are used within Laravel. A resource class represents a single model that needs to be transformed into a JSON structure. For example, here is a simple `UserResource` resource class:

```php
<?php

namespace App\Http\Resoures;

use Illuminate\Http\Resoures\Json\JsonResource;

class UserResource extends JsonResource
{
	/**
	 * Transform the resource into an array.
	 * 
	 * @param \Illuminate\Http\Request	$request
	 * @return array
	 */
	public function toArray($request)
	{
		return [
			'id' => $this->id,
			'name' => $this->name,
			'email' => $this->email,
			'created_at' => $this->creaed_at,
			'updated_at' => $this->updated_at
		];
	}
}
```

Every resource class defines a toArray method which returns the array of attributetes that should be converted to JSON when the resource is returned as a response from a route or controller method.

Note that we can access model properties directly from the `$this` variable. This is because a resource class will automatically proxy property and method access down to the underlying model for convenient access. Once the resource is defined, it may be returned from a route or controller. The resource accepts the underlying model instance via its constructor:

```php
<?php
use App\Http\Resources\UserResource;
use App\Models\User;

Route::get('/user/{id}', function ($id) {
    return new UserReousrce(User::findOrFail($id));
});
```

# Resource Collections
If you are returning a collectiono f resources or a paginated rsponse, you should use the `collection` method provided by your resource clss when creating the resource instance in your route or controller:

```php
<?php
use App\Http\Resurces\UserResource;
use App\Models\User;

Route::get('/users', function () {
    return UserResource::collection(User::all());
});
```

Note that this does not allow any additiono f custom meta data that may need to be returned with your collection. If you would like to customize the resource collection response, you may create a dedicated resource to represent the collection:

```bash
php artisan make:resource UserCollection
```

Once the resource collection class has been generated, you may easily define any meta data that should be included with the response:

```php
<?php

namespace App\Http\Resource;

use Illuminate\Http\Resources\Json\ResourceCollection;

class UserCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array
     *
     * @param   \Illuminate\Http\Request    $request
     * @return array
     */
     public function toArray($request)
     {
        return [
            'data' => $this->collection,
            'links' => [
                'self' => 'link-value',
            ],
        ];
      }
}
```

After defining your resource collection, it may be returned from a route or controller:

```php
<?php

use App\Http\Resources\UserCollection;
use App\Models\User;

Route::get('/users', function () {
    return new UserCollection(User::all());
});
```

# Preserving Collection Keys
When returning a resource collection from a route, Laravel resets the collection's keys so that they are in numberical order. However, you may add a `preserveKeys` property to your resource class indicating whether a collection's original keys should be preserved:

```php
<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Indicates if the resource's collection keys should be preserved
     * @var bool
     */
     public $preserveKeys = true;
}
```

When the `preserveKeys` property is set to `true`, collection keys will be preserved when the collection is returned from a route or controller:

```php
<?php
use App\Http\Resources\UserResource;
use App\Models\User;

Route::get('/users', function () {
    return UserResource::collection(User::all()->keyBy->id);
});
```

# Customizing The Underlying Resource Classs
Typically, the `$this->collection` property of a resource collection is automatically populated with the result of mapping each item of the collection to its singular resource class. The singular resource class is assumed to be the collection's class name without the trailing `collection` portion of the class name. In addition, depending on your personal preference, the singular resource class may or may not be suffixed with `Reousrce`.

for example, `UserCollection` will attempt to map the given user instances into the `UserResource` resource. To customize this behavior, you may override the `$collects` property of your resource collection:

```php
<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResorceCollection;

class usercollection extends Resourcecollection
{
    /**
    * The resource that this resource collects.
    *
    * @var string
    */
    public $collects = Member::class;
}
```

# Writing Resources
In essence, resources are simple. They olny need to transform a given model into an array. So, each resource contains a `toArray` method which translate your model's attributes into an API friendly array that can be returned from your application's routes or controllers:

```php
<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\http\Request  $request
     * @return array
     */
     public function toArray($request)
     {
            return [
                'id' => $this->id,
                'name' => $this->name,
                'email' => $this->email,
                'created_at' => $this->created_at,
                'updated_at' => $this->updated_at,
            ];
     }
}
```

Once a resource been defined, it may be returned directly from a route or controller:

```php
<?php

use App\Http\Resources\UserResource;
use App\Models\User;

Route::get('/user/{id}', function ($id) {
    return new UserResource(User::findOrFail($id));
});
```

## Relationships
If you would like to include related resources in your response, you may add them to the array returned by your resource's `toArray` method. In this example, we will use the `PostResource` resource's `collection` method to add the user's blog posts to the resource response:

```php
<?php
use App\Http\Resources\PostResource;

/**
 * Transform the resource into an array.
 *
 * @param \Illuminate\Http\Request  $request
 * @return array
 */
 public function toArray($request)
 {
    return [
        'id' => $this->id,
        'name' => $this->name,
        'email' => $this->email,
        'posts' => PostResource::collection($this->posts),
        'created_at' => $this->created_at,
        'updated_at' => $this->updated_at,
    ];
 }
```

# Resoure Collections
While resoures transform a single model into an array, resource collections transform a collection of models into an array. However, it is not absolutely necessary to define a resource collection class for each one of your models since all resources provide a `collection` method to generate an "ad-hoc" resource collection on the fly:

```php
<?php

use App\Http\Resources\UserResource;
use App\Models\User;

Route::get('/users', function () {
    return UserResource::collection(User::all());
});
```

However, if you need to customize the meta data returned with the collection, it is necessary to define your own resource collection:

```php
<?php

namespace App\Http\Resoures;

use Illuminate\Http\Resources\Json\ResourceCollection;

class UserCollection exends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param \Illuminate\Http\Request  $request
     * @return array
     */
     public function toArray($request)
     {
        return [
            'data' => $this->collection,
            'links' => [
                'self' => 'link-value'
            ],
        ];
     }
}
```

Like singular resources, resource collections may be returned directly from routes or controllers:

```php
<?php

use App\Http\Resources\UserCollection;
use App\Models\User;

Route::get('/users', function () {
    return new UserCollection(User::all());
});
```

# Data wrapping
By default, your outermost resource is wrapped in a `data` key when the resoure response is converted to JSON. So, for example, a typical resource collection response looks like the following:

```json
{
    "data": [
        {
            "id": 1,
            "name": "Eladio Schroder Sr.",
            "email": "therese28@example.com"
        },
        {
            "id": 2,
            "name": "Liliana Mayert",
            "email": "evandervort@example.com"
        }
    ]
}
```

If you would like to use a custom key instead of `data`, you may define a `@wrap` attribute on the resource class:

```php
<?php

