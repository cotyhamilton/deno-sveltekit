# deno sveltekit

## create project

```bash
deno run -A npm:create-svelte@latest my-app
cd my-app
deno types > src/deno.d.ts
```

## replace adapter

I like [sveltekit-adapter-deno](https://github.com/dbushell/sveltekit-adapter-deno)

The rest of the instructions are tailored to using this adapter, adjust as needed if you choose differently.

```bash
deno remove @sveltejs/adapter-auto
deno add npm:sveltekit-adapter-deno
```

Update `svelte.config.js`

```diff
- import adapter from '@sveltejs/adapter-auto';
+ import adapter from 'sveltekit-adapter-deno';
```

## develop

Install dependencies

```bash
DENO_FUTURE=1 deno install
```

Run the dev server

```bash
DENO_FUTURE=1 deno task dev
```

## build

```bash
DENO_FUTURE=1 deno task build
```

Run production server

> ⚠️ `--no-lock` is required until deno deploy supports latest version of lockfile

```bash
DENO_FUTURE=1 deno run -REN --no-lock build/mod.ts
```

## deploy

Create project on [deno deploy](https://dash.deno.com/projects) and link repo

Svelte will be automatically selected as the framework preset

Open advanced settings

- Set "Install Step" to `DENO_FUTURE=1 deno install`
- Set "Build Step" to `DENO_FUTURE=1 deno task build`
- Set "Root directory" to `build`
- Set "Entrypoint" to `mod.ts`

Alternatively, deploy from the command line:

```bash
DENO_FUTURE=1 deno task build
cd build
deployctl deploy --project=<project-name> --entrypoint=mod.ts
```

## live example

https://deno-sveltekit-example.deno.dev

> [!WARNING]
> I haven't yet tested with production dependencies, neither npm nor jsr
