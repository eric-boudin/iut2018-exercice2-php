<?php
namespace Controller;

use Session;

class AbstractLoginController extends AbstractController
{
    public function dispatch($action)
    {
        if (!$this->isLoggedIn()) {
            $this->redirect('/login');
        }

        parent::dispatch($action);
    }

    public function isLoggedIn() : bool
    {
        return (bool) Session::getSession('user_id');
    }
}
