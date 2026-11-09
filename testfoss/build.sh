#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export CARGO_BUILD_JOBS="${CARGO_BUILD_JOBS:-2}"
cd "$ROOT"
rustup target add wasm32-unknown-unknown
wasm-pack build --target web
cargo check --locked --target wasm32-unknown-unknown

cd "$ROOT/www"
npm install --no-package-lock --no-audit --no-fund
./node_modules/.bin/vite build
test -s "$ROOT/www/dist/index.html"
