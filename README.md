# deno sveltekit

## create project

```bash
deno run -A npm:sv@latest create my-app
cd my-app
deno install
deno fmt
deno add --dev npm:@types/deno npm:@sveltejs/adapter-node
deno remove @sveltejs/adapter-auto
```

Update `svelte.config.js`

```diff
- import adapter from "@sveltejs/adapter-auto";
+ import adapter from "@sveltejs/adapter-node";
```

## develop

Install dependencies

```bash
deno install
```

Run the dev server

```bash
deno task dev
```

## build

```bash
deno task build
```

Preview the production build

```bash
deno task preview
```

Run production server

```bash
deno run -A build/index.js
```

## deploy

Create project on [deno deploy](https://dash.deno.com/projects) and link repo

Svelte will be automatically selected as the framework preset

Open advanced settings

- Set "Install Step" to `deno install`
- Set "Build Step" to `deno task build`
- Set "Root directory" to `build`
- Set "Entrypoint" to `mod.ts`

Alternatively, deploy from the command line:

```bash
deno task build
cd build
deployctl deploy --project=<project-name> --entrypoint=mod.ts
```

## live example

https://deno-sveltekit-example.deno.dev
