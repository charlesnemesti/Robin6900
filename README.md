# Robin6900

Proyecto basado en el sitio [SPX6900](https://www.spx6900.com/), adaptado y rebrandeado como **Robin6900**.

## Estructura

```
Robin6900/
├── index.html          # Sitio principal (HTML/CSS inline)
├── assets/             # Imágenes y videos descargados
├── scripts/
│   ├── download-assets.ps1
│   └── localize-html.ps1
└── package.json
```

## Inicio rápido

```bash
# Descargar assets y localizar URLs (solo la primera vez)
npm run setup

# Servidor local en http://localhost:6900
npm run dev
```

## Notas

- El sitio original es una página estática de una sola pieza (estilo Carrd).
- Los enlaces externos (DEX, Telegram, etc.) siguen apuntando a los destinos originales de SPX6900; puedes cambiarlos en `index.html`.
- Este proyecto es solo para entretenimiento. No constituye asesoramiento financiero.

## Origen

Descargado desde https://www.spx6900.com/ el 1 de julio de 2026.
