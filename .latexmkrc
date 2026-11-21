$pdf_mode = 5;  # XeLaTeX for fontspec and xeCJK.
$out_dir = 'build';

# Some macOS universal Biber launchers use a discontinued lipo option.
$biber = 'sh tools/run-biber.sh %O %S' if $^O eq 'darwin';
