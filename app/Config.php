<?php

class Config
{
    private static $configs;

    public static function loadConfig(array $configs)
    {
        self::$configs = $configs;
    }

    public static function hasConfig(string $key) : bool
    {
        return isset(self::$configs[$key]);
    }

    public static function getConfig(string $key, $default = null)
    {
        if (self::hasConfig($key)) {
            return self::$configs[$key];
        }
        return $default;
    }

    public static function setConfig(string $key, $value)
    {
        self::$configs[$key] = $value;
    }

    public static function unsConfig(string $key)
    {
        unset(self::$configs[$key]);
    }
}
