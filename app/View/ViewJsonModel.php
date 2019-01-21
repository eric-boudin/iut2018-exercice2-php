<?php
namespace App\View;

class ViewJsonModel implements ViewModelInterface
{
    private $parameters;
    public function __construct(array $parameters = [])
    {
        $this->parameters = $parameters;
    }

    public function render() : string
    {
        return json_encode($this->parameters);
    }
}
