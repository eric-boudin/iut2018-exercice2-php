<?php
chdir(dirname(__DIR__));

include 'app/Autoloader.php';
\Autoloader::register();

(new \Application)->run();

// Créer un système de thème
// Basculer toutes les vues actuelles dans un dossier view/boostrap
// Configurer l'application pour qu'elle utilise le thème bootstrap
// config.php: theme_name
