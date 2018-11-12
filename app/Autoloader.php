<?php

class Autoloader
{
    public static function register()
    {
        spl_autoload_register(function ($className) {
            $className = str_replace('\\', '/', $className);
            $file = "{$className}.php";
            $filename = getcwd() . '/app/' .  $file;
            if (file_exists($filename)) {
                require_once $filename;
            }
        });
    }
}
