# Carruseles de Instagram · @automatiza_esto

Temas: IA llamativa, ingeniería de código, diseño web y videojuegos. Nunca temas que ya tienen video en `../TikTok/01_Proyectos/`. Lista de temas en `temas.md`.

## Carrusel nuevo
1. Carpeta `NN_slug/` (NN = siguiente número) con `png/`.
2. Escribir `NN_slug/body.html`: `<body>` con 7 `<section class="slide">` siguiendo `03_mcp_usb_ia/carrusel.html` como modelo de estilo (llamativo: marca de agua gigante `.wm`, diagramas SVG propios del tema, números en contorno, banda naranja en el CTA; su `<style>` va al inicio del body y se copia). Al menos 2 láminas con un diagrama o visual SVG, no solo texto. Estructura (hook → contexto → 3 láminas de contenido → tip práctico → CTA "Sígueme @AutomatizaEsto"). Logo como `src="__LOGO__"`.
   Clases disponibles: `h1/h2` titulares (`.o` naranja, `.c` cian), `.lead`, `.foot`, `.chat .msg.u/.msg.a`, `.vs .card.bad/.card.good` con `.badge` y `.code` (`.k` cian, `.x` naranja), `.four .card`, `.flow .step`, `.meter .row .bar`.
   Titulares cortos: máx. 3 líneas de h2 y ~14 caracteres por línea, o se desbordan.
3. `node splice.js 02_ia_inventa_codigo/carrusel.html NN_slug/body.html NN_slug/carrusel.html`, cambiar el `<title>` y borrar `body.html`.
4. Exportar con un servidor estático en la raíz (`npx --yes http-server -p 8766 -s .`) y Edge headless:
   `msedge --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 --window-size=1080,1440 --screenshot=<ruta>\png\slide_0N.png "http://localhost:8766/NN_slug/carrusel.html?s=N"`.
5. Revisar cada PNG (textos que se salen, acentos que se pisan) y corregir antes de publicar.
6. Contenido verificable: nada de cifras o hechos inventados.

## Publicar
- `git add -A && git commit && git push` (repo público `JuanMHZ12/automatizaesto-carruseles`, rama `main`).
- Comprobar que `https://raw.githubusercontent.com/JuanMHZ12/automatizaesto-carruseles/main/NN_slug/png/slide_01.png` responde 200.
- Metricool `createScheduledPost`: blogId `7351528`, Instagram POST, zona `America/Lima`, **12:00** del mismo día, `autoPublish: true`, `isAiGenerated: true`, media = las 7 URLs raw en orden. Caption con hook, 3 puntos, CTA a @automatiza_esto y ~10 hashtags.
- Mover el tema a "Publicados" en `temas.md` y hacer commit/push.
