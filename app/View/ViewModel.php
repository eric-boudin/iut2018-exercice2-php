<?php
namespace View;

use Config;

class ViewModel
{
    private $view;
    private $parameters;

    public function __construct(string $view, array $parameters = [])
    {
        $this->view = $view;
        $this->parameters = $parameters;
    }

    public function render()
    {
        if (!Config::hasConfig('view_dir')) {
            throw new ViewDirException('Unable to find view_dir configuration.');
        }

        $file = Config::getConfig('view_dir').'/'.$this->view;

        if (file_exists($file)) {
            include $file;
        }
    }
}
