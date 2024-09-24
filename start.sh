#!/bin/bash
cd $(cd $(dirname $0); pwd)
install() {
sudo apt update
sudo apt install lua5.3
sudo apt-get install liblua5.3-dev
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt upgrade
sudo apt install zip
sudo apt install build-essential checkinstall zlib1g-dev -y
sudo apt install g++-4.7 c++-4.7
sudo apt install gcc-4.9
sudo apt upgrade libstdc++6
sudo apt install libreadline-dev libconfig-dev libssl-dev lua5.3 liblua5.3-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
sudo apt install screen
sudo apt install libnotify-dev
sudo apt install libconfig++9v5 libstdc++6
sudo apt install libconfig++8-dev
sudo apt install lua-lgi
sudo apt install build-essential checkinstall zlib1g-dev -y
sudo apt install redis-server
sudo apt-get install lua-sec-dev
mkdir tmp
cd tmp
sudo apt --yes install build-essential libreadline-dev && sudo apt --yes install make && sudo apt --yes install cmake
wget https://github.com/ZdGram/libssl1.1_1.1.1f-1ubuntu2.12_amd64/raw/main/curl.tar.gz
tar -xzvf curl.tar.gz && sudo cp curl -r /usr/include/ && sudo rm -rf curl.tar.gz
sudo  tar zxpf luarocks-2.4.3.tar.gz
curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz && tar -zxf lua-5.3.4.tar.gz && cd lua-5.3.4 && sudo make linux test && sudo make install && cd .. && sudo rm -rf lua-5.3.4.tar.gz && sudo rm -rf lua-5.3.4
wget https://luarocks.org/releases/luarocks-3.0.4.tar.gz && tar zxpf luarocks-3.0.4.tar.gz && cd luarocks-3.0.4 && ./configure && sudo make build && sudo make install && cd .. && sudo rm -rf luarocks-3.0.4 && sudo rm -rf luarocks-3.0.4.tar.gz
sudo apt-get update && sudo apt-get --yes install libreadline-dev libssl-dev lua5.1 liblua5.1-dev git make unzip redis-server curl libcurl4-gnutls-dev libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev tmux subversion && wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz && tar zxpf luarocks-2.2.2.tar.gz && cd luarocks-2.2.2 && sudo ./configure && sudo make bootstrap && sudo luarocks install luasocket && sudo luarocks install luasec && sudo luarocks install redis-lua && sudo luarocks install lua-term && sudo luarocks install serpent && sudo apt-get --yes install curl && sudo luarocks install std.normalize && cd .. && sudo rm -rf luarocks-2.2.2.tar.gz && sudo rm -rf luarocks-2.2.2 && sudo luarocks install luaposix && sudo luarocks install copas && sudo luarocks install dkjson && sudo apt-get --yes install libcurl4-openssl-dev && sudo luarocks install Lua-cURL --server=https://luarocks.org/dev && sudo luarocks install lua-curl
sudo rm -rf luarocks-3.0.4* && sudo rm -rf lua-5.3.4* && sudo rm -rf lua-curl-error*
sudo luarocks install luarocks
sudo luarocks install luasec
sudo luarocks install luasocket
sudo luarocks install redis-lua
sudo luarocks install lua-term
sudo luarocks install serpent
sudo luarocks install dkjson
sudo luarocks install Lua-cURL
cd ..
rm -rf tmp
rm -rf luarocks*
}
up() {
  if [[ $(lsb_release -rs) == "22.04" ]]; then
     wget https://github.com/ZdGram/libssl1.1_1.1.1f-1ubuntu2.12_amd64/raw/main/libssl1.1_1.1.1f-1ubuntu2.12_amd64.deb
     sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.12_amd64.deb
     sudo rm -rf libssl1.1_1.1.1f-1ubuntu2.12_amd64.deb
  fi
  sudo rm -rf /usr/lib/x86_64-linux-gnu/lua/5.3/tdlua.so
  sudo rm -rf /usr/local/share/lua/5.3/TD.lua
  so_path_file=('/usr' 'lib' 'x86_64-linux-gnu' 'lua' '5.3' 'tdlua.so')
  tdbot_client_path=('/usr' 'local' 'share' 'lua' '5.3' 'TD.lua')
  function exists {
    local file_path=$1
    if [ -e "$file_path" ]; then
      return 0
    else
      return 1
    fi
  }
  function rem_and_create_dir {
    local tab=("$@")
    local file_path=$(IFS=/; echo "${tab[*]}")
    rm -rf "$file_path"
    for ((folder=1; folder<=5; folder++)); do
      local path=${tab[0]}
      for ((level=2; level<=folder; level++)); do
        path="$path/${tab[level-1]}"
      done
      if ! exists "$path"; then
        sudo mkdir "$path"
      fi
    done
  }
  if unzip tdlua.zip; then
    rem_and_create_dir "${so_path_file[@]}"
    sudo mv tdlua.so "$(IFS=/; echo "${so_path_file[*]}")"
    rem_and_create_dir "${tdbot_client_path[@]}"
    sudo mv tdbot.lua "$(IFS=/; echo "${tdbot_client_path[*]}")"
    sudo rm -rf tdlua.zip
    if exists "$(IFS=/; echo "${so_path_file[*]}")" && exists "$(IFS=/; echo "${tdbot_client_path[*]}")"; then
      sudo lua5.3 start.lua
    fi
  fi
}
if [ "$1" = "run" ]; then
  sudo lua5.3 start.lua
fi
if [ "$1" = "ins" ]; then
  install
  up
fi