<?php
namespace Tests;

trait CreatesApplication
{
    /**
     * Creates the application.
     *
     */
    public function createApplication()
    {
        (new \App\Application)->bootstrap();
    }
}
