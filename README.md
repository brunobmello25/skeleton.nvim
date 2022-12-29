# skeleton.nvim

My personal neovim config.

## TODO

- [x] Setup packer autoclone and sync
- [x] Prevent packer from syncing every time I open neovim
- [x] Basic keymaps and colorscheme (catppuccin)
- [x] Fuzzy finder for files and grep with telescope
- [x] LSP and autocompletion
- [x] Formatting
- [x] Smart commenting
- [x] Debugger
- [x] Add installation guide in readme
- [x] Git integration
- [x] Configure prettier as a fallback for when there is no eslint config
- [ ] configure node debugger to attach to a docker container

Not necessarily in this order

# How to install

```bash
# backup your old configuration if you have any
mv ~/.config/nvim ~/.config/nvim_old

make install
```

# Known Issues

- after cloning and installing vim will crash on the first open. To fix this, simply wait for packer to sync all plugins, close and open vim again and it will be working normally

# Mason Requirements (run :Mason)

- efm (langserver used for eslint)
- black (python formatter)
