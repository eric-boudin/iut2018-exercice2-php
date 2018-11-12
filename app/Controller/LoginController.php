<?php
namespace Controller;

class LoginController extends AbstractController
{
    public function indexAction()
    {
        include 'view/login/index.phtml';
    }

    public function loginAction()
    {
        $this->redirect('/login');
    }

    public function logoutAction()
    {
    }
}
