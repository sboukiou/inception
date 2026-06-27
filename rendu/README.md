## ***This project has been created as part of the 42 curriculum by [sboukiou](https://github.com/sboukiou)***

## Description:
    This project is about setting up a small infrastructure for an application.
    Composed by three main services:
        * A web server (Nginx)
        * A database server (MariaDb)
        * A backend structure (WordPress)
    Combined together, those three services
    serve a dynamic web application with an admin user
    and a regular user, the website is accessible only throug:
        `https://sboukiou.42.fr:443`

## Instructions:
    To build the application and run it do the following:
    ```
        # First make sure you are at the root directory, same as the Makefile.
        make all # -> Invokes make build which builds the images and then composes and runs the architecture.

        # to shut down without wiping out anything
        make down
        # to shutdown and clean up data, images ...
        make fclean

        # to do a redo all of above:
        make re
```

## Resources:

    [The docker official docs Obviously]()
    [The docker book]()
    [MariaDb docs]()
    [WordPress docs]()
    [Same project, by other students]() **(for inspiration purposes only!)**

## Usage:
