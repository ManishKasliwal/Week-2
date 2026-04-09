# Week 2 Website

This repo is now set up for a modern static-site workflow with SvelteKit, Tailwind CSS 4, ESLint, Prettier, and a Docker-based VS Code Dev Container.

## Stack

- SvelteKit 2
- Svelte 5
- Tailwind CSS 4
- TypeScript
- Static export via `@sveltejs/adapter-static`
- GitHub Pages deployment workflow
- VS Code Dev Container on Node.js 22 LTS

## Dev Container

Open this folder in VS Code and choose **Reopen in Container**. The container:

- uses Docker with the official Dev Containers Node image on Node 22 LTS
- mounts your local `~/.gitconfig` so your Git name/email match this computer
- keeps container-specific `node_modules` in a Docker volume
- forwards the Svelte dev server on port `5173`

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

The workflow in `.github/workflows/deploy-pages.yml` builds the site on pushes to `main` and deploys the static `build/` output to GitHub Pages.

For project sites like `https://username.github.io/repo-name`, the build automatically sets the correct base path. For user or organization sites like `https://username.github.io`, it deploys from the root.
