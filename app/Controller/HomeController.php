<?php
namespace App\Controller;

use App\View\ViewModel;
use App\Session;
use App\Entity\CustomerAddress;

class HomeController extends AbstractLoginController
{
    public function indexAction()
    {
        return new ViewModel('home/index.phtml');
    }

    public function testAction()
    {
        echo '1';
        $customerAddress = CustomerAddress::findOneBy(1);
        $customer = $customerAddress->customer();
    }
}
