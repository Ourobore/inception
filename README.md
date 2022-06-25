# Inception

The goal of this project was to learn how to deploy a small **infrastructure of services**: a **mariaDB** service with it's corresponding volume, a **wordpress** one with a volume for it's files, and an **NGINX** one acting as a reverse proxy.

I learned _containerization_ and _deployment_ with **Docker** and **Docker Compose**. All containers are build from `alpine` to minimize disk space and image bloating, but also to maximize deployment speed.

<br/>

## How to run the project

I added a Makefile as complete as possible (with `help` command) to build, deploy or stop the app in just one command. The following command will build and deploy the app on `localhost`:

```
$ make build up
```

and to stop it:

```
$ make stop
```

_(See the Makefile for more commands, especially for cleaning)_

<br/>

All the necessary files are accessible in the `srcs` folder:

- A `.env` to regroup all variables (service version, config and secret variables) needed in one place so that they are easily editable.
- A `requirements` folder, subdivided by service.
- Each service folder contain a `Dockerfile`, and some config files / scripts if needed.
