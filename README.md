## Build

The default (and only) target for this example is `wasm32-freestanding-musl`.

The latest zig version used to build this project is:

```shell
$ zig version
0.13.0
```

To build the wasm module to `/public/bin/astro-checkerboard.wasm`, run:

```shell
$ zig build -p public

$ ls ./public/bin
astro-checkerboard.wasm

$ wc -c ./public/bin/astro-checkerboard.wasm
555 ./public/bin/astro-checkerboard.wasm
```

Note: `build.zig` specifies various wasm-ld parameters. For example, it sets the initial memory size
and maximum size to be 2 pages, where each page consists of 64kB. Use the `--verbose` flag to see the complete list of flags the build uses.

## Run

Run preview in this repo's directory:

```shell
pnpm run preview
```

Go to your favorite browser and type to the URL `localhost:4321` (or whatever URL is stated from running the `preview` command.

You should see the checkboard changing colors.
