<?php

class ClienteController {

    public function dashboard(){
        if(!isset($_SESSION['id_user'])){
            header('Location: ?url=login');
            exit;
        }

        require_once ROOT_PATH . '/app/views/cliente/dashboard.php';
    }
}
