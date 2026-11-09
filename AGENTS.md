# Testfoss fork guidance

Keep upstream source, examples, lockfiles, and existing workflows unchanged. Fork additions belong in `testfoss/`, `durable-memory/`, and `.github/workflows/testfoss.yml`; the root README may contain only the short Testfoss section.

Use `wasm-pack build --target web` and `cargo check --locked --target wasm32-unknown-unknown`. Serve the production `www/dist` bundle for browser checks rather than the Vite development server, which cannot serve the external `pkg` Wasm path in this layout. npm commands in `www/` must use `--no-package-lock` so they do not create an upstream lockfile.

Run `./testfoss/build.sh` and `./testfoss/browser.sh` after changing the demo. Browser checks must invoke `lmwebtest playwright` from `browser.lms` and cover Canvas output, Mandelbrot selection, and 3D controls. Do not add a LICENSE file: upstream lacks one even though `www/package.json` declares MIT. Do not commit generated Wasm, `pkg`, `dist`, `node_modules`, build trees, screenshots, or results.
