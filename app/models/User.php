<?php

require_once '../app/config/database.php';

class User {

    private $conn;

    private $table = "[user]";

    public function __construct(){

        $database = new Database();
        $this->conn = $database->connect();

    }

    public function findByEmail($email){

        $query = "
            SELECT
                u.*,
                r.name AS role_name
            FROM [user] u
            INNER JOIN [role] r
                ON u.id_role = r.id_role
            WHERE u.email = :email
            AND u.status = 1
        ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':email', $email);

        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}