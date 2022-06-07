[![Ruby](https://badgen.net/badge/icon/ruby?icon=ruby&label)](https://https://ruby-lang.org/)
[![GitHub release](https://img.shields.io/github/v/release/Un-dev/budget_management.svg)](https://github.com/Un-dev/budget_management/releases/)

# Budgetize

This is a simple budget app developped in ruby on rails. It is inintially aimed as a final project for my master degree. The goal is to provide to users a simple way to manage their budget with stats analytics, accessible from everywhere (except ios because it cost 100 heckin annual dollars)

## Installation

### This is a complete installation guide for Ubuntu 22.04 (It was required to provide one on Fedora 36 but there is a known install issue of ruby on this particular os and I dont know/have the  time to debug it)

```bash
git clone https://github.com/Un-dev/budget_management.git
cd budget_management

# install node node 16 and yarn
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt -y install nodejs
sudo apt install gnupg2
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

# install postgres
sudo apt -y install gnupg2 wget vim
sudo apt-cache search postgresql | grep postgresql
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt -y update
sudo apt -y install postgresql-14

# install ruby 3.0.2
sudo apt install git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
sudo apt install ruby-full
rbenv install mruby-3.0.0
rbenv global mruby-3.0.0

# start the project
sudo -i -u postgres
psql
CREATE ROLE dev WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD 'p4ssw0rd';
# then exit psql and postgres
git clone https://github.com/Un-dev/budget_management.git
cd budget_management
yarn
bundle
sudo rails db:create
sudo rails db:migrate
rails s
```

### For developpers

You will need `Node 16`, `ruby 3.0.2`, `rails 6.1.6`, `postgres 14`

on the first start :

```
$ yarn
$ bundle
$ rails db:create
$ rails db:migrate

# this one is for loading fake data
$ rails db:seed
```

then you will just need

```
$ bin/dev
```

to run the server

below is the db schema :

![alt text](https://github.com/Un-dev/budget_management/blob/main/db_schema.png)
