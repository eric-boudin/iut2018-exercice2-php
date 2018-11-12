<?php
namespace Controller;

use Session;

class HomeController extends AbstractController
{
    public function indexAction()
    {
        include 'view/home/index.phtml';
    }
}
