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
        /** @var User $user */
        $user = User::findOneBy([
            'email' => $email,
            'password' => sha1($password)
        ]);

        if ($user->user_id) {
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
