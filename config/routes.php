<?php
use Routing\Router as R;

R::get(
    '/login',
    ['LoginController', 'indexAction']
);

R::post(
    '/login/post',
    ['LoginController', 'loginAction']
);

R::get(
    '/home',
    ['HomeController', 'indexAction']
);
