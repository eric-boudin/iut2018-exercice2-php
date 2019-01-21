<?php
namespace App\Routing;

use RuntimeException;

class Router
{
    const METHOD_GET = 'GET';
    const METHOD_POST = 'POST';

    private static $routes = [];

    public static function get(string $routeName, $callable)
    {
        self::addRoute([self::METHOD_GET], $routeName, $callable);
    }

    public static function post(string $routeName, $callable)
    {
        self::addRoute([self::METHOD_POST], $routeName, $callable);
    }

    private static function addRoute(array $methods, string $routeName, $callable)
    {
        self::$routes[$routeName] = [
            'methods' => $methods,
            'callable' => $callable
        ];
    }

    public static function dispatch(string $requestUri, string $requestMethod, array $request = [])
    {
        foreach (self::$routes as $routeName => $routeParams) {
            if ($routeName !== $requestUri) {
                continue;
            }
            if (!in_array($requestMethod, $routeParams['methods'])) {
                continue;
            }
            $className = "\\App\\Controller\\{$routeParams['callable'][0]}";
            if (!class_exists($className)) {
                throw new RuntimeException("Controller {$className} not found.");
            }
            $controller = new $className();
            $method = $routeParams['callable'][1];
            if (!method_exists($controller, $method)) {
                throw new RuntimeException("Controller {$className}->{$method}() not found.");
            }
            if ($controller instanceof \Controller\AbstractController) {
                $controller->setRequest($request);
            }
            $controller->dispatch($method);
        }
    }
}
