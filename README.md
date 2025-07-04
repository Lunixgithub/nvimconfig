# LunixVim (Based on TinyVim)
- Personal implemantation of the Minimal Neovim config TinyVim (by NvChad) which is meant to be a starting point for new neovim users.


# Install
- Linux or MacOS
```bash
git clone https://github.com/Lunixgithub/nvimconfig.git
```

Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins

- Windows
```bash
git clone https://github.com/Lunixgithub/nvimconfig.git $HOME\AppData\Local\nvim --depth 1 && nvim
```

Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins

# Reset
```bash
rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim/lazy-lock.json
```

# Dir structure
```bash
├── init.lua
├── lua
    ├── commands.lua
    ├── mappings.lua
    ├── options.lua
    └── plugins
        ├── init.lua
        ├── configs
            ├── blink.lua
            ├── telescope.lua
            └── ( more ... )
```


 



# Important Plugins used
Below is the list of some very important plugins which I think should be must for any neovim config.

| Name             | Description                                  |
|-------------------------|----------------------------------------------|
| nvim-tree.lua           | File tree                                    |
| Nvim-web-devicons       | Icons provider                               |
| nvim-treesitter         | Configure treesitter                         |
| bufferline.nvim         | Tab + bufferline plugin                      |
| blink.cmp               | Autocompletion                               |
| Luasnip & friendly snippets               | Snippets                                      |
| mason.nvim              | Download binaries of various lsps, formatters, debuggers, etc. |
| gitsigns.nvim                | Git-related features                         |
| comment.nvim            | Commenting                                   |
| telescope.nvim          | Fuzzy finder                                 |
| conform.nvim            | Formatter                                    |
