#!/bin/sh

echo Check pre-req
command -v zsh || exit 1
command -v curl || exit 1
command -v git || exit 1
command -v tmux || exit 1
command -v nvim || exit 1
command -v uv || exit 1
if ! hostname | grep "\.cloudlab\.us$"; then
  command -v go || exit 1
fi

echo Linking zsh
test -d $HOME/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f $HOME/.zshrc
rm -f $HOME/.zshenv
rm -f $HOME/.oh-my-zsh/themes/tewaro.zsh-theme
rm -rf $HOME/.config/sway
rm -rf $HOME/.config/foot
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zshenv $HOME/.zshenv
ln -s $HOME/.dotfiles/zsh/themes/tewaro.zsh-theme $HOME/.oh-my-zsh/themes/tewaro.zsh-theme
ln -s $HOME/.dotfiles/sway $HOME/.config/sway
ln -s $HOME/.dotfiles/foot $HOME/.config/foot

echo Linking nvim
rm -r $HOME/.config/nvim
mkdir -p $HOME/.config/
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

echo Creating nvim virtualenv
mkdir -p $HOME/.config/neoenv
ln -s $HOME/.dotfiles/nvim/pyproject.toml $HOME/.config/neoenv
pushd $HOME/.config/neoenv
uv venv
source .venv/bin/activate
uv sync
deactivate
popd

echo Linking git
rm $HOME/.gitconfig
rm $HOME/.gitignore_global
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global

echo Linking tmux
rm $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

echo Setup Local Bin
mkdir -p $HOME/.local/bin

echo Set Git Values
git config --global core.excludesfile $HOME/.gitignore_global

if ! hostname | grep "\.cloudlab\.us$"; then
  echo Setup Rust
  test -d $HOME/.cargo || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  rustup component add rust-analyzer

  echo Setup Haskell
  test -d $HOME/.ghcup || curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

  echo Setup Golang
  command -v gopls || go install golang.org/x/tools/gopls@latest
fi
