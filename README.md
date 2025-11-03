# Chezmoi-managed configuration files

## Prerequisits

Create the main configuration in _~/.config/chezmoi/chezmoi.yaml_:

```yaml
data:
  workstation: "" # {work,home,rpi}
  git:
    email: ""     # git email address
    name: ""      # git username
# optionally to set neovim as merge tool
merge:
  command: "nvim"
  args: ["-d"]
```

## Package requirements

To ensure that everything works seamlessly, install the following packages:

- [fzf](https://github.com/junegunn/fzf)

- [zoxide](https://github.com/ajeetdsouza/zoxide)

- [neovim](https://github.com/neovim/neovim)

- [bat](https://github.com/sharkdp/bat)

- git
