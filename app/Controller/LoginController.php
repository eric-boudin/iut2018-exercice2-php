<?php
namespace Controller;

use Session;
use Entity\Customer;
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

        $password = sha1($password);
        /** @var Customer $customer */
        $customer = Customer::findOneBy([
            'email' => $email,
            'password' => $password
        ]);

        if ($customer && $customer->customer_id) {
            Session::setSession('customer_id', $customer->customer_id);
            Session::setSession('customer_email', $customer->email);
            $this->redirect('/home');
        } else {
            $this->redirect('/login');
        }
    }

    public function logoutAction()
    {
    }
}
