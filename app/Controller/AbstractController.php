<?php
namespace Controller;

use View\ViewModelInterface;

abstract class AbstractController
{
    protected $request = [];

    public function setRequest(array $request)
    {
        $this->request = $request;
    }

    public function dispatch($action)
    {
        $result = $this->$action();
        if ($result instanceof ViewModelInterface) {
            echo $result->render();
        }
    }

    public function redirect($url)
    {
        header("Location: {$url}", true, 302);
        exit;
    }
}
