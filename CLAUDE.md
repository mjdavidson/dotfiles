# Dotfiles

Nick Nisi's dotfiles repo. Manages configs for zsh, neovim, tmux, ghostty, git, and Claude Code.

## Structure

- `home/` — Files symlinked to `~/` (dotfiles like `.zshenv`, `.claude/`)
- `config/` — App configs symlinked into `~/.config/` (nvim, tmux, zsh, git, etc.)
- `bin/` — Scripts added to `$PATH` (claude-statusline, git helpers, etc.)
- `tools/` — Tooling and helpers

## Setup (this fork)

This machine is wired by hand-managed symlinks (`~/.config/{tmux,ghostty,nvim,aerospace,zsh,kitty,...}`
and `~/.zshenv` point into this repo; `~/.claude/settings.json`, `~/.config/mise` and `~/.config/git`
are real files that upstream's installer would replace). **Never run `install.sh`,
`mise bootstrap`, or `mise bootstrap dotfiles apply` here.** Sync with upstream by rebasing
the personal commits onto `origin/main` (origin = nicknisi/dotfiles, mjdavidson = this fork).

## Key conventions

- `config/` dirs map 1:1 to `~/.config/<name>/`
- `home/` entries are symlinked directly to `~/`
- Claude Code settings live in `home/.claude/settings.json` → `~/.claude/settings.json`
- Shell entry point: `home/.zshenv` → `~/.zshenv`, loads `config/zsh/.zshrc`
