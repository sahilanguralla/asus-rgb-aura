#!/bin/bash
set -e

echo "Building Debian package..."
dpkg-buildpackage -us -uc -b

echo "Moving build artifacts to dist/..."
mkdir -p dist
mv ../asus-rgb-control_*.deb dist/
mv ../asus-rgb-control_*.buildinfo dist/ 2>/dev/null || true
mv ../asus-rgb-control_*.changes dist/ 2>/dev/null || true

echo "Done! The package is available in the dist/ folder."
