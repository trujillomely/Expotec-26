<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Permisos | Panel Administrador</title>
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
                <p class="panel-subtitle">Gestión de permisos</p>
                <h1 class="panel-title">Permisos</h1>
            </div>
            <div class="topbar-actions">
                <a href="?url=logout" class="btn-logout"><i class="bi bi-box-arrow-right"></i> Cerrar sesión</a>
            </div>
        </header>

        <div class="panel-cards">
            <div class="card">
                <h2>Permisos</h2>
                <p>Controla acciones específicas permitidas para cada rol.</p>
            </div>
        </div>

        <div class="card" style="margin-top: 20px;">
            <h2>Permisos disponibles</h2>
            <div style="overflow-x:auto; margin-top: 16px;">
                <table style="width:100%; border-collapse: collapse;">
                    <thead>
                        <tr style="text-align:left; border-bottom: 1px solid #e5e7eb; color: #334155;">
                            <th style="padding: 12px 8px;">ID</th>
                            <th style="padding: 12px 8px;">Clave</th>
                            <th style="padding: 12px 8px;">Descripción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="border-bottom: 1px solid #e5e7eb;">
                            <td style="padding: 12px 8px;">1</td>
                            <td style="padding: 12px 8px;">view_users</td>
                            <td style="padding: 12px 8px;">Ver lista de usuarios.</td>
                        </tr>
                        <tr>
                            <td style="padding: 12px 8px;">2</td>
                            <td style="padding: 12px 8px;">edit_roles</td>
                            <td style="padding: 12px 8px;">Editar y asignar roles.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

<script>
    const sidebarToggle = document.querySelector('.sidebar-toggle');
    const sidebar = document.querySelector('.panel-sidebar');
    sidebarToggle?.addEventListener('click', () => {
        sidebar?.classList.toggle('active');
    });
</script>

</body>
</html>
