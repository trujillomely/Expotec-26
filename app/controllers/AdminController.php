<?php

class AdminController {

    public function dashboard(){
        if(!isset($_SESSION['id_user'])){
            header('Location: ?url=login');
            exit;
        }

        require_once ROOT_PATH . '/app/views/admin/dashboard.php';
    }

    public function users(){
        if(!isset($_SESSION['id_user'])){
            header('Location: ?url=login');
            exit;
        }

        require_once ROOT_PATH . '/app/views/admin/users.php';
    }

    public function roles(){
        if(!isset($_SESSION['id_user'])){
            header('Location: ?url=login');
            exit;
        }

        require_once ROOT_PATH . '/app/views/admin/roles.php';
    }

    public function permissions(){
        if(!isset($_SESSION['id_user'])){
            header('Location: ?url=login');
            exit;
        }

        require_once ROOT_PATH . '/app/views/admin/permissions.php';
    }
}
