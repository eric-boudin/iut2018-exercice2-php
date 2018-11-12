<?php
chdir(dirname(__DIR__));

include 'app/Autoloader.php';
\Autoloader::register();

(new \Application)->run();
