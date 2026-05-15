<?php

class Database {

    private $server = "localhost";
    private $database = "Corredor_Seguros";
    private $username = "sa";
    private $password = "123456";

    public $conn;

    public function connect(){

        try{

            $this->conn = new PDO(

                "sqlsrv:Server="
                .$this->server.
                ";Database="
                .$this->database,

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