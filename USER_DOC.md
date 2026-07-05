# User Documentation

This document explains how to use the Inception infrastructure as an end user or
system administrator — without needing to read any of the underlying code.

## 1. What this stack provides

The project runs a small WordPress website behind NGINX, backed by a MariaDB
database. Three services work together:

| Service   | Role                                                              |
|-----------|--------------------------------------------------------------------|
| `nginx`   | The only entry point into the infrastructure. Serves the site over HTTPS (port 443, TLSv1.2/1.3 only). |
| `wordpress` | Runs the WordPress application itself (PHP-FPM). Not reachable directly from outside — only `nginx` talks to it. |
| `mariadb` | Stores all WordPress data (posts, users, settings). Not reachable directly from outside — only `wordpress` talks to it. |

All three run in separate containers, connected through a single internal Docker
network (`inception`), and are configured to restart automatically if one of them
crashes unexpectedly.

## 2. Starting and stopping the project

From the project's root directory:

```sh
make            # builds the images (if needed) and starts every service
```

To stop everything without deleting any data:

```sh
make down
```

To stop everything **and** wipe all persistent data (database content and
WordPress files), use:

```sh
make fclean
```

> Be careful with `fclean` — once data is wiped, your site and all its content
> have to be recreated from scratch on the next `make`.

## 3. Accessing the website and the admin panel

Once the stack is running, open a browser and go to:

```
https://sboukiou.42.fr/
```

You will likely see a browser warning about the certificate — this is expected,
since the project uses a self-signed TLS certificate rather than one issued by a
public certificate authority. You can safely proceed past this warning.

To reach the **WordPress administration panel**, go to:

```
https://sboukiou.42.fr/wp-admin/
```

Log in there using the administrator account described below.

## 4. Locating and managing credentials

This project intentionally keeps every password out of the codebase. There are
two WordPress accounts:

- An **administrator** account (full control over the site).
- A **regular/author** account (can write content, no admin privileges).

Their usernames and the database connection settings are defined in the
project's `.env` file. Their actual **passwords** are not stored there — they
live as individual files inside the `secrets/` folder at the root of the
repository (one file per password: database user, database root user,
WordPress admin, WordPress regular user).

To check or change a password:
1. Open the relevant file under `secrets/`.
2. If you change a value, you must rebuild and restart the stack
   (`make fclean` then `make`) for it to take effect — passwords are only
   applied the first time each service initializes its data.

Never commit the contents of `secrets/` or `.env` to a public Git repository.

## 5. Checking that everything is running correctly

To see the status of every container at a glance:

```sh
docker compose -f srcs/docker-compose.yml ps
```

A healthy stack shows all three services as `Up` (mariadb specifically will
also show a `healthy` status once fully initialized). If any service repeatedly
restarts, check its logs:

```sh
docker compose -f srcs/docker-compose.yml logs <service_name>
```

(`<service_name>` is one of `mariadb`, `wordpress`, or `nginx`.)

If the website itself isn't loading even though all containers show as
running, the most common cause is the domain not resolving to your machine —
make sure `sboukiou.42.fr` is correctly mapped to your host's IP address
(e.g. in `/etc/hosts`).
