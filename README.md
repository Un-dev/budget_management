# Master project

This is a simple budget app developped in ruby on rails. It is primarly aimed as a final project for my master degree. It will just be a webapp in the first place but i could consider wrapping it in a React-Native Skeleton and deploy it on google store (not ios cuz I dont want).

## Installation

### todo : Docker Hub CI

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
> rails s
```

to run the server
