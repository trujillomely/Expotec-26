<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Cliente | Arco Seguros</title>
    <link rel="stylesheet" href="assets/css/panel.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<div class="panel-layout">
    <?php include ROOT_PATH . '/app/views/layouts/sidebar_cliente.php'; ?>

    <main class="panel-main">
        <header class="panel-topbar">
            <button class="sidebar-toggle" type="button" aria-label="Abrir menú"><i class="bi bi-list"></i></button>
            <div>
                <p class="panel-subtitle">Bienvenido al panel del cliente</p>
                <h1 class="panel-title">Cliente</h1>
            </div>
            <div class="topbar-actions">
                <a href="?url=logout" class="btn-logout"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a>
            </div>
        </header>

        <div class="panel-cards">
            <div class="card">
                <h2>6</h2>
                <p>P�lizas vigentes</p>
            </div>
            <div class="card">
                <h2>3</h2>
                <p>Reclamos abiertos</p>
            </div>
            <div class="card">
                <h2>1</h2>
                <p>Pago pr�ximo</p>
            </div>
        </div>
    </main>
</div>

<script>
    const sidebarToggleCliente = document.querySelector('.sidebar-toggle');
    const sidebarCliente = document.querySelector('.panel-sidebar');
    sidebarToggleCliente?.addEventListener('click', () => {
        sidebarCliente?.classList.toggle('active');
    });
</script>

</body>
</html>
