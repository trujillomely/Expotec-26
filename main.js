/* ============================================
   ARCO SEGUROS — js/main.js
   Interacciones de la página de inicio
   ============================================ */

/* ── Navbar scroll ────────────────────────── */
const navbar = document.getElementById('navbar');

window.addEventListener('scroll', () => {
  navbar.classList.toggle('scrolled', window.scrollY > 40);
}, { passive: true });

/* ── Menú hamburguesa (móvil) ─────────────── */
const hamburger = document.getElementById('hamburger');
const mobileLinks = document.querySelectorAll('.mobile-links a');

function toggleMenu() {
  const isOpen = hamburger.classList.toggle('open');
  navbar.classList.toggle('open', isOpen);
  hamburger.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
}

if (mobileLinks) {
  mobileLinks.forEach(link => {
    link.addEventListener('click', () => {
      navbar.classList.remove('open');
      hamburger.classList.remove('open');
      hamburger.setAttribute('aria-expanded', 'false');
    });
  });
}

window.addEventListener('resize', () => {
  if (window.innerWidth > 768) {
    navbar.classList.remove('open');
    if (hamburger) {
      hamburger.classList.remove('open');
      hamburger.setAttribute('aria-expanded', 'false');
    }
  }
});

/* ── Reveal on scroll (Intersection Observer) */
const revealEls = document.querySelectorAll('.reveal');

const revealObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      revealObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.12 });

revealEls.forEach(el => revealObserver.observe(el));

/* ── Contador animado de estadísticas ────── */
function animateCounter(el, target, suffix) {
  let current = 0;
  const step  = Math.ceil(target / 40);
  const timer = setInterval(() => {
    current = Math.min(current + step, target);
    el.innerHTML = current + '<span>' + suffix + '</span>';
    if (current >= target) clearInterval(timer);
  }, 30);
}

const statsObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const nums = entry.target.querySelectorAll('.hero-stat-num');
      const data = [
        { val: 12,  suffix: '+' },
        { val: 500, suffix: '+' },
        { val: 98,  suffix: '%' }
      ];
      nums.forEach((el, i) => {
        setTimeout(() => animateCounter(el, data[i].val, data[i].suffix), i * 120);
      });
      statsObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.5 });

const heroStats = document.querySelector('.hero-stats');
if (heroStats) statsObserver.observe(heroStats);

/* ── Smooth scroll para anclas ────────────── */
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', e => {
    const target = document.querySelector(anchor.getAttribute('href'));
    if (target) {
      e.preventDefault();
      target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  });
});