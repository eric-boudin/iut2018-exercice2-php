<?php
namespace Controller;

use View\ViewModel;
use Session;

class HomeController extends AbstractLoginController
{
    public function indexAction()
    {
        return new ViewModel('home/index.phtml');
    }
}
