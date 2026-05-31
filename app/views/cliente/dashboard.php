<?php

include ROOT_PATH . '/app/views/layouts/navbar.php';

?>

<div class="container mt-5">

    <h1>Panel Cliente</h1>

    <p class="lead">Has iniciado sesión como cliente. Aquí puedes verificar que la sesión del usuario está activa.</p>

    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2>6</h2>
                    <p>Pólizas</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2>3</h2>
                    <p>Reclamos abiertos</p>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <a href="?url=logout" class="btn btn-danger">Cerrar sesión</a>
    </div>

</div>
