<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
    content="width=device-width, initial-scale=1.0">

    <title>Login | Corredores Seguros</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
    rel="stylesheet">

    <!-- FontAwesome -->
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>

    <!-- CSS -->
    <link rel="stylesheet"
    href="assets/css/login.css">

</head>

<body>

<div class="login-container">

    <!-- LADO IZQUIERDO -->
    <div class="login-left">

        <div class="overlay"></div>

        <div class="content">

            <h1>
                Corredores<br>
                de Seguros
            </h1>

            <p>
                Protegemos lo más importante para ti,
                con soluciones de seguros confiables,
                modernas y seguras.
            </p>

        </div>

    </div>

    <!-- LADO DERECHO -->
    <div class="login-right">

        <div class="login-card">

            <div class="text-center mb-4">

                <h2>
                    Bienvenido
                </h2>

                <p>
                    Ingresa a tu cuenta
                </p>

            </div>

            <?php if(isset($_SESSION['error'])): ?>

                <div class="alert alert-danger">

                    <?= $_SESSION['error']; ?>

                </div>

            <?php unset($_SESSION['error']); endif; ?>

            <form action="?url=auth"
            method="POST">

                <!-- EMAIL -->

                <div class="input-group-custom">

                    <label>
                        Correo electrónico
                    </label>

                    <div class="input-container">

                        <i class="fa-solid fa-envelope"></i>

                        <input
                        type="email"
                        name="email"
                        placeholder="correo@ejemplo.com"
                        required>

                    </div>

                </div>

                <!-- PASSWORD -->

                <div class="input-group-custom">

                    <label>
                        Contraseña
                    </label>

                    <div class="input-container">

                        <i class="fa-solid fa-lock"></i>

                        <input
                        type="password"
                        name="password"
                        placeholder="********"
                        required>

                    </div>

                </div>

                <!-- BOTÓN LOGIN -->

                <button
                type="submit"
                class="btn-login">

                    Ingresar

                </button>

            </form>

            <!-- DIVIDER -->

            <div class="divider">

                <span>
                    o continuar con
                </span>

            </div>

            <!-- GOOGLE -->

            <button class="social-btn google-btn">

                <i class="fa-brands fa-google"></i>

                Google

            </button>

            <!-- APPLE -->

            <button class="social-btn apple-btn">

                <i class="fa-brands fa-apple"></i>

                Apple

            </button>

            <!-- LINKS -->

            <div class="login-links">

                <a href="?url=forgot-password">

                    ¿Olvidaste tu contraseña?

                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>