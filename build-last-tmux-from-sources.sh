# Build last tmux version and install it on the local machine
apt update
apt install -y git automake build-essential pkg-config libevent-dev libncurses5-dev bison
pushd .
cd /tmp
rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux && cd /tmp/tmux
git checkout master
sh autogen.sh && ./configure && make && make install && popd && rm -fr /tmp/tmux
