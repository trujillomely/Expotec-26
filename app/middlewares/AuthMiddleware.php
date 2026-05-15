<?php

if(!isset($_SESSION['id_user'])){

    header('Location: ?url=login');
    exit;
}