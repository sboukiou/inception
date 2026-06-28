### DEV_DOC.md

```markdown
# Developer Documentation - Inception Infrastructure

## 🛠 Environment Setup

### Prerequisites
Before building the project, ensure your environment meets these requirements [5, 15]:
*   **OS**: Linux VM (Debian Bullseye recommended) [16, 17].
*   **Software**: Docker Engine (v20.10+), Docker Compose (v2.0+), and GNU Make [15].
*   **Domain Mapping**: Add `127.0.0.1 sboukiou.42.fr` to your `/etc/hosts` file [18, 19].

### Configuration and Secrets
The project uses a hybrid approach for configuration [11, 13]:
1.  **Secrets**: Sensitive data (DB/WP passwords) must be created in `/home/sboukiou/secrets/` as `.txt` files [10].
2.  **Environment**: Create a `srcs/.env` file containing non-sensitive variables such as `DOMAIN_NAME`, `MYSQL_USER`, and `MYSQL_DATABASE` [12, 13].
3.  **Forbidden**: Never hardcode passwords in Dockerfiles or include your `.env` and `secrets/` folder in your Git repository [12, 20].

## 🏗 Build and Launch
The infrastructure is orchestrated using a `Makefile` at the root, which calls `docker-compose.yml` [21, 22].

*   **Build/Start**: `make` or `make up` triggers the image builds and container initialization [5, 6].
*   **Rebuild**: `make re` performs a full clean and rebuild of all services [6].

## 🛠 Management Commands

### Container Management
*   **View Logs**: `docker-compose logs <service_name>` [23].
*   **Access Terminal**: `docker exec -it <container_name> /bin/bash` [24].
*   **Check Networks**: `docker network ls` to see the custom bridge network `inception` [25, 26].

### Volume Management
*   **List Volumes**: `docker volume ls` [27].
*   **Inspect**: `docker volume inspect <volume_name>` to see mount details [28].

## 💾 Data Persistence and Storage
The project uses **Named Volumes** with the `local` driver to ensure data survives container restarts and removals [27, 29].

### Host Storage Paths
Data is physically persisted to the following mandatory host directories [4, 8]:
*   **WordPress Files**: `/home/sboukiou/data/wordpress`
*   **Database Data**: `/home/sboukiou/data/mariadb`

### Persistence Logic
*   **Named Volumes**: These volumes are linked to the host paths via `driver_opts` using `type: none`, `o: bind`, and the specific `device` path [173, Conversation].
*   **Isolation**: Only the NGINX container has read-only access to WordPress files for security; all other inter-service data transfer is isolated within the bridge network [26, 27].
