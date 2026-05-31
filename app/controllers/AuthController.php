<?php

require_once ROOT_PATH . '/app/models/User.php';

class AuthController {

    public function login(){

        require_once ROOT_PATH . '/app/views/auth/login.php';

    }

    public function authenticate(){

        if($_SERVER['REQUEST_METHOD'] == 'POST'){

            $email = trim($_POST['email']);
            $password = trim($_POST['password']);

            $userModel = new User();

            $user = $userModel->findByEmail($email);

            // VALIDAR USUARIO

            if(!$user){

                $_SESSION['error'] =
                "Correo no registrado";

                header('Location: ?url=login');
                exit;
            }

            // VALIDAR PASSWORD

            if(!password_verify(
                $password,
                $user['password_hash']
            )){

                $_SESSION['error'] =
                "Contraseña incorrecta";

                header('Location: ?url=login');
                exit;
            }

            // CREAR SESIÓN

            $_SESSION['id_user'] = $user['id'];

            $_SESSION['name'] =
            $user['username'];

            $_SESSION['lastname'] =
            $user['lastname'];

            $_SESSION['email'] =
            $user['email'];

            $_SESSION['role'] =
            $user['role_name'];

            $_SESSION['role_id'] =
            $user['role_id'];

            $_SESSION['avatar'] =
            $user['avatar_url'];

            // REDIRECCIONAR SEGÚN ROL

            switch($user['role_id']){

                case 1:
                    header(
                        'Location: ?url=admin/dashboard'
                    );
                break;

                case 2:
                    header(
                        'Location: ?url=gerente/dashboard'
                    );
                break;

                default:
                    header(
                        'Location: ?url=cliente/dashboard'
                    );
                break;
            }

            exit;

        }

        header('Location: ?url=login');
        exit;

    }
    public function activateAccount(){

    require_once ROOT_PATH .
    '/app/views/auth/activate_account.php';

}                
    public function logout(){

        session_destroy();

        header('Location: ?url=login');
        exit;
    }
}