# Lunar Vim Customizations

After installing [lunarvim](https://www.lunarvim.org/), simply clone this repo to
 ``~/.config/lvim``

# Troubleshooting

I was getting ``treesitter/highlighter: Error executing lua: ...`` errors after a PackerUpdate.
I fixed this by running ``:checkhealth nvim-treesitter`` and running ``:TSUpdate lua``.

To get formatting etc working do this:

```
:MasonInstall gopls golangci-lint-langserver delve goimports gofumpt gomodifytags gotests impl
```

# Nerd fonts

On windows, install via Chocolatey:

```bash
choco install nerd-fonts-hack
```

Then select that font in Putty
