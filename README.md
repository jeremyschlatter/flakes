My nix flakes repo.

I use this repo to manage dependencies for third-party code that I want to build from source.

# How I use this

Say I find a bug in some open source project and I feel motivated to fix it. A recent example of this was when I found a [UI bug](https://github.com/bbycroft/llm-viz/pull/22) in this [excellent LLM visualizer](https://bbycroft.net/llm).

The first step is to build that project locally, from source. Thankfully, this repo has pretty simple [instructions](https://github.com/bbycroft/llm-viz/blob/0b6dbbb5a397416a0f128af2b2cddd8a1e0c7cbb/README.md#running-locally) to get started:

    1. Install dependencies: `yarn`
    2. Start the dev server: `yarn dev`

So I make a little flake that just installs `yarn`:

    da40f31 add flake: llm-viz

And I run `yarn` and `yarn dev` as instructed. Good stuff.

Then I get a little deeper into the project and find that fixing the bug requires editing one of the .odin files in the repo. This isn't mentioned in the getting started instructions, but rebuilding the odin files requires having an odin compiler installed and running the relevant `build.sh` script. And unfortunately, the latest odin compiler won't work: odin's syntax has changed in a backward-incompatible way since this code was written. So I go hunting for a compatible version. Eventually I binary-search my way to odin version [`dev-2023-05`](https://github.com/odin-lang/Odin/releases/tag/dev-2023-05). Cool. This version was added to the public nixpkgs repo in https://github.com/NixOS/nixpkgs/commit/38e5815. I add that to my flake:

    ffaf4ad update flake: llm-viz

I successfully compile the old odin code and I'm back on my way to fixing the bug.

Using this flake, I've created a development environment that lets me work on this project. I've done it in a way that I can easily recreate elsewhere if needed, and I've done it without making global changes to my system. I find this really helpful, and having this available makes me feel more empowered to work on any arbitrary codebase I stumble on.
