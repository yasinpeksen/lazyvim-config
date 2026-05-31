# 💤 LazyVim

My personal template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

### Linux / MacOS
```bash

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
cd ~/.config/nvim
git init
git remote add origin https://github.com/yasinpeksen/lazyvim-config.git
git pull origin main
git branch --set-upstream-to=origin/main main

```


### Windows
```bash

git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
rm -rf ~/.config/nvim/.git
cd $env:LOCALAPPDATA\nvim
git init
git remote add origin https://github.com/yasinpeksen/lazyvim-config.git
git pull origin main
git branch --set-upstream-to=origin/main main

```
