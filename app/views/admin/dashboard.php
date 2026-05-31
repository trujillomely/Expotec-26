<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Administrador | Arco Seguros</title>
    <link rel="stylesheet" href="assets/css/panel.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<div class="panel-layout">
    <?php include ROOT_PATH . '/app/views/layouts/sidebar_admin.php'; ?>

    <main class="panel-main">
        <header class="panel-topbar">
            <button class="sidebar-toggle" type="button" aria-label="Abrir menú"><i class="bi bi-list"></i></button>
            <div>
                <p class="panel-subtitle">Bienvenido al panel administrativo</p>
                <h1 class="panel-title">Administrador</h1>
            </div>
            <div class="topbar-actions">
                <a href="?url=logout" class="btn-logout"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a>
            </div>
        </header>

        <div class="panel-cards">
            <div class="card">
                <h2>120</h2>
                <p>Usuarios registrados</p>
            </div>
            <div class="card">
                <h2>50</h2>
                <p>P�lizas activas</p>
            </div>
            <div class="card">
                <h2>8</h2>
                <p>Alertas recientes</p>
            </div>
        </div>
    </main>
</div>

<script>
    const sidebarToggleAdmin = document.querySelector('.sidebar-toggle');
    const sidebarAdmin = document.querySelector('.panel-sidebar');
    sidebarToggleAdmin?.addEventListener('click', () => {
        sidebarAdmin?.classList.toggle('active');
    });
</script>

</body>
</html>
