[![Ruby](https://badgen.net/badge/icon/ruby?icon=ruby&label)](https://https://ruby-lang.org/)
[![GitHub release](https://img.shields.io/github/v/release/Un-dev/budget_management.svg)](https://github.com/Un-dev/budget_management/releases/)

# Budgetize

This is a simple budget app developped in ruby on rails. It is inintially aimed as a final project for my master degree. The goal is to provide to users a simple way to manage their budget with stats analytics, accessible from everywhere (except ios because it cost 100 heckin annual dollars)

## Installation

```bash
git clone https://github.com/Un-dev/budget_management.git
cd budget_management

# install node node 16 and yarn
dnf module install nodejs:16
sudo npm install --global yarn

# install postgres


#install ruby 3
sudo dnf install gcc-c++ patch readline readline-devel zlib zlib-devel \
    libyaml-devel libffi-devel openssl-devel make \
    bzip2 autoconf automake libtool bison sqlite-devel
curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg2 --import -
curl -L get.rvm.io | sudo bash -s stable
rvm reload

rvm requirements run
#Checking requirements for fedora.
#Requirements installation successful.
rvm install 3.0

# install rails
sudo dnf group install "C Development Tools and Libraries"
sudo dnf install ruby-devel zlib-devel

# start the project
sudo chown -R $USER /usr/local/rvm/gems/ruby-3.0.0
yarn
bundle
./bin/rails db:create
./bin/rails db:migrate
```

### For people who may by any chance need to install Budgetize on a raw Fedora 36 workstation

### For developpers

You will need `Node 16.11.0`, `ruby 3.0.0p0`, `rails 6.1.4.4`, `postgres 14.1`

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
