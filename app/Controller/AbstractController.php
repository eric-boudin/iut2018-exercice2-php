<?php
namespace Controller;

abstract class AbstractController
{
    protected $request = [];

    public function setRequest(array $request)
    {
        $this->request = $request;
    }

    public function redirect($url)
    {
        header("Location: {$url}", true, 302);
        exit;
    }
}
