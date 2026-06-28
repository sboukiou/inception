## ***This project has been created as part of the 42 curriculum by [sboukiou](https://github.com/sboukiou)***

# 🐳 Inception - System Administration with Docker

## 📖 Description
**Inception** is a system administration project from the 42 curriculum focused on broadening knowledge of **Docker** and **Docker Compose**. The objective is to build a small production-like infrastructure composed of multiple isolated services, each running in its own dedicated container based on a custom-built Docker image using the penultimate stable version of **Debian** or **Alpine**.

The infrastructure includes:
*   **NGINX**: A secure web server configured with **TLSv1.2 or TLSv1.3** as the only entry point.
*   **WordPress + php-fpm**: A content management system installed and configured to communicate via FastCGI.
*   **MariaDB**: A relational database for persistent WordPress data storage.
*   **Docker Network**: A custom bridge network ("inception") for internal service communication.
*   **Persistent Volumes**: Managed storage for the WordPress database and website files.

---

## ⚙ Instructions

### 🔧 Prerequisites
*   A **Virtual Machine** running a Linux environment (Debian Bullseye recommended).
*   **Docker Engine** and the **Docker Compose** plugin.
*   **Make** utility.

### 🚀 Build and Run
1.  **Clone the repository**:
    ```bash
    git clone <repository_url> && cd inception
    ```
2.  **Domain Configuration**: Map your local IP to the mandatory domain in your host's `/etc/hosts` file:
    ```bash
    echo "127.0.0.1 sboukiou.42.fr" | sudo tee -a /etc/hosts
    ```
3.  **Launch the infrastructure**: The provided **Makefile** orchestrates the build and deployment process:
    ```bash
    make
    ```
4.  **Access the application**: Open your browser and navigate to **https://sboukiou.42.fr**.

### 🛑 Management Commands
*   **Stop services**: `make clean` (stops containers && removes images while preserving data).
*   **Full cleanup**: `make fclean` (removes containers, images, and volumes).

---

## 🏗 Project Description and Design Choices

This project implements a **microservices-based architecture** where each service is isolated, improving security, scalability, and resource management.

### 💻 Comparisons

| Feature | Design Choice | Comparison |
| :--- | :--- | :--- |
| **VM vs Docker** | **Docker Containers** | **Virtual Machines** run a complete guest OS with high resource overhead and slow boot times. **Docker containers** share the host kernel, providing lightweight, process-level isolation with near-native performance. |
| **Secrets vs Env Variables** | **Docker Secrets** | **Environment Variables** (stored in `.env`) are visible in plain text via `docker inspect` and logs, suitable only for non-sensitive config. **Docker Secrets** are stored as read-only files in `/run/secrets/`, never appearing in container metadata. |
| **Docker Network vs Host Network** | **Custom Bridge Network** | The **Host network** shares the host's network stack directly, lacking isolation. A **custom bridge network** enables secure internal communication via container names (DNS resolution) while keeping most ports closed to the host. |
| **Docker Volumes vs Bind Mounts** | **Named Volumes** | **Bind mounts** map specific host paths directly and are host-dependent. **Named volumes** with the `local` driver allow Docker to manage the volume lifecycle while persisting data to the mandatory `/home/sboukiou/data/` paths. |

---

## 📚 Resources

### Official Documentation
*   [Docker Documentation](https://docs.docker.com/)
*   [Docker Compose Specification](https://docs.docker.com/compose/)
*   [NGINX Documentation](https://nginx.org/en/docs/)
*   [MariaDB Documentation](https://mariadb.org/documentation/)
*   [WordPress CLI (WP-CLI)](https://developer.wordpress.org/cli/commands/)
