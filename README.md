# LaTeX 作业报告模板

一个可独立编译的非官方 A4 报告模板。前两页是可编辑的封面和声明，后面有正文、图表、参考文献与评分表示例。下载后可直接预览，学校名称、标志、签名和评分内容都有明显的占位标记。正式要求及材料以当期课程发布的版本为准。

## 先看效果

安装带有 XeLaTeX、Biber 和 latexmk 的 TeX 发行版。打开包含 `main.tex` 的仓库根目录，在终端运行 `latexmk main.tex`，成品在 `build/main.pdf`。使用 VS Code 时，安装 LaTeX Workshop，打开同一目录，选中 `main.tex` 并执行 **LaTeX Workshop: Build LaTeX project**。打开 **View LaTeX PDF file** 即可预览。

## 用它开始自己的作业

1. 在模板仓库中运行 `git archive --format=zip --output=../report-starter.zip HEAD`。把压缩包解压到仓库以外的新作业目录。隐藏的编译配置和 Git 忽略规则也会一起导出，旧提交历史不会随压缩包复制。
2. 在新目录里运行下面的命令。已有独立 Git 仓库的作业可沿用原仓库。存放真实作业正文的仓库适合设为私有。

   ```sh
   git init
   git add .
   git commit -m "Start assignment from the report template"
   ```

3. 在 `main.tex` 旁新建 `local-materials/`，把 [course-settings-example.tex](course-settings-example.tex) 复制为 `local-materials/course-settings.tex`。macOS 或 Linux 可以运行下面两行。整个 `local-materials/` 已由 Git 默认忽略。

   ```sh
   mkdir -p local-materials/signatures
   cp course-settings-example.tex local-materials/course-settings.tex
   ```

## 换成自己课程的材料

请从课程平台、讲师或学校指定的渠道取得适用于这份作业的文件。本仓库只提供模板源码和示例素材。

| 要替换的内容 | 在新作业中怎么做 |
| --- | --- |
| 学校、课程、题目和学生 | 编辑 `local-materials/course-settings.tex`。学校字段同时用于两页封面和正文页眉，作业标题也用于正文首页。`\CoverStudents` 中每名学生写一行 `\CoverStudent{学号}{英文姓名}`，另在 `\ReportAuthors` 中填写正文署名。个人作业只留一行即可。 |
| 校徽 | 放入 `local-materials/logo.pdf`。若是 PNG 或 JPEG，可将本地配置的 `\CoverLogoFile` 改成实际路径，例如 `local-materials/logo.png`。优先使用课程允许使用的清晰原图。 |
| 声明 | 将当期要求的声明正文放入 `local-materials/declaration.tex`，文件只需包含段落，用空行分段。标题由本地配置的 `\CoverDeclarationTitle` 控制。照录原文时，把普通文字里的 `&`、`%`、`_`、`#` 等 LaTeX 特殊字符分别写成 `\&`、`\%`、`\_`、`\#`。 |
| 签名和日期 | 把签名图片放入 `local-materials/signatures/`，在本地配置的 `\CoverSignatures` 中删除示例签名，按名单顺序每人添加一行 `\CoverSignatureImage{local-materials/signatures/student-one.png}`。支持 PNG、JPEG 和 PDF。默认高度 1.7 cm，保持比例；也可写成 `\CoverSignatureImage[2cm]{...}`。日期显示在最后一个签名下面，默认取编译当天，或在 `\CoverDeclarationDate` 中写入实际签署日期。 |
| 评分表 | 将当期评分表保存为 `local-materials/rubric.pdf`。模板会按顺序附上它的所有页面，原创示例页及红色 **EXAMPLE** 水印随之消失。课程无需评分表时，删除 [main.tex](main.tex) 末尾已注明用途的评分表选择代码。 |
| 正文、图表和文献 | 编辑 `sections/` 中的正文，替换 [示例插图](figures/example-figure.png) 和 [参数表](tables/parameters.tex)。[references.bib](references.bib) 中的书和文章都是演示格式的虚构条目。换成实际查阅的来源，并同步更新正文的 `\cite{...}` 引用键。 |

首次添加、改名或移除本地材料后，运行 `latexmk -g main.tex` 强制重新检查文件。打开最终 PDF，核对画幅、学生名单、每个签名和日期、声明全文及评分表页数。封面长标题会在空格处折行；正式声明篇幅或组员人数较多时，也请查看第二页末行和签名区的位置。[封面排版源码](sections/cover-page.tex)

## 图片、PDF 和编译输出

- 从 `build/main.pdf` 取提交用的报告。`build/`、`local-materials/` 和 Finder 的 `.DS_Store` 均已被 Git 忽略。其他电脑上要重编真实作业，需另行安全传递所需的课程材料。提交公开模板前可以运行 `git status --short` 核对文件。
- 若临时文件出现在 `main.tex` 旁，查看 LaTeX Workshop 的完整编译输出，确认它调用的是 `latexmk` 且输出目录为 `build/`。直接运行一次 `xelatex` 会绕过本项目的 latexmk 配置。
- 如果导入图片时出现 `ICC profile not embedded`，检查成品颜色。若前面还提示 ICC 版本不受支持，可另存为带兼容 sRGB 配置的图片再比较，签名图片应保留透明背景。
- 导入带标签的正式 PDF 时可能出现 `PDF file is tagged... Ignoring tags.`。嵌入页可正常显示，原有的阅读顺序或表格标签可能会丢失。核对成品中的表格和页数；要求无障碍提交时，再检查最终 PDF 的阅读顺序。[W3C 的 PDF 阅读顺序说明](https://www.w3.org/WAI/WCAG22/Techniques/pdf/PDF3)

模板源码和随附的原创范例按 [GPLv3](LICENSE) 提供。使用者自行取得的校徽、声明、评分表及签名应按各自的授权和课程要求使用。
