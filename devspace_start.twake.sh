#!/bin/bash
set +e # Continue on errors

COLOR_BLUE="\033[0;94m"
COLOR_GREEN="\033[0;92m"
COLOR_RESET="\033[0m"

# echo -e "${COLOR_BLUE}"
# echo ">>> Installing OS Dependencies"
# echo -e "${COLOR_RESET}"
# apt-get update &&
# 	apt-get install -y --no-install-recommends python3 python3-pip g++ build-essential git libsqlite3-dev postgresql-client libkrb5-dev gcc openssl libssh2-1-dev make &&
# 	rm -rf /var/lib/apt/lists/*

# pip3 install mkdocs-techdocs-core mkdocs-material mkdocs-minify-plugin --break-system-packages

# echo -e "${COLOR_BLUE}"
# echo ">>> Installing Yarn Dependencies"
# echo -e "${COLOR_RESET}"
# echo y | yarn install

cd twake/twake-flutter
./scripts/prebuild.sh

# Print useful output for user
echo -e "${COLOR_BLUE}
     %########%
     %###########%       ____                 _____
         %#########%    |  _ \   ___ __   __ / ___/  ____    ____   ____ ___
         %#########%    | | | | / _ \\\\\ \ / / \___ \ |  _ \  / _  | / __// _ \\
     %#############%    | |_| |(  __/ \ V /  ____) )| |_) )( (_| |( (__(  __/
     %#############%    |____/  \___|  \_/   \____/ |  __/  \__,_| \___\\\\\___|
 %###############%                                  |_|
 %###########%${COLOR_RESET}


Welcome to your development container!

This is how you can work with it:
- Files will be synchronized between your local machine and this container
- Run \`${COLOR_GREEN}$ flutter build web ${COLOR_RESET}\`to start the application
- Some ports will be forwarded, so you can access this container via localhost
"

# Set terminal prompt
export PS1="\[${COLOR_BLUE}\]devspace\[${COLOR_RESET}\] ./\W \[${COLOR_BLUE}\]\\$\[${COLOR_RESET}\] "
if [ -z "$BASH" ]; then export PS1="$ "; fi

# Include project's bin/ folder in PATH
export PATH="./bin:$PATH"

# Open shell
bash --norc
