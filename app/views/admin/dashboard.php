<?php

include ROOT_PATH . '/app/views/layouts/navbar.php';

?>

<div class="container mt-5">

    <h1>
        Panel Administrador
    </h1>

    <div class="row mt-4">

        <div class="col-md-3">

            <div class="card shadow text-center">

                <div class="card-body">

                    <h2>120</h2>

                    <p>Usuarios</p>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card shadow text-center">

                <div class="card-body">

                    <h2>50</h2>

                    <p>Pólizas</p>

                </div>

            </div>

        </div>

    </div>

    <div class="mt-4">
        <a href="?url=logout" class="btn btn-danger">Cerrar sesión</a>
    </div>

</div>