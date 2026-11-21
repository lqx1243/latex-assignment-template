# Plantilla LaTeX para informes de clase

[English](../README.md) · [简体中文](readme-zh-cn.md) · Español

Plantilla A4 para trabajos individuales o en grupo. Incluye una portada editable, una página de declaración con espacio para firmas, ejemplos de figuras y tablas, bibliografía y una rúbrica de evaluación. Puedes compilar el informe tal como está para ver el resultado antes de incorporar los materiales de tu curso.

## Compilar el ejemplo

Instala una distribución de TeX que incluya XeLaTeX, Biber y latexmk. Desde la carpeta que contiene `main.tex`, ejecuta `latexmk main.tex` y abre `build/main.pdf`. Si utilizas VS Code, instala la extensión LaTeX Workshop, abre esa misma carpeta y selecciona `main.tex`. En la paleta de comandos, elige **LaTeX Workshop: Build LaTeX project** y luego **LaTeX Workshop: View LaTeX PDF file**.

## Empezar un trabajo

1. Puedes descargar el ZIP del código fuente y extraerlo. Si tienes el repositorio clonado, también puedes ejecutar `git archive --format=zip --output=../report-starter.zip HEAD`. Extrae el ZIP en una carpeta nueva fuera del repositorio. El archivo incluye la configuración oculta y las reglas de exclusión de Git.
2. Para llevar el control de versiones del trabajo, ejecuta los siguientes comandos en la carpeta nueva. Si el trabajo ya tiene repositorio, utiliza el existente. Conviene mantener privado el repositorio que contiene el informe real.

   ```sh
   git init
   git add .
   git commit -m "Start assignment from the report template"
   ```

3. Crea `local-materials/signatures/` junto a `main.tex` y copia la [configuración de ejemplo](../course-settings-example.tex) en `local-materials/course-settings.tex`. En macOS o Linux puedes hacerlo así.

   ```sh
   mkdir -p local-materials/signatures
   cp course-settings-example.tex local-materials/course-settings.tex
   ```

Git excluye `local-materials/`. Para compilar en otro equipo, transfiere los archivos de esa carpeta por un medio adecuado para documentos personales.

## Incorporar los materiales del curso

Obtén los originales de la plataforma del curso o de quien imparte la asignatura. Las rutas de esta tabla parten de la carpeta que contiene `main.tex`.

| Elemento | Qué debes cambiar |
| --- | --- |
| Portada y autoría | Edita `local-materials/course-settings.tex`. Indica la institución, los datos de la asignatura, el título y la fecha de entrega. En `\CoverStudents`, añade una línea `\CoverStudent{ABC1234567}{Example Student}` por persona y sustituye los datos. Para un trabajo individual basta con una línea. Escribe los nombres que deben aparecer al inicio del informe en `\ReportAuthors`. |
| Logotipo | Guarda el archivo como `local-materials/logo.pdf`. Para usar un PNG o JPEG, cambia `\CoverLogoFile` en la configuración local para que apunte al archivo. |
| Declaración | Copia el texto exigido en `local-materials/declaration.tex` y separa los párrafos con una línea en blanco. Define el título con `\CoverDeclarationTitle`. Si el texto contiene caracteres especiales de LaTeX, escribe `\&`, `\%`, `\_` o `\#` para que se impriman literalmente. |
| Firmas y fecha | Coloca las firmas en `local-materials/signatures/`. Dentro de `\CoverSignatures`, sustituye `\CoverSignaturePlaceholder` por una línea `\CoverSignatureImage{local-materials/signatures/student-one.png}` por persona, en el orden de la lista. Se admiten PNG, JPEG y PDF. La altura predeterminada es de 1,7 cm y se conservan las proporciones. Puedes ajustarla con `\CoverSignatureImage[2cm]{...}`. La fecha aparece debajo de la última firma. Por defecto se imprime la fecha de compilación. Para fijar la de la firma, edita `\CoverDeclarationDate`. |
| Rúbrica | Guarda la rúbrica del curso en `local-materials/rubric.pdf`. Se incorporan todas sus páginas en orden y desaparece la hoja de ejemplo con la marca roja **EXAMPLE**. Si tu curso prescinde de la rúbrica, elimina el bloque correspondiente al final de [main.tex](../main.tex). |
| Informe y fuentes | Edita los capítulos de `sections/`, la [ilustración de muestra](../figures/example-figure.png) y la [tabla de ejemplo](../tables/parameters.tex). Sustituye las dos entradas ficticias de [references.bib](../references.bib) por las fuentes que hayas consultado y actualiza las claves de cita en el texto. |

