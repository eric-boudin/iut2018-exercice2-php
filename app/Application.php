<?php
define('APP_ROOT', dirname(__DIR__));
use Routing\Router as R;

final class Application
{
    public function loadConfig()
    {
        $configs = include APP_ROOT . '/config/config.php';
        Config::loadConfig($configs);
    }

    public function loadRoutes()
    {
        include APP_ROOT . '/config/routes.php';
    }

    public function loadSession()
    {
        session_start();
    }

    public function dispatch()
    {
        R::dispatch(
            $_SERVER['REQUEST_URI'] ?? '',
            $_SERVER['REQUEST_METHOD'] ?? R::METHOD_GET,
            $_REQUEST
        );
    }

    public function run()
    {
        $this->loadConfig();
        $this->loadRoutes();
        $this->loadSession();
        $this->dispatch();
    }
}
