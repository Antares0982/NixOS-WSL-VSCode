# NixOS-WSL-VSCode
A script for setting up Visual Studio Code in NixOS-WSL

### Usage

Before launch vscode for WSL, copy `shell.nix` and `server-env-setup` to `~/.vscode-server`:

```
mkdir -p $HOME/.vscode-server
cp shell.nix $HOME/.vscode-server
cp server-env-setup $HOME/.vscode-server
```

Then everything should be done correctly.
