<?php
chdir(dirname(__DIR__));

include 'app/Autoloader.php';
\Autoloader::register();

use Routing\Router as R;

R::get(
    '/login',
    ['LoginController', 'indexAction']
);

R::post(
    '/login/post',
    ['LoginController', 'loginAction']
);

R::dispatch(
    $_SERVER['REQUEST_URI'] ?? '',
    $_SERVER['REQUEST_METHOD'] ?? R::METHOD_GET,
    $_REQUEST
);
