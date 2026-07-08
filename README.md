## ***This project has been created as part of the 42 curriculum by [sboukiou](https://github.com/sboukiou)***

# 🐳 Inception - System Administration with Docker

## 📖 Description
### This project is about setting up a small infrastructure composed of three services:
    1. A database server (MariaDB)
    2. A Website  (WordPress)
    3. A web server (Nginx)

    ***As the project Subject States, This has to be done using Docker and Docker-Compose?***
    **But What is docker ? And what is Docker compose??**
    If you have the time, I strongly recommend you check this book: **[The docker Book](https://github.com/AngelSanchezT/books-1/blob/master/docker/the-docker-book.pdf)**
    Otherwise, You can check the docker docs, articles online, courses ... Here are few:
    * [Docker Documentation](https://docs.docker.com/)
    * [How docker creates containers in depth](https://youtu.be/sK5i-N34im8?si=6t9CMJjiLEthWshA) (If you want a deep lookup under the hood)

    You basically need to have a basic understanding of :
    building and running containers (ie: docker build, docker run, that's it).
    How to write a dockerfile.
    Have an idea about volumes, networks in the context of docker.
    And you are ready to build you services, run and connect them.
    But running multi container applications and managing/tracking them manually is a time waste, and not efficient. How do we change that?
    **Exactly: Docker compse**
