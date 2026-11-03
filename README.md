# TVD Repuestos

Catálogo de repuestos en español con búsqueda por vehículo, lista de consulta por WhatsApp y administración mediante Supabase.

## Archivos

- `index.html`: catálogo público conectado.
- `admin.html`: administración mediante una cuenta autorizada.
- `catalog.js`, `admin.js` y hojas de estilo: interfaz y lógica del navegador.
- `database/`: estructura documentada del proyecto. Los SQL ya fueron aplicados en el proyecto existente; no volver a ejecutarlos allí.

El catálogo usa una clave publicable de Supabase. El acceso de escritura está limitado por las políticas de seguridad y la tabla `catalog_admins`. Los códigos de repuestos publicados se pueden consultar por la API para generar la consulta de WhatsApp; no se muestran en la página del catálogo.

Para publicar, servir los archivos estáticos por HTTPS, configurar el dominio autorizado en Supabase y verificar los permisos y la copia de seguridad. No incorporar claves secretas ni contraseñas al repositorio.