Cuando añadas, cambies de nombre o retires archivos locales, ejecuta `latexmk -g main.tex`. En el PDF final, comprueba que el título cabe en la portada, que se lee toda la declaración, que las firmas van seguidas de la fecha y que aparece la rúbrica completa. Puedes ajustar la [maquetación de la portada](../sections/cover-page.tex) si el texto de tu curso requiere más espacio.

## Elegir el estilo de citas

La plantilla usa **APA, 7.ª edición**, para las citas y la bibliografía. Si el curso exige IEEE, cambia `style=apa` por `style=ieee` en la configuración de `biblatex` de [main.tex](../main.tex) y vuelve a ejecutar `latexmk main.tex`. Los dos estilos utilizan el mismo archivo `.bib` y las mismas claves de cita.

| | APA 7 | IEEE |
| --- | --- | --- |
| Ejemplo con `\parencite{example-article}` | (Example Article Author, 2000) | [1] |
| Orden de las referencias | Alfabético por autor | Por orden de primera cita |

Si tu distribución de TeX es mínima, comprueba que tienes Biber, `csquotes` y el paquete del estilo elegido. [Paquete APA](https://ctan.org/pkg/biblatex-apa) · [Paquete IEEE](https://ctan.org/pkg/biblatex-ieee)

## Archivos de salida y avisos al incluir imágenes o PDF

- El informe compilado se guarda en `build/main.pdf`. Git ignora `build/`, `local-materials/` y los archivos `.DS_Store` de Finder. Puedes revisar los archivos pendientes de registrar con `git status --short`.
- Si aparecen archivos temporales junto a `main.tex`, comprueba en el registro de LaTeX Workshop que se ha ejecutado `latexmk` y que la salida se escribe en `build/`. Al ejecutar `xelatex` directamente se omite la configuración de latexmk.
- Si aparece `ICC profile not embedded`, comprueba el color de la imagen en el PDF final. Si el registro también indica que la versión del perfil ICC es incompatible, exporta una copia en sRGB con un perfil compatible y compara el resultado. Conserva la transparencia de las firmas.
- El aviso `PDF file is tagged... Ignoring tags.` indica que al incorporar un PDF se pueden perder las etiquetas que definen la estructura de las tablas o el orden de lectura. Comprueba las páginas de la rúbrica. Si se exige un PDF accesible, verifica también el orden de lectura del informe final. [Guía del W3C sobre el orden de lectura de un PDF](https://www.w3.org/WAI/WCAG22/Techniques/pdf/PDF3)

## Cómo se desarrolló la plantilla

La persona responsable del proyecto definió la maquetación y revisó informes de muestra compilados. OpenAI Codex generó una parte sustancial del código de la plantilla y redactó la rúbrica de ejemplo, las referencias ficticias y la documentación de uso. Puedes consultar la [rúbrica en LaTeX](../sections/example-rubric.tex) y la [bibliografía de ejemplo](../references.bib).

Los cambios se pueden consultar en la [versión inicial de la plantilla](https://github.com/lqx1243/latex-assignment-template/commit/6478bc756b2d7d38768ca4b06fe0f64cc6bec424) y la [actualización de los estilos de cita](https://github.com/lqx1243/latex-assignment-template/commit/377c1e20d259fe7b51af492c2d301313f1d95cd0).

## Licencia

El código de la plantilla y los ejemplos originales se distribuyen con la [Licencia Pública General de GNU, versión 3](../LICENSE). Utiliza los logotipos, declaraciones, rúbricas y firmas que añadas conforme a sus permisos de uso y a las indicaciones de tu curso.
