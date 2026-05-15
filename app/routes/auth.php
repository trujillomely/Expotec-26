<?php

$url = $_GET['url'] ?? '';

switch($url){

    case 'login':

        require_once
        '../app/controllers/AuthController.php';

        $controller = new AuthController();

        $controller->login();

    break;

    case 'authenticate':

        require_once
        '../app/controllers/AuthController.php';

        $controller = new AuthController();

        $controller->authenticate();

    break;

    case 'logout':

        require_once
        '../app/controllers/AuthController.php';

        $controller = new AuthController();

        $controller->logout();

    break;
}