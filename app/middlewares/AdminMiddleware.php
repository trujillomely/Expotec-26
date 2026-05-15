<?php

if(!isset($_SESSION['rol'])){

    header('Location: ?url=login');

}

if($_SESSION['rol'] != 'admin'){

    require_once '../app/views/errors/403.php';
    exit;

}