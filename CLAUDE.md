# Carruseles de Instagram · @automatiza_esto

Temas: IA llamativa, ingeniería de código, diseño web y videojuegos. Nunca temas que ya tienen video en `../TikTok/01_Proyectos/`. Lista de temas en `temas.md`.

## Carrusel nuevo
1. Carpeta `NN_slug/` (NN = siguiente número) con `master/` y `exports/social/`.
2. Escribir `NN_slug/body.html`: `<body>` con 7 `<section class="slide">` siguiendo `03_mcp_usb_ia/carrusel.html` como modelo de estilo (llamativo: marca de agua gigante `.wm`, diagramas SVG propios del tema, números en contorno, banda naranja en el CTA; su `<style>` va al inicio del body y se copia). Al menos 2 láminas con un diagrama o visual SVG, no solo texto. Estructura (hook → contexto → 3 láminas de contenido → tip práctico → CTA "Sígueme @AutomatizaEsto"). Logo como `src="__LOGO__"`.
   Clases disponibles: `h1/h2` titulares (`.o` naranja, `.c` cian), `.lead`, `.foot`, `.chat .msg.u/.msg.a`, `.vs .card.bad/.card.good` con `.badge` y `.code` (`.k` cian, `.x` naranja), `.four .card`, `.flow .step`, `.meter .row .bar`.
   Titulares cortos: máx. 3 líneas de h2 y ~14 caracteres por línea, o se desbordan.
3. `node splice.js 02_ia_inventa_codigo/carrusel.html NN_slug/body.html NN_slug/carrusel.html`, cambiar el `<title>` y borrar `body.html`.
4. Exportar el MASTER en PNG con un servidor estático en la raíz (`npx --yes http-server -p 8766 -s .`) y Edge headless, a `NN_slug/master/` con nombres `01_portada.png`, `02_slide.png` … `07_slide.png`:
   `msedge --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 --window-size=1080,1440 --screenshot=<ruta-absoluta>/master/0N_slide.png "http://localhost:8766/NN_slug/carrusel.html?s=N"`.
   Luego generar los archivos de PUBLICACIÓN: `powershell -NoProfile -File to_jpg.ps1 NN_slug` → `NN_slug/exports/social/*.jpg` (JPEG calidad 95, sRGB, misma resolución). **Nunca se publica un PNG**: TikTok rechaza `image/png`.
5. Revisar cada PNG (textos que se salen, acentos que se pisan) y corregir antes de publicar.
6. Contenido verificable: nada de cifras o hechos inventados.

## Publicar
- Estructura de cada carrusel: `NN_slug/carrusel.html`, `NN_slug/master/` (PNG, solo diseño/edición) y `NN_slug/exports/social/` (JPG q95 que recibe Metricool).
- `git add -A && git commit && git push` (repo público `JuanMHZ12/automatizaesto-carruseles`, rama `main`).
- Comprobar que `https://raw.githubusercontent.com/JuanMHZ12/automatizaesto-carruseles/main/NN_slug/exports/social/01_portada.jpg` (y las otras 6) responde 200 con `image/jpeg`.
- **HORARIO: 10:00 AM America/Lima en Instagram y TikTok, mismo día, misma hora, en la FECHA que marque el Calendario de `temas.md`** (plan gratis de Metricool: NO es diario; nov: 18, 25, 30; dic: 20 publicaciones). Nunca fechas pasadas.
- Metricool `createScheduledPost`: blogId `7351528`, Instagram POST, `autoPublish: true`, `isAiGenerated: true`, media = las 7 URLs raw **JPG de exports/social** en orden (01_portada.jpg … 07_slide.jpg). Caption con hook, 3 puntos, CTA a @automatiza_esto y ~10 hashtags.
- **TikTok (@automatizaesto)**: otro `createScheduledPost` aparte con las mismas 7 URLs JPG: providers `tiktok`, misma hora, `tiktokData` = `{title: <tema, máx. 90 caracteres>, autoAddMusic: true, privacyOption: "PUBLIC_TO_EVERYONE", disableComment: false, photoCoverIndex: 0}`. `autoAddMusic: true` pone la música recomendada de TikTok. Caption más corto que el de IG (hook + idea + CTA + ~8 hashtags). Si una red falla, la otra sigue; no dupliques una red que ya salió bien.
- Tras programar, revisar con `getScheduledPosts` que ninguna red muestre ERROR (p. ej. "image/png type is not allowed").
- Mover el tema a "Publicados" en `temas.md` y hacer commit/push.
