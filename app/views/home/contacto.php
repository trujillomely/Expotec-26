<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto | Arco Seguros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/pages.css" rel="stylesheet">
</head>

<body>
    <?php include '../app/views/layouts/navbar.php'; ?>

    <main>
        <section class="page-hero">
            <div class="container">
                <p class="page-kicker">Contacto</p>
                <h1 class="page-title">Hablemos de la protección que necesitas</h1>
                <p class="page-lead">
                    Nuestro equipo puede orientarte para cotizar, comparar aseguradoras, resolver dudas sobre pólizas o acompañarte en un reclamo.
                </p>
            </div>
        </section>

        <section class="section-space">
            <div class="container">
                <div class="contact-layout">
                    <div class="contact-grid">
                        <article class="contact-card">
                            <div class="contact-icon">EM</div>
                            <h3>Correo electrónico</h3>
                            <p><a href="mailto:info@arcoseguros.com.gt">info@arcoseguros.com.gt</a></p>
                            <p>Escríbenos para cotizaciones, renovaciones o consultas generales.</p>
                        </article>
                        <article class="contact-card">
                            <div class="contact-icon">TE</div>
                            <h3>Teléfono</h3>
                            <p><a href="tel:+50222334455">+502 2233 4455</a></p>
                            <p>Atención de lunes a viernes y asistencia para emergencias 24/7.</p>
                        </article>
                        <article class="contact-card">
                            <div class="contact-icon">UB</div>
                            <h3>Ubicación</h3>
                            <p>Zona 10, Ciudad de Guatemala, Guatemala, C.A.</p>
                            <p>Atendemos citas presenciales y asesorías virtuales en todo el país.</p>
                        </article>
                    </div>

                    <form class="contact-form" action="?url=contacto" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre completo</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Tu nombre">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="correo" class="form-label">Correo</label>
                                <input type="email" class="form-control" id="correo" name="correo" placeholder="tu@email.com">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="+502 0000 0000">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="servicio" class="form-label">Tipo de seguro</label>
                            <select class="form-select" id="servicio" name="servicio">
                                <option selected>Selecciona una opción</option>
                                <option>Auto</option>
                                <option>Hogar</option>
                                <option>Vida</option>
                                <option>Salud</option>
                                <option>Viaje</option>
                                <option>Empresarial</option>
                                <option>Fianzas</option>
                                <option>Otro</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="mensaje" class="form-label">Mensaje</label>
                            <textarea class="form-control" id="mensaje" name="mensaje" rows="5" placeholder="Cuéntanos qué necesitas proteger"></textarea>
                        </div>
                        <button type="submit" class="btn btn-arco">Enviar solicitud</button>
                    </form>
                </div>
            </div>
        </section>

        <section class="section-space-sm light-band">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-4">
                        <h2 class="section-title">¿Qué pasa después?</h2>
                    </div>
                    <div class="col-lg-8">
                        <ul class="page-list">
                            <li>Un asesor revisa tu solicitud y aclara los datos necesarios.</li>
                            <li>Comparamos opciones disponibles según cobertura, precio y condiciones.</li>
                            <li>Te explicamos ventajas, exclusiones y pasos para contratar con confianza.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <?php include '../app/views/layouts/footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
