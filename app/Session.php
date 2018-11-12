<?php

class Session
{
    public static function hasSession(string $key) : bool
    {
        return isset($_SESSION[$key]);
    }

    public static function getSession(string $key, $default = null)
    {
        if (self::hasSession($key)) {
            return $_SESSION[$key];
        }
        return $default;
    }

    public static function setSession(string $key, $value)
    {
        $_SESSION[$key] = $value;
    }

    public static function unsSession(string $key)
    {
        unset($_SESSION[$key]);
    }
}
