<?php

class HomeController {

    public function index(){

        require_once ROOT_PATH .
        '/app/views/home/index.php';

    }

    public function acercaDe(){

        require_once ROOT_PATH .
        '/app/views/home/acerca_de.php';

    }

    public function aseguradoras(){

        require_once ROOT_PATH .
        '/app/views/home/aseguradoras.php';

    }

    public function servicios(){

        require_once ROOT_PATH .
        '/app/views/home/servicios.php';

    }

    public function contacto(){

        require_once ROOT_PATH .
        '/app/views/home/contacto.php';

    }
}
