# SaltStack for Zed

A language extension for [Zed](https://zed.dev/) that provides practical editing support for SaltStack state, pillar, SaltCheck, and Jinja template files. It is inspired by [`korekontrol/vscode-saltstack`](https://github.com/korekontrol/vscode-saltstack), but is implemented as a native Zed language extension.

## Features

- Detects Salt state/pillar and SaltCheck files: `.sls`, `.tst`
- Detects Jinja templates: `.jinja`, `.jinja2`, `.j2`
- Highlights Jinja syntax in all supported files
- Injects YAML highlighting into non-Jinja portions of Salt files
- Provides comment settings, two-space indentation, and basic bracket matching
- Includes curated snippets for common states, requisites, pillar/grain lookups, and Jinja blocks

The extension intentionally leaves `.yaml` and `.yml` files assigned to Zed's built-in YAML language. Salt content written in those suffixes can be selected manually as **SaltStack** from the language selector.

## Install locally as a development extension

1. In Zed, open the command palette.
2. Run **Extensions: Install Dev Extension**.
3. Select this repository's root directory (the directory containing `extension.toml`).
4. Open `examples/nginx.sls`.
5. Confirm that Zed reports **SaltStack** in the language selector and that both YAML and Jinja are highlighted.

You can use `examples/users.tst` and `examples/template.jinja` to check SaltCheck and stand-alone Jinja detection.

## Snippets

Start typing a prefix and select an entry from Zed's completion list. Included Salt prefixes include:

- States: `state`, `pkg.installed`, `pkg.removed`, `service.running`, `service.dead`, `file.managed`, `file.directory`, `file.absent`, `cmd.run`, `user.present`, `group.present`
- Structure/requisites: `include`, `require`, `require_in`, `watch`, `watch_in`, `onchanges`, `onlyif`, `unless`
- Salt/Jinja expressions: `pillar.get`, `grains.get`, `jinja-if`, `jinja-if-else`, `jinja-for`, `jinja-set`, `jinja-expression`, `jinja-comment`

## Design and limitations

SaltStack supports Jinja interleaved with YAML. This first release uses the Tree-sitter Jinja grammar and injects Zed's YAML language into non-Jinja content. It is lightweight and requires no language server or Rust/WASM code.

Because YAML and Jinja are parsed separately, complex YAML constructs split by inline Jinja expressions may not receive perfect structural highlighting or indentation. This is a limitation of the injection-based approach, not a Salt parser or validator. A future version could add a Salt-aware language server or a dedicated composite grammar.

## Publishing

Before publishing, replace the placeholder `repository` URL in `extension.toml` with the public repository URL and ensure the extension ID is available in the Zed extensions registry.

## License

[MIT](LICENSE)
