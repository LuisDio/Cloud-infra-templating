To start out our project, we’re going to set up our source control, our virtualenv, and finally start documenting how we want the project to work.
Creating the Repo and Virtualenv

Since we’re building a project that will likely be more than a single file, we’re going to create a full project complete with source control and dependencies. We’ll start by creating the directory to hold our project, and we’re going to place this in a code directory:
```
$ rm ~/requirements.txt
$ mkdir -p ~/code/pgbackup
$ cd ~/code/pgbackup
```
We’ve talked about pip and virtualenvs, and how they allow us to manage our dependency versions. For a development project, we will leverage a new tool to manage our project’s virtualenv and install dependencies. This tool is called pipenv. Let’s install pipenv for our user and create a Python 3 virtualenv for our project:
```
$ pip3.6 install --user pipenv
$ pipenv --python $(which python3.6)
```
Rather than creating a requirements.txt file for us, pipenv has created a Pipfile that it will use to store virtualenv and dependency information. To activate our new virtualenv, we use the command pipenv shell, and to deactivate it we use exit instead of deactivate.
Next, let’s set up git as our source control management tool by initializing our repository. We’ll also add a .gitignore file from GitHub so that we don’t later track files that we don’t mean to.
```
$ git init
$ curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -o .gitignore
```
Sketch out the README.rst
```
pgbackup
========

CLI for backing up remote PostgreSQL databases locally or to AWS S3.

Preparing for Development
-------------------------

1. Ensure ``pip`` and ``pipenv`` are installed
2. Clone repository: ``git clone git@github.com:example/pgbackup``
3. ``cd`` into repository
4. Fetch development dependencies ``make install``
5. Activate virtualenv: ``pipenv shell``

Usage
-----

Pass in a full database URL, the storage driver, and destination.

S3 Example w/ bucket name:

::

    $ pgbackup postgres://bob@example.com:5432/db_one --driver s3 backups

Local Example w/ local path:

::

    $ pgbackup postgres://bob@example.com:5432/db_one --driver local /var/local/db_one/backups

Running Tests
-------------

Run tests locally using ``make`` if virtualenv is active:

::

    $ make

If virtualenv isn’t active then use:

::

    $ pipenv run make

```

The last thing we need to do before we start implementing our pgbackup tool is structure the project with the required files and folders.
Documentation For This Video

- The setuptools package
- The make documentation

### Create Package Layout

There are a few specific places that we’re going to put code in this project:
In a ```src/pgbackup``` directory. This is where our project’s business logic will go.

In a ```tests``` directory. We’ll put automated tests here.
We’re not going to write the code that goes in these directories just yet, but we are going to create them and put some empty files in so that we can make a git commit that contains these directories. In our ```src/pgbackup``` directory, we’ll use a special file called ```__init__.py```, but in our tests directory, we’ll use a generically named, hidden file.
```
(pgbackup-E7nj_BsO) $ mkdir -p src/pgbackup tests
(pgbackup-E7nj_BsO) $ touch src/pgbackup/__init__.py tests/.keep
```

1. Writing Our setup.py

One of the requirements for an installable Python package is a ```setup.py``` file at the root of the project. In this file, we’ll utilize setuptools to specify how our project is to be installed and define its metadata. Let’s write out this file now:

```~/code/pgbackup/setup.py```
```
from setuptools import setup, find_packages

with open('README.rst', encoding='UTF-8') as f:
    readme = f.read()

setup(
    name='pgbackup',
    version='0.1.0',
    description='Database backups locally or to AWS S3.',
    long_description=readme,
    author='Keith',
    author_email='keith@linuxacademy.com',
    packages=find_packages('src'),
    package_dir={'': 'src'},
    install_requires=[]
)
```
For the most part, this file is metadata, but the packages, package_dir, and install_requires parameters of the setup function define where setuptools will look for our source code and what other packages need to be installed for our package to work.
To make sure that we didn’t mess up anything in our ```setup.py```, we’ll install our package as a development package using pip.
```(pgbackup) $ pip install -e ```
```
Obtaining file:///home/user/code/pgbackup
Installing collected packages: pgbackup
  Running setup.py develop for pgbackup
Successfully installed pgbackup
```
It looks like everything worked, and we won’t need to change our setup.py for awhile. For the time being, let’s uninstall pgbackup since it doesn’t do anything yet:
```
(pgbackup-E7nj_BsO) $ pip uninstall pgbackup
Uninstalling pgbackup-0.1.0:
  /home/user/.local/share/virtualenvs/pgbackup-E7nj_BsO/lib/python3.6/site-packages/pgbackup.egg-link
  Proceed (y/n)? y
    Successfully uninstalled pgbackup-0.1.0
```

### Makefile

In our ```README.rst``` file, we mentioned that to run tests we wanted to be able to simply run make from our terminal. To do that, we need to have a Makefile. We’ll create a second make task that can be used to setup the virtualenv and install dependencies using pipenv also. Here’s our Makefile:
```
~/code/pgbackup/Makefile
.PHONY: default install test

default: test

install:
    pipenv install --dev --skip-lock

test:
    PYTHONPATH=./src pytest
```