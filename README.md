# kubernetes (k8s) microservices example

It's a simple project using k8s and a application of [voting](https://github.com/kodekloudhub/example-voting-app) course.

## :hushed: Overview

The microservices architecture is based on the drawing below:

``` code
               +--------------+                +--------------+
               |  USER ACCESS |                |  USER ACCESS |
               |              |                |              |
               |  PORT: 80    |                |  PORT: 80    |
               |              |                |              |
               |              |                |              |
               +------^-------+                +------^-------+
                      |                               |
              +-------+--------+              +-------+--------+
              |     POD        |              |      POD       |
              | +------------+ |              | +------------+ |
              | |            | |              | |            | |
              | |            | |              | |            | |
              | | Voting-app | |              | | Result-app | |
              | |            | |              | |            | |
              | |            | |              | |            | |
              | +------------+ |              | +------------+ |
              +-+-----+------+-+              +-+-----^------+-+
                      |                               |
                      |                               |
                      |                               |
                      |                               |
              +-------v--------+              +-------+--------+
              |      POD       |              |      POD       |
              | +------------+ |              | +------------+ |
+---------+   | |            | |              | |            | |     +---------+
|Port:6373|   | |            | |              | |            | |     |Port:5432|
+---------+   | | Redis-db   | |              | | Postgres-db| |     +---------+
              | |            | |              | |            | |
              | |            | |              | |            | |
              | +------------+ |              | +------------+ |
              +-+-----+------+-+              +-+-----^------+-+
                      |                               |
                      |                               |
                      |                               |
                      |                               |
                      |                               |
                      |       +----------------+      |
                      |       |      POD       |      |
                      |       | +------------+ |      |
                      |       | |            | |      |
                      |       | |            | |      |
                      +-------> |  Worker    | +------+
                              | |            | |
                              | |            | |
                              | +------------+ |
                              +-+------------+-+
```

## :memo: Requirements

- Tools: 
  - [Git](https://git-scm.com/)
  - [make](https://howtoinstall.co/pt/make)
  - [kubectl](https://kubernetes.io/docs/tasks/tools/)
  - [minikube](https://minikube.sigs.k8s.io/docs/start/)
  
## :blue_car: Running

Firstly, on k8s-microservices-example directory, just try: `make help` command and you will see the commands availables.

### Start cluster

        make minikube-start

### Deploy k8s application

        make deploy-cluster

### Get apps urls (voting and result apps)

        make get-urls

## Known issues

* Database passwords that are not using secrets or env variables.

## :bookmark_tabs: Reference

* Github project based: https://github.com/kodekloudhub/example-voting-app
* Learned content: https://kodekloud.com
* ASCII art: https://asciiflow.com/#/
* Markdown Emojis VSCode: https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji
* Emoji list: https://github.com/ikatyang/emoji-cheat-sheet
