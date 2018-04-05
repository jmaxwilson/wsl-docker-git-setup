# wsl-docker-git-setup

This is a shell script that can be run in the **Ubuntu for Windows Bash** running on the **Windows Subsystem for Linux (WSL)** to configure Bash for development using commandline **Docker** and **Git** commands in **Windows 10**.

## Prerequisits and Configuration

- Windows 10 Professional
- Windows Subsystem for Linux (WSL)
- Docker for Windows

### Installing the Windows Subsystem For Linux

Instructions for installing the Windows Subsystem for Linux on Windows 10 and Ubuntu for Windows can be found at the official WSL website:
 
https://msdn.microsoft.com/en-us/commandline/wsl/install_guide 

(The installation may require a system restart)

Once installation is complete, you should be able to start Ubuntu for Windows from the start menu. This project also includes an example shortcut for starting Ubuntu Bash.

### Installing and Configuring Docker for Windows

Instructions for installing Docker for Windows can be found at the official Docker website:

https://store.docker.com/editions/community/docker-ce-desktop-windows

(The installatiion may require a system restart to enable Hyper-V)

Once Docker for Windows has been installed, you will need to configure it so that it can be accessed from the WSL bash.

- Right click the Docker Whale icon in system tray
- Select "Settings..."
- Under the "General" section
  - Check the option to "Expose daemon on tcp://localhost:2375 without TLS"
- Under the "Shared Drives" section
  - Check the C Drive
- Apply Changes (You may be prompted for your login credentials)

## WSL Docker Git Setup Script

Git comes installed by default with Ubuntu for Windows. You can clone this repository immediately from your WSL Bash by running:

`git clone https://github.com/jmaxwilson/wsl-docker-git-setup.git`

Once the code has been cloned you can run `wsl-setup.sh` to configure your WSL Bash to be able to communicate with Docker for Windows and install a git-enabled commandline prompt that makes it easier to work with git from WSL.

`cd wsl-docker-git-setup`

`./wsl-setup.sh`

The interactive shell script:

- Creates `.bashrc_wsl` file that is sourced from `.bashrc` for customizing the bash
- Installs `docker-compose` and its dependencies for use on the commandline
- Adds a `DOCKER_HOST` environment variable in `.bashrc_wsl` to allow docker to connect to Docker for Windows
- Adds a symlink `/c` that points to the drive shared by Docker for Windows (`/mnt/c`) so that docker paths will work properly
- Adds a Git enabled prompt so that you can see Git branch information on the commandline
- Sets the default directory when WSL Bash starts

Once the script has completed, you will need to exit bash and start it again for some of the changes to be applied.

You should be able to run `docker` and `docker-compose` commands from the WSL Ubuntu commandline on Windows as well as see git branch information in the command prompt.

You can test them by running:
 
`docker info`

`docker-compose version`

`docker run hello-world`

This makes it much easier to run most of the same docker scripts on Windows that you do on Linux or Mac by using WSL and Ubuntu Bash instead of GitBash and Git for Windows.
