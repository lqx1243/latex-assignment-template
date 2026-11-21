# LaTeX Assignment Report Template

**English** · [简体中文](docs/readme-zh-cn.md) · [Español](docs/readme-es.md)

An A4 LaTeX template for coursework reports with an editable cover, group signatures, APA 7 or IEEE citations, and a replaceable marking rubric. The example builds with placeholders. Add your own course materials when you start an assignment.

## Build the example

Install a TeX distribution that includes XeLaTeX, Biber and latexmk. Download and extract the source ZIP, or clone the repository. From the folder containing [main.tex](main.tex), run:

```sh
latexmk main.tex
```

Open `build/main.pdf`. The first two pages show the cover and sample declaration. The final page is an example rubric with a red diagonal watermark. In VS Code, install the LaTeX Workshop extension, open the same folder, select `main.tex` and run **LaTeX Workshop: Build LaTeX project**, then **LaTeX Workshop: View LaTeX PDF file**.

## Start an assignment

Start with an extracted copy of the template. If you maintain a Git clone, you can export a clean copy with `git archive --format=zip --output=../report-starter.zip HEAD`. Extract it outside the template repository. Both methods include the hidden build and editor settings.

1. To track a new assignment in Git, run `git init`, `git add .` and `git commit -m "Start assignment from the report template"` in the extracted folder. Keep a repository containing actual coursework private when appropriate.
2. Make a `local-materials/` directory alongside `main.tex`. Copy [course-settings-example.tex](course-settings-example.tex) to `local-materials/course-settings.tex` and edit the copy. On macOS or Linux, you can do this with the following commands.

   ```sh
   mkdir -p local-materials/signatures
   cp course-settings-example.tex local-materials/course-settings.tex
   ```

### Replace the sample materials

Use the declaration, logo and marking rubric supplied or approved for your assignment.

| Item | Where it goes |
| --- | --- |
| Institution, course and student details | Edit `local-materials/course-settings.tex`. Use one `\CoverStudent{ID}{Name}` line per student in `\CoverStudents`. A single-student report needs one line. Set `\ReportAuthors` separately for the byline in the report body. |
| Logo | Save it as `local-materials/logo.pdf`, or set `\CoverLogoFile` to a PNG or JPEG path in your local settings. The cover keeps the image proportions. |
| Declaration | Put the required paragraphs in `local-materials/declaration.tex`, separated by blank lines. Set the heading with `\CoverDeclarationTitle`. Escape characters such as `&`, `%`, `_` and `#` in ordinary text as `\&`, `\%`, `\_` and `\#`. |
| Signatures and date | Place the signature files in `local-materials/signatures/`. In `\CoverSignatures`, replace the placeholder with one `\CoverSignatureImage{local-materials/signatures/student-one.png}` per student, in roster order. PNG, JPEG and PDF are supported. The default height is 1.7 cm. Use `\CoverSignatureImage[2cm]{...}` to adjust one signature. The date appears below the last signature and defaults to the build date. Set `\CoverDeclarationDate` to record a fixed signing date. |
| Marking rubric | Save the course PDF as `local-materials/rubric.pdf`. All its pages replace the watermarked example. If your course does not require a rubric, remove the marked rubric block at the end of [main.tex](main.tex). |
| Body, figures and references | Edit the files in `sections/`, replace the [sample figure](figures/example-figure.png) and [table](tables/parameters.tex), and update their captions. Replace the fictional entries in [references.bib](references.bib) with sources you used, then update the citation keys in the text. |

After adding, renaming or removing local materials, run `latexmk -g main.tex` to force a rebuild. Check the roster, the complete declaration, the date below the last signature, and the number of rubric pages. Long titles wrap at spaces. Check the layout when using a long declaration or several signatures. [Cover layout](sections/cover-page.tex)

Git ignores `local-materials/`, `build/` and Finder metadata. If you compile the same assignment on another computer, transfer the local materials separately. The finished submission PDF is `build/main.pdf`.

## Choose a citation style

The default is **APA 7** for in-text citations and the reference list. To use IEEE, change `style=apa` to `style=ieee` in [main.tex](main.tex) and run `latexmk main.tex`. Both styles use the same bibliography, and the A4 layout is independent of this setting.

| Example | APA 7 | IEEE |
| --- | --- | --- |
| `\parencite{example-article}` | (Example Article Author, 2000) | [1] |
| Reference order | Alphabetical by author | Order of first citation |

Follow the style specified by your course. Minimal TeX installations may need the APA or IEEE style package. The APA setup also uses `csquotes` and Biber. [APA package](https://ctan.org/pkg/biblatex-apa) · [IEEE package](https://ctan.org/pkg/biblatex-ieee)

## Build warnings

- **Auxiliary files next to the source.** Check the LaTeX Workshop output for a `latexmk` command with `build/` as its output directory. Running `xelatex` directly bypasses this project's latexmk settings.
- **`ICC profile not embedded`.** If the preceding message reports an unsupported profile version, check the figure's colours in the finished PDF. If they differ, export a copy with a compatible sRGB profile and rebuild. Preserve transparency when exporting signatures.
- **`PDF file is tagged... Ignoring tags.`** When a tagged course PDF is embedded, check the result visually. If your submission must be accessible, also check reading order and table navigation in the finished PDF because the original structure tags can be lost. [W3C guidance on PDF reading order](https://www.w3.org/WAI/WCAG22/Techniques/pdf/PDF3)

## How AI was used

OpenAI Codex generated substantial parts of this template under the maintainer's direction. The maintainer specified the cover layout, the position of the mark box, and how signatures and dates should be arranged, then reviewed the compiled examples. Codex implemented much of the [cover](sections/cover-page.tex), wrote the [sample rubric](sections/example-rubric.tex) and [fictional references](references.bib), drafted the documentation, and helped test the individual and group layouts and the citation styles.

The [initial template](https://github.com/lqx1243/latex-assignment-template/commit/6478bc756b2d7d38768ca4b06fe0f64cc6bec424) and [citation-style update](https://github.com/lqx1243/latex-assignment-template/commit/377c1e20d259fe7b51af492c2d301313f1d95cd0) show the changes described above.

## License

The template source and bundled examples are distributed under the [GNU General Public License v3.0](LICENSE). Materials that you supply, such as logos, declarations and rubrics, remain subject to their own permissions and course requirements.
