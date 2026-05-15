<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio | Arco Seguros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/home.css" rel="stylesheet">
</head>

<body>
    <?php include '../app/views/layouts/navbar.php'; ?>

    <main>
        <section class="hero-section">
            <div class="container">
                <div class="hero-content">
                    <div class="hero-badge">Arco Seguros</div>
                    <h1 class="hero-title">El respaldo que tu futuro merece</h1>
                    <p class="hero-copy">
                        En Arco Seguros, nuestra misión es proteger lo que más valoras. Con más de 15 años de experiencia,
                        ofrecemos soluciones de seguros personalizadas que se adaptan a tus necesidades y presupuesto.
                    </p>
                    <a href="?url=login" class="btn btn-arco">Solicitar cotización gratuita</a>
                </div>
            </div>
        </section>

        <section class="section-space" id="compromiso">
            <div class="container">
                <div class="promise-panel">
                    <div class="row align-items-center g-4">
                        <div class="col-lg-6">
                            <p class="section-kicker">Compromiso con tu tranquilidad</p>
                            <h2 class="section-title">Planes pensados para tu vida, no para una plantilla.</h2>
                        </div>
                        <div class="col-lg-6">
                            <p class="section-copy mb-0">
                                Entendemos que cada cliente es único. Por eso, nuestro equipo de expertos trabaja contigo
                                para diseñar planes de protección que realmente se ajusten a tu estilo de vida y objetivos.
                            </p>
                            <ul class="feature-list">
                                <li>Atención personalizada 24/7</li>
                                <li>Proceso de reclamación rápido y transparente</li>
                                <li>Planes flexibles y accesibles</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section-space pt-0" id="servicios">
            <div class="container">
                <div class="text-center mb-5">
                    <p class="section-kicker">Nuestros servicios</p>
                    <h2 class="section-title">Cobertura integral para cada aspecto de tu vida</h2>
                </div>

                <div class="row g-4">
                    <div class="col-md-6 col-xl">
                        <article class="service-card">
                            <div class="service-icon">AU</div>
                            <h3>Seguros de Auto</h3>
                            <p>Protección completa para tu vehículo con cobertura amplia y asistencia vial 24/7.</p>
                            <a class="service-link" href="#cotizacion">Más información</a>
                        </article>
                    </div>

                    <div class="col-md-6 col-xl">
                        <article class="service-card">
                            <div class="service-icon">HG</div>
                            <h3>Seguros de Hogar</h3>
                            <p>Resguarda tu patrimonio contra daños, robos y desastres naturales.</p>
                            <a class="service-link" href="#cotizacion">Más información</a>
                        </article>
                    </div>

                    <div class="col-md-6 col-xl">
                        <article class="service-card">
                            <div class="service-icon">VD</div>
                            <h3>Seguros de Vida</h3>
                            <p>Asegura el futuro financiero de tus seres queridos con planes flexibles.</p>
                            <a class="service-link" href="#cotizacion">Más información</a>
                        </article>
                    </div>

                    <div class="col-md-6 col-xl">
                        <article class="service-card">
                            <div class="service-icon">SL</div>
                            <h3>Seguros de Salud</h3>
                            <p>Acceso a atención médica de calidad con cobertura hospitalaria completa.</p>
                            <a class="service-link" href="#cotizacion">Más información</a>
                        </article>
                    </div>

                    <div class="col-md-6 col-xl">
                        <article class="service-card">
                            <div class="service-icon">VJ</div>
                            <h3>Seguros de Viaje</h3>
                            <p>Viaja sin preocupaciones con cobertura internacional y asistencia en el extranjero.</p>
                            <a class="service-link" href="#cotizacion">Más información</a>
                        </article>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta-section text-center" id="cotizacion">
            <div class="container">
                <h2 class="section-title text-white">¿Listo para proteger tu futuro?</h2>
                <p>
                    Obtén una cotización personalizada sin compromiso. Nuestros expertos están listos para ayudarte.
                </p>
                <a href="?url=login" class="btn btn-arco">Solicitar cotización gratuita</a>
            </div>
        </section>
    </main>

    <?php include '../app/views/layouts/footer.php'; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
