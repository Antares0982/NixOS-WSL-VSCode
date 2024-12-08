# NixOS-WSL-VSCode
A script for setting up Visual Studio Code in NixOS-WSL. This script is inspired by [sonowz/vscode-remote-wsl-nixos](https://github.com/sonowz/vscode-remote-wsl-nixos).

### Usage

Before launch vscode for WSL, copy `shell.nix` and `server-env-setup` to `~/.vscode-server`:

```
mkdir -p $HOME/.vscode-server
rm $HOME/.vscode-server/shell.nix $HOME/.vscode-server/server-env-setup > /dev/null 2>&1
cp shell.nix $HOME/.vscode-server
cp server-env-setup $HOME/.vscode-server
```

Then you can start connecting WSL in VSCode.

### Known issue

Every time your VSCode gets updated (including the very first run), the binary will be updated and the connection fails for sure. Retry should fix it.

