<?php
namespace Controller;

use Session;
use Entity\User;
use View\ViewModel;

class LoginController extends AbstractController
{
    public function indexAction()
    {
        return new ViewModel('login/index.phtml');
    }

    public function loginAction()
    {
        $email = $_POST['email'] ?? '';
        $password = $_POST['password'] ?? '';
        $user = new User;
        $user->email = 'denizart.benjamin@gmail.com';
        $user->password = 'test';

        if ($user->email === $email
            && $user->password = $password) {
            Session::setSession('email', $user->email);
            $this->redirect('/home');
        } else {
            $this->redirect('/login');
        }
    }

    public function logoutAction()
    {
    }
}
