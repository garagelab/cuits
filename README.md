CUITs.org
===

CUITs.org es una base de datos abierta de información sobre personas físicas y jurídicas.

Scraping
---

Por el momento, la información sale de [Argentina Compra](http://www.argentinacompra.gov.ar).

Hay dos procesos que corren en momentos diferentes:

  * `bin/argentina-compra-list`: Obtiene los IDs de todos los
  proveedores listados. Es un proceso lento dado que corre una búsqueda
  sobre muchos registros (y parece que no están paginando bien el
  resultado). Como es lento, queda separado para poder correrse en
  algún momento de la noche. Los IDs se guardan en Redis, para que otro
  worker los tome.

  * `bin/argentina-compra-fetch`: Dados los IDs de proveedores encolados
  en Redis, hace scraping de la página de cada proveedor, normaliza un
  poco los datos y los guarda también en Redis.

Licencia
---

MIT.
