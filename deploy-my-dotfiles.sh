# vim-airline
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive


# extension on bash
mkdir -p ~/.local && cd ~/.local
git clone https://github.com/fareg/lnx-tools.git
cd lnx-tools
source dotfiles/myextrafuncs
git_set_local_user
cd ~/

# update .bashrc
grep "dotfiles/myrc" ~/.bashrc
if [ $? -eq 1 ]; then
  echo "Adding lnx-tools resources to .bashrc..."
  cat >>.bashrc <<EOF

if [ -f ~/.local/lnx-tools/dotfiles/exbashrc ]; then source ~/.local/lnx-tools/dotfiles/exbashrc; fi
if [ -f ~/.local/lnx-tools/dotfiles/myrc ]; then source ~/.local/lnx-tools/dotfiles/myrc; fi
EOF

  if [[ $SHELL =~ "bash" ]]; then source ~/.bashrc; fi
fi

# update .zshrc if existing
if [ -f ~/.zshrc ]; then
  grep "dotfiles/myrc" ~/.zshrc
  if [ $? -eq 1 ]; then
    echo "Adding lnx-tools resources to .zshrc..."
    cat >>.zshrc <<EOF

if [ -f ~/.local/lnx-tools/dotfiles/myrc ]; then source ~/.local/lnx-tools/dotfiles/myrc; fi
EOF

    if [[ $SHELL =~ "zsh" ]]; then source ~/.zshrc; fi
  fi
fi

# Install our own .tmux.conf
if [ ! -f ~/.tmux.conf ]; then
  ln -s ~/.local/lnx-tools/dotfiles/tmux.conf ~/.tmux.conf
fi

# Install our own .vimrc
# Seee pre req with vim.md
if [ ! -f ~/.vimrc ]; then
  ln -s ~/.local/lnx-tools/dotfiles/vimrc ~/.vimrc
fi

# Install vim airline
source $MYLNXTOOLS/dotfiles/myextrafuncs
vim_install_airline
