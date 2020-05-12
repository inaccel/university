# InAccel - Exercises for Universities

This repository was designed for Machine Learning University courses. It provides all the necessary steps for **building the exercises' environment** (jupyterhub as frontend for the student's etc.) as well as **ready-to-use** [lab exercises](https://edu.inaccel.com/). It is perfect for courses that aim to teach **ML acceleration on FPGAs**. Through these exercises, students with little or no prior knowledge of FPGAs can easily accelerate machine learning applications and understand why accelerators are so important nowadays in datacenters.

The exercises start from very easy ones (e.g. **_lab1_** where the student has to simply follow some steps and mainly copy-paste things for the applications to work), to more difficult ones where he will learn to accelerate on his own the training or inference part of ML algorithms using FPGAs.

All the exercises use **InAccel's Coral** orchestrator that makes it very simple for anyone to accelerate applications on FPGAs. No need for OpenCL. The exercises mainly use the Python API but C++ or Java may be needed for new labs coming in the future. No worries though! InAccel provides the same simple API and every student with a software programming background will be able to complete the tasks.

* * *

## Setup

### Prerequisites

1.  **Docker** and **docker-compose** must be installed in the system, since the whole installation is based on a `Dockerfile` and a `docker-compose.yml` file.
2.  Make sure that inaccel is installed in your system. If not, you can follow [this guide](https://docs.inaccel.com/inaccel/install/linux/).
3.  If you had already installed inaccel and used Coral orchestrator you can skip this step. Obtain a Community Edition license for free [here](https://inaccel.com/license/) and install it in your system using the following command: ```inaccel config license <your-license>```.

### Bring-up steps

1.  Make sure that inaccel is started (`inaccel status`), otherwise start inaccel (`inaccel start`).
2.  Clone the repository.
3.  Navigate into the project folder and execute `docker-compose up --build`
4. You can find the credentials of each account in the Dockerfile's final step output

After a few moments a new container will be up and running.  
Navigate to Jupyterhub's frontend at `<your-ip>:8000`.

* * *

## Configurations

The default Configuration spawns ***9 users***, 1 for the admin and 8 more for students/teams-of-students. The Jupyterhub frontend runs at port ***8000*** of your system's IP.

- To **change the number of users created**, edit the Dockerfile and add/remove users. Then in the docker-compose.yml file, add/or remove respectively persistent volumes for each user account. Finally don't forget to edit accordingly the whitlelist in ```files/srv/jupyterhub/jupyterhub_config.py``` file.
- To change the default port open the docker-compose.yml file and change the value of ```ports:```.

* * *

## Notes

- Everything is containerized so no worries for installation files messing with your system or un-installation procedures.
