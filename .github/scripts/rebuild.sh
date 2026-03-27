#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for pure-css/pure
# Runs from source-repo/site/ (docusaurusRoot).
# Installs root deps, runs grunt pre-build, installs site deps, then builds.

SITE_DIR="$(pwd)"

# --- Install root dependencies and run grunt pre-build ---
echo "[INFO] Node version: $(node -v)"
echo "[INFO] NPM version: $(npm -v)"

echo "[INFO] Installing root dependencies (for grunt)..."
cd ..
npm install --legacy-peer-deps

echo "[INFO] Building pure CSS library (grunt)..."
npx grunt

# --- Return to site/ and install Docusaurus dependencies ---
cd "$SITE_DIR"
echo "[INFO] Installing Docusaurus dependencies in site/..."
npm install --legacy-peer-deps

# --- Build ---
echo "[INFO] Running Docusaurus build..."
npm run build

echo "[DONE] Build complete."
