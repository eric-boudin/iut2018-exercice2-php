<?php
namespace Controller;

use View\ViewModel;
use Session;

class HomeController extends AbstractController
{
    public function indexAction()
    {
        return new ViewModel('home/index.phtml');
    }
}
