import adapter from '@sveltejs/adapter-static';

const repo = process.env.GITHUB_REPOSITORY?.split('/')[1] ?? '';
const isUserOrOrgPagesSite = repo.endsWith('.github.io');
const base =
	process.env.BASE_PATH ??
	(process.env.GITHUB_ACTIONS === 'true' && repo && !isUserOrOrgPagesSite ? `/${repo}` : '');

/** @type {import('@sveltejs/kit').Config} */
const config = {
	compilerOptions: {
		// Force runes mode for the project, except for libraries. Can be removed in svelte 6.
		runes: ({ filename }) => (filename.split(/[/\\]/).includes('node_modules') ? undefined : true)
	},
	kit: {
		adapter: adapter(),
		paths: {
			base
		}
	}
};

export default config;
