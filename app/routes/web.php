<?php
$url = isset($_GET['url'])
    ? $_GET['url']
    : 'home';
    
switch($url){

    /*
    |--------------------------------------------------------------------------
    | HOME
    |--------------------------------------------------------------------------
    */

    case 'home':

        require_once ROOT_PATH .
        '/app/controllers/HomeController.php';

        $controller = new HomeController();

        $controller->index();

    break;

    /*
    |--------------------------------------------------------------------------
    | LOGIN
    |--------------------------------------------------------------------------
    */

    case 'login':

        require_once ROOT_PATH .
        '/app/controllers/AuthController.php';

        $controller = new AuthController();

        $controller->login();

    break;

    /*
    |--------------------------------------------------------------------------
    | AUTHENTICATE
    |--------------------------------------------------------------------------
    */

    case 'auth':

        require_once ROOT_PATH .
        '/app/controllers/AuthController.php';

        $controller = new AuthController();

        $controller->authenticate();

    break;

    /*
    |--------------------------------------------------------------------------
    | ACTIVATE ACCOUNT
    |--------------------------------------------------------------------------
    */

    case 'activate-account':

        require_once ROOT_PATH .
        '/app/controllers/AuthController.php';

        $controller = new AuthController();

        $controller->activateAccount();

    break;

    /*
    |--------------------------------------------------------------------------
    | DEFAULT
    |--------------------------------------------------------------------------
    */

    default:

        require_once ROOT_PATH .
        '/app/views/errors/404.php';

    break;
}