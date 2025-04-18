# deno sveltekit

This repo used to serve as a proof of concept and documentation for any custom
requirements for running sveltekit with deno. There are no longer any major
issues, and you may just follow the prompts of the `sv` cli to create a new
project.

## create project

```bash
deno run -A npm:sv@latest create my-app
```

In the tools prompt select `sveltekit-adapter` and either `node` or `static`

For package manager select `deno`

```bash
cd my-app
deno install
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
deno run -REN build/index.js
```

## docker

There is a basic `Dockerfile` included in the repo.

```bash
docker build -t my-app .
docker run -p 3000:3000 my-app

# or for a custom port
docker run --env PORT=5001 -p 5001:5001 my-app
```

## deploy

Create project on [deno deploy](https://dash.deno.com/projects) and link repo

Svelte will be automatically selected as the framework preset

Open advanced settings

- Set "Install Step" to `deno install`
- Set "Build Step" to `deno task build`
- Set "Root directory" to `build`
- Set "Entrypoint" to `index.js`

Alternatively, deploy from the command line:

```bash
deno task build
cd build
deployctl deploy --project=<project-name> --entrypoint=index.js
```

## live example

https://deno-sveltekit-example.deno.dev
