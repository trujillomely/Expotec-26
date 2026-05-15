<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();

define('ROOT_PATH', dirname(__DIR__));

require_once ROOT_PATH .
'/app/config/config.php';

require_once ROOT_PATH .
'/app/config/database.php';

$url = $_GET['url'] ?? 'home';

require_once ROOT_PATH .
'/app/routes/web.php';