# Install dependencies
brew install autoconf
brew install openssl@1.1
brew install wxwidgets
brew install unzip
brew install interface99

asdf latest --all

# Install Erlang/OTP
# https://github.com/asdf-vm/asdf-erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang $(asdf latest --all | awk '/erlang/ {print $2}')
asdf global erlang $(asdf latest --all | awk '/erlang/ {print $2}')

# Install Elixir
# https://github.com/asdf-vm/asdf-elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir $(asdf latest --all | awk '/elixir/ {print $2}')
asdf global elixir $(asdf latest --all | awk '/elixir/ {print $2}')
