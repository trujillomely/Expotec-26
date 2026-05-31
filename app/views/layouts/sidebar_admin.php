<aside class="panel-sidebar admin">
    <div class="sidebar-brand">
        <img src="assets/img/logo.png" alt="Arco Seguros">
        <div>
            <h2>Arco Seguros</h2>
            <p>Administrador</p>
        </div>
    </div>

    <nav class="sidebar-nav">
        <a href="?url=admin/dashboard" class="active"><i class="bi bi-house"></i>Inicio</a>
        <div class="sidebar-section">
            <button type="button" class="sidebar-section-title" data-toggle="subnav">
                <span><i class="bi bi-people"></i>Usuarios</span>
                <i class="bi bi-caret-right sidebar-section-caret"></i>
            </button>
            <div class="sidebar-subnav">
                <a href="?url=admin/users">Usuarios</a>
                <a href="?url=admin/roles">Roles</a>
                <a href="?url=admin/permissions">Permisos</a>
            </div>
        </div>
        <a href="#"><i class="bi bi-building"></i>Aseguradoras</a>
        <a href="#"><i class="bi bi-graph-up"></i>Pólizas</a>
        <a href="#"><i class="bi bi-credit-card"></i>Pagos</a>
        <a href="#"><i class="bi bi-file-earmark-text"></i>Reclamos</a>
        <a href="#"><i class="bi bi-gear"></i>Servicios</a>
        <a href="#"><i class="bi bi-file-earmark-word"></i>Formularios</a>
        <a href="#"><i class="bi bi-bell"></i>Notificaciones</a>
        <a href="#"><i class="bi bi-bar-chart-line"></i>Reportes</a>
        <a href="#"><i class="bi bi-gear"></i>Configuración</a>

    </nav>

    <div class="sidebar-footer">
        <a href="?url=logout"><i class="bi bi-box-arrow-right"></i>Cerrar sesión</a>
    </div>
</aside>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const sidebar = document.querySelector('.panel-sidebar');
        const layout = document.querySelector('.panel-layout');
        const sidebarToggle = document.querySelector('.sidebar-toggle');

        sidebarToggle?.addEventListener('click', function () {
            sidebar?.classList.toggle('active');
            layout?.classList.toggle('sidebar-open');
        });

        document.querySelectorAll('.sidebar-section-title').forEach(function (title) {
            title.addEventListener('click', function () {
                const section = title.closest('.sidebar-section');
                section?.classList.toggle('expanded');
            });
        });
    });
</script>
