<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arco Seguros - Panel</title>
    
    <link rel="stylesheet" href="/Expotec%2026/public/assets/css/slide_bar_gerente.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="wrapper">
    <nav class="sidebar" id="sidebar">
        
        <div class="sidebar-header">
            <img src="/Expotec%2026/public/assets/img/logo.png" alt="Logo">
            <div>
                <h3>Arco Seguros</h3>
                <p>Admin Dashboard</p>
            </div>
        </div>

        <div class="menu-body">
            <ul class="list-unstyled">
                <?php
                    $menuItems = [
                        ['name' => 'Clientes', 'icon' => 'fa-users', 'url' => '#'],
                        ['name' => 'Pólizas', 'icon' => 'fa-file-lines', 'url' => '#'],
                        ['name' => 'Reclamos', 'icon' => 'fa-hand-holding-medical', 'url' => '#'],
                        ['name' => 'Pagos', 'icon' => 'fa-money-bill-wave', 'url' => '#'],
                        ['name' => 'Reportes', 'icon' => 'fa-chart-simple', 'url' => '#']
                    ];

                    foreach ($menuItems as $item) {
                        echo "<li>
                                <a href='{$item['url']}'>
                                    <i class='fa-solid {$item['icon']}'></i>
                                    <span>{$item['name']}</span>
                                </a>
                              </li>";
                    }
                ?>
            </ul>
        </div>

        <div class="sidebar-footer">
            <ul class="list-unstyled">
                <li class="active">
                    <a href="configuracion.php">
                        <i class="fa-solid fa-gear"></i>
                        <span>Configuración</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="content w-100">
        <nav class="navbar navbar-light bg-light d-md-none p-3">
            <button type="button" id="sidebarCollapse" class="btn btn-dark">
                <i class="fas fa-bars"></i>
            </button>
        </nav>
        
        <div class="container-fluid p-5">
            <h2 class="fw-bold">Configuraciones</h2>
            <p class="text-muted">Gerencie seu perfil, segurança e preferências do Arco Seguros.</p>
            <hr>
            </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('sidebarCollapse').addEventListener('click', function() {
        document.getElementById('sidebar').classList.toggle('active');
    });
</script>
</body>
</html>