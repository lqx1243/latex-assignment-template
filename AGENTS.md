# Maintaining the assignment template

Build from the repository root with `latexmk main.tex`. The output is `build/main.pdf`. See the [README](README.md) for instructions on starting an assignment and adding course materials.

## Language

Use English for the main README, agent instructions, source comments, build messages, and text printed by the sample report. When a change affects a documented step, update the [Simplified Chinese](docs/readme-zh-cn.md) and [Spanish](docs/readme-es.md) guides as well. Keep each language's own name in the README language switcher. When answering a contributor, use their preferred language.

## Template changes

- Use clear placeholders, original example graphics, and fictional references in the public template. Keep course-specific materials, personal details, and signatures in the Git-ignored `local-materials/` directory.
- After editing the cover, compile a single-student example and a group example. Check the A4 page size, the date below the last signature, and the mark box where it meets the right and bottom borders of the feedback frame. Check that a long title wraps without overlapping the next row.
- After changing the rubric, check the red watermark on the example page and verify that a local multi-page rubric replaces it in full. After changing citations, compile with APA and IEEE and check the in-text citations and the order of the two references.
- When bringing an improvement over from an assignment, review the diff and commit the reusable changes in this repository. Before a release, export the tracked files from the release commit and build the example in a clean directory.
- Use lowercase ASCII letters, digits, and hyphens for new filenames and directories. Match case in all paths. Keep conventional names such as `README.md`, `AGENTS.md`, and `LICENSE`, and include the hidden build and editor settings when exporting the template.
