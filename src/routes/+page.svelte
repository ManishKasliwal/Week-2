<script lang="ts">
	const greetings = [
		'Hello, world!',
		'Welcome aboard.',
		'Fresh start, clean page.',
		'SvelteKit and Tailwind are ready.'
	];

	let greetingIndex = $state(0);
	const currentGreeting = $derived(greetings[greetingIndex] ?? greetings[0]);

	function cycleGreeting() {
		greetingIndex = (greetingIndex + 1) % greetings.length;
	}
</script>

<svelte:head>
	<title>Week 2 Website</title>
	<meta
		name="description"
		content="A static SvelteKit website powered by Tailwind CSS and ready for GitHub Pages."
	/>
</svelte:head>

<div
	class="min-h-screen bg-[radial-gradient(circle_at_top_left,rgba(255,107,74,0.18),transparent_30%),radial-gradient(circle_at_top_right,rgba(84,160,255,0.22),transparent_34%),linear-gradient(135deg,#f4efe7,#fffaf5_46%,#eef6ff)] px-4 py-8 text-slate-950 sm:py-12"
>
	<div class="mx-auto w-full max-w-6xl">
		<section
			class="relative overflow-hidden rounded-[2rem] border border-slate-900/10 bg-white/75 p-6 shadow-[0_24px_60px_rgba(38,53,77,0.14)] backdrop-blur-xl sm:p-10"
		>
			<div
				class="pointer-events-none absolute -right-10 -bottom-20 h-56 w-56 rounded-full bg-[linear-gradient(135deg,rgba(255,213,191,0.85),rgba(255,255,255,0))]"
			></div>

			<p class="mb-4 text-xs font-bold tracking-[0.2em] text-[#ff6b4a] uppercase">
				SvelteKit, Tailwind, and GitHub Pages
			</p>
			<h1 class="max-w-4xl text-5xl leading-none font-semibold tracking-tight sm:text-7xl">
				Hello World
			</h1>
			<p class="mt-4 max-w-2xl text-base leading-8 text-slate-600 sm:text-lg">
				A clean, modern single-page website now rebuilt with SvelteKit and Tailwind CSS, ready to
				develop inside a Docker-powered VS Code Dev Container.
			</p>

			<div class="mt-8 flex flex-wrap items-center gap-4">
				<button
					type="button"
					class="cursor-pointer rounded-full bg-[linear-gradient(135deg,#122033,#28435f)] px-6 py-4 text-sm font-semibold text-white shadow-[0_14px_30px_rgba(18,32,51,0.18)] transition hover:-translate-y-0.5 hover:shadow-[0_18px_34px_rgba(18,32,51,0.22)] focus:ring-2 focus:ring-slate-900/20 focus:outline-none"
					onclick={cycleGreeting}
				>
					Change greeting
				</button>
				<p class="text-sm font-medium text-slate-600 sm:text-base">{currentGreeting}</p>
			</div>
		</section>

		<main class="mt-5 grid gap-5 md:grid-cols-2">
			<section
				class="rounded-3xl border border-slate-900/10 bg-[linear-gradient(180deg,rgba(255,255,255,0.82),rgba(255,255,255,0.96)),linear-gradient(135deg,rgba(255,107,74,0.08),rgba(84,160,255,0.08))] p-8 shadow-[0_24px_60px_rgba(38,53,77,0.14)]"
			>
				<p class="mb-4 text-xs font-bold tracking-[0.2em] text-[#ff6b4a] uppercase">Design</p>
				<h2 class="text-3xl font-semibold tracking-tight text-slate-950">Fresh and lightweight</h2>
				<p class="mt-3 max-w-xl text-base leading-8 text-slate-600">
					The original look and feel is preserved, but the site now has a modern SvelteKit
					toolchain, Tailwind utilities, and a cleaner path to long-term maintenance.
				</p>
			</section>

			<section
				class="rounded-3xl border border-slate-900/10 bg-white/90 p-8 shadow-[0_24px_60px_rgba(38,53,77,0.14)]"
			>
				<p class="mb-4 text-xs font-bold tracking-[0.2em] text-[#ff6b4a] uppercase">Built With</p>
				<h2 class="text-3xl font-semibold tracking-tight text-slate-950">Static-site tooling</h2>
				<ul class="mt-3 space-y-3 pl-5 text-base leading-8 text-slate-600 marker:text-[#ff6b4a]">
					<li>SvelteKit 2 with Svelte 5 and TypeScript</li>
					<li>Tailwind CSS 4 and Vite 8</li>
					<li>Static adapter configuration for GitHub Pages</li>
					<li>Docker-based VS Code Dev Container with your Git config</li>
				</ul>
			</section>
		</main>
	</div>
</div>
