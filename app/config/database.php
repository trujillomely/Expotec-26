<?php

class Database {

    private $server = "localhost";
    private $database = "u620489415_database";
    private $username = "u620489415_ArcoSeguros";
    private $password = "Trujillos20@7";

    public $conn;

    public function connect(){

        try{

            $this->conn = new PDO(

                "mysql:host=" . $this->server . ";dbname=" . $this->database . ";charset=utf8mb4",

                $this->username,
                $this->password

            );

            $this->conn->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );

        }catch(PDOException $e){

            die(
                "Error conexión: "
                .$e->getMessage()
            );

        }

        return $this->conn;
    }
}