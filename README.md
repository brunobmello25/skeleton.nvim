# skeleton.nvim

My personal neovim config.

Old and deprecated config is in my dotfiles repo: http://github.com/brunobmello25/dotfiles

## TODO

- [x] Setup packer autoclone and sync
- [x] Prevent packer from syncing every time I open neovim
- [x] Basic keymaps and colorscheme (catppuccin)
- [x] Fuzzy finder for files and grep with telescope
- [x] LSP and autocompletion
- [x] Formatting
- [x] Smart commenting
- [ ] Debugger
- [x] Add installation guide in readme
- [ ] Git integration

Not necessarily in this order

# How to install

```bash
# backup your old configuration if you have any
mv ~/.config/nvim ~/.config/nvim_old

make install
```

# Known Issues

- after cloning and installing vim will crash on the first open. To fix this, simply wait for packer to sync all plugins, close and open vim again and it will be working normally
