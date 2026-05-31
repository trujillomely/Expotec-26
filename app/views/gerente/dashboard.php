<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Gerente | Arco Seguros</title>
    <link rel="stylesheet" href="assets/css/panel.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<div class="panel-layout">
    <?php include ROOT_PATH . '/app/views/layouts/sidebar_gerente.php'; ?>

    <main class="panel-main">
        <header class="panel-topbar">
            <button class="sidebar-toggle" type="button" aria-label="Abrir menú"><i class="bi bi-list"></i></button>
            <div>
                <p class="panel-subtitle">Bienvenido al panel del gerente</p>
                <h1 class="panel-title">Gerente</h1>
            </div>
            <div class="topbar-actions">
                <a href="?url=logout" class="btn-logout"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a>
            </div>
        </header>

        <div class="panel-cards">
            <div class="card">
                <h2>34</h2>
                <p>Clientes activos</p>
            </div>
            <div class="card">
                <h2>12</h2>
                <p>Solicitudes pendientes</p>
            </div>
            <div class="card">
                <h2>7</h2>
                <p>Reclamos nuevos</p>
            </div>
        </div>
    </main>
</div>

<script>
    const sidebarToggleGerente = document.querySelector('.sidebar-toggle');
    const sidebarGerente = document.querySelector('.panel-sidebar');
    sidebarToggleGerente?.addEventListener('click', () => {
        sidebarGerente?.classList.toggle('active');
    });
</script>

</body>
</html>
