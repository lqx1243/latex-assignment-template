#!/bin/sh
set -eu

biber_path=$(command -v biber) || {
    echo 'Biber was not found. Install it with your TeX distribution.' >&2
    exit 127
}

if "$biber_path" --version >/dev/null 2>&1; then
    exec "$biber_path" "$@"
fi

# Limit the fallback to the two-architecture macOS distribution.
if ! /usr/bin/lipo "$biber_path" -verify_arch arm64 >/dev/null 2>&1 ||
   ! /usr/bin/lipo "$biber_path" -verify_arch x86_64 >/dev/null 2>&1; then
    exec "$biber_path" "$@"
fi

# Run the bundled native executable directly. Keep its unpacked Perl files
# in the same private temporary directory and remove them after this run.
temp_dir=$(mktemp -d "${TMPDIR:-/tmp}/latex-report-biber.XXXXXX")
trap 'rm -rf "$temp_dir"' EXIT
/usr/bin/lipo "$biber_path" -thin "$(uname -m)" -o "$temp_dir/biber"
chmod u+x "$temp_dir/biber"
PAR_GLOBAL_TMPDIR="$temp_dir" "$temp_dir/biber" "$@"
