# Workstation Docker Setup

This project sets up a development workstation, including the necessary configurations and tools. Below are the steps to build and run the container.

## Testing

To test configuration using the docker image, use the following:

```bash
make build
make run
```

## Installation

Once happy, install system-wide using the following:

```bash
cd ansible
chmod +x install.sh && ./install.sh
chmod +x dotfiles-install.sh && ./dotfiles-install.sh
```

# Keybindings

This configuration assumes the following keybindings

## Neovim

Ctrl+n - open/close file tree
Ctrl+g - open/close terminal
Ctrl+m - move focus from window/file tree/terminal
<leader>tf - show current file in file tree
Ctrl+p - to go to a file
<leader>pf - find in all files
<leader>ps - find a string in all files
:gd - go to definition
:gr - find references
:gi - go to implementation
Ctrl+o - Go to last place where cursor was (To move back from :gd/:gi)
Ctrl+o - Go to next place where cursor was (To move back to :gd/:gi)
:gc - to comment/uncomment lines in visual mode
<leader>rf - rename occurances in current file
<leader>ra - rename all occurances
