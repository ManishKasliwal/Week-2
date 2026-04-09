# Week 2 Website

This repo uses a SvelteKit + Tailwind CSS 4 stack with ESLint, Prettier, and a Docker-based VS Code Dev Container for local development and GitHub Pages deployment.

## Stack

- SvelteKit 2
- Svelte 5
- Tailwind CSS 4
- TypeScript
- Static export via `@sveltejs/adapter-static`
- GitHub Pages deployment workflow
- VS Code Dev Container on Node.js 22 LTS with npm 11

## Dev Container

Open this folder in VS Code and choose **Reopen in Container**. The container:

- is built from `.devcontainer/Dockerfile` on top of the official Dev Containers Node 22 image
- upgrades npm to version 11 to match the project's engine requirements
- mounts your local `~/.gitconfig` so your Git name/email match this computer
- keeps container-specific `node_modules` in a Docker volume
- forwards the Svelte dev server on port `5173`
- installs dependencies automatically with `npm install` after the container is created
- fixes ownership on the mounted npm and `node_modules` volumes when the container starts
- starts the Svelte dev server automatically when you attach to the container
- prints the local forwarded URL as `http://localhost:5173`

## Development

```sh
npm run dev:host
```

Useful commands:

```sh
npm run check
npm run lint
npm run format
npm run build
npm run preview:host
```

## GitHub Pages

The workflow in `.github/workflows/deploy-pages.yml` builds the same Docker image used by the dev container, runs `npm ci` and `npm run build` inside that container, and deploys the static `build/` output to GitHub Pages.

For project sites like `https://username.github.io/repo-name`, the build automatically sets the correct base path. For user or organization sites like `https://username.github.io`, it deploys from the root.

For this repository, the expected Pages URL is `https://manishkasliwal.github.io/Week-2/`.
