# Testfoss Plotters demo

This additive check builds the official Plotters Wasm demo, checks the crate for `wasm32-unknown-unknown`, creates the production Vite bundle, and exercises its real Canvas, Mandelbrot selector, and 3D controls in Chromium. It does not patch the upstream page or Rust code.

Prerequisites are Bash, Rust with `rustup`, `wasm-pack` 0.15.1, Python 3, and Node.js 24. Then run:

```sh
npm install -g @lmctl-ai/lmctl@0.2.469
npm ci --prefix testfoss
testfoss/node_modules/.bin/playwright install chromium
./testfoss/build.sh
./testfoss/browser.sh
```

The browser check serves `www/dist` on loopback. Serving the production bundle is intentional: the lab found that the Vite development server rejects the external `pkg` Wasm path. Browser assertions run through `lmwebtest playwright`; screenshots and JSON results go under `testfoss/results/`.

The workflow at `.github/workflows/testfoss.yml` installs the pinned tools and runs the same Wasm build, Cargo check, and browser flow. The upstream package declares MIT in `www/package.json`, but the upstream repository has no top-level LICENSE file; this fork does not invent one. Generated `pkg`, `dist`, dependencies, and results are not committed.
