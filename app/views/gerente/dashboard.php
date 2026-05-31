<?php

include ROOT_PATH . '/app/views/layouts/navbar.php';

?>

<div class="container mt-5">

    <h1>Panel Gerente</h1>

    <p class="lead">Has iniciado sesión como gerente. Usa este panel para probar el acceso de ese rol.</p>

    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2>34</h2>
                    <p>Clientes activos</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2>12</h2>
                    <p>Solicitudes pendientes</p>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <a href="?url=logout" class="btn btn-danger">Cerrar sesión</a>
    </div>

</div>
