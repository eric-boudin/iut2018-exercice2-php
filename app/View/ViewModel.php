<?php
namespace View;

use Config;

class ViewModel implements ViewModelInterface
{
    private $view;
    private $parameters;

    public function __construct(string $view, array $parameters = [])
    {
        $this->view = $view;
        $this->parameters = $parameters;
    }

    public function render() : string
    {
        if (!Config::hasConfig('view_dir')) {
            throw new ViewDirException('Unable to find view_dir configuration.');
        }

        if (!Config::hasConfig('theme_name')) {
            throw new ThemeNotFoundException('Unable to find the theme_name configuration.');
        }

        $viewDir = Config::getConfig('view_dir');
        $themeName = Config::getConfig('theme_name');
        $themeDir = "{$viewDir}/{$themeName}";

        if (!is_dir($themeDir)) {
            throw new ThemeNotFoundException("{$themeName} is not a directory.");
        }

        $file = "{$themeDir}/{$this->view}";

        if (file_exists($file)) {
            ob_start();
            include $file;
            $html = ob_get_clean();
        }

        return $html;
    }
}
