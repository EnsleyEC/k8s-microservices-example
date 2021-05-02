# Kubernetes (k8s) microservices example + Istio monitoring

It's a simple project using k8s and a application ([voting](https://github.com/kodekloudhub/example-voting-app)) of microservices.

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
|Port:6379|   | |            | |              | |            | |     |Port:5432|
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
  - [Istio](https://istio.io)
  
## :blue_car: Running

Firstly, on k8s-microservices-example directory, just try: `make help` command and you will see the commands availables.

### Clone project

        git clone https://github.com/EnsleyEC/k8s-microservices-example.git

### Start cluster

        make minikube-start

### Deploy k8s application + Istio

        make deploy-app

### Get apps urls (voting and result apps)

        make get-app-urls

### Get Kiali UI - URL (Istio)

        make get-kiali-url

## :monocle_face: Known issues

* Database passwords that are not using secrets or env variables.

## :bookmark_tabs: Reference

* Github project based: 
  * https://github.com/kodekloudhub/example-voting-app
  * https://github.com/DickChesterwood/istio-fleetman/tree/master/_course_files/warmup-exercise
* ASCII art: https://asciiflow.com/#/
* Markdown Emojis VSCode: https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji
* Emoji list: https://github.com/ikatyang/emoji-cheat-sheet
