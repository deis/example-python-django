# Python Quick Start Guide

This guide will walk you through deploying a Python / [Django](https://www.djangoproject.com/) application on Deis.

## Usage

```console
$ git clone https://github.com/deis/example-python-django.git
$ cd example-python-django
$ deis create
Creating application... done, created benign-yardbird
Git remote deis added
$ git push deis master
Counting objects: 42, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (36/36), done.
Writing objects: 100% (42/42), 6.81 KiB | 0 bytes/s, done.
Total 42 (delta 13), reused 0 (delta 0)
-----> Python app detected
-----> Installing runtime (python-2.7.9)
-----> Installing dependencies with pip
       Collecting Django==1.8.5 (from -r requirements.txt (line 1))
       Downloading Django-1.8.5-py2.py3-none-any.whl (6.2MB)
       Collecting gunicorn==19.3.0 (from -r requirements.txt (line 2))
       Downloading gunicorn-19.3.0-py2.py3-none-any.whl (110kB)
       Collecting dj-static==0.0.6 (from -r requirements.txt (line 3))
       Downloading dj-static-0.0.6.tar.gz
       Collecting static==1.1.1 (from -r requirements.txt (line 4))
       Downloading static-1.1.1.tar.gz
       Collecting static3 (from dj-static==0.0.6->-r requirements.txt (line 3))
       Downloading static3-0.6.1.tar.gz
       Collecting pystache (from static==1.1.1->-r requirements.txt (line 4))
       Downloading pystache-0.5.4.tar.gz (75kB)
       Installing collected packages: Django, gunicorn, static3, dj-static, pystache, static
       Running setup.py install for static3
       Running setup.py install for dj-static
       Running setup.py install for pystache
       Running setup.py install for static
       Successfully installed Django-1.8.5 dj-static-0.0.6 gunicorn-19.3.0 pystache-0.5.4 static-1.1.1 static3-0.6.1

-----> Preparing static assets
       Running collectstatic...
       62 static files copied to '/app/staticfiles'.

-----> Discovering process types
       Procfile declares types -> web
-----> Compiled slug size is 47M

-----> Building Docker image
remote: Sending build context to Docker daemon 48.28 MB
remote: build context to Docker daemon
Step 0 : FROM deis/slugrunner
 ---> 385e8129fbdf
Step 1 : RUN mkdir -p /app
 ---> Using cache
 ---> 877ce2869c1c
Step 2 : WORKDIR /app
 ---> Using cache
 ---> 40b847b64730
Step 3 : ENTRYPOINT /runner/init
 ---> Using cache
 ---> fe7cf39f55ff
Step 4 : ADD slug.tgz /app
 ---> c5f10fdb9d73
Removing intermediate container 51f08217e689
Step 5 : ENV GIT_SHA 498a3e4664295697b486c3f85a16fd6ea1831abd
 ---> Running in f91f4dd7a7fa
 ---> 4685796b869c
Removing intermediate container f91f4dd7a7fa
Successfully built 4685796b869c
-----> Pushing image to private registry

-----> Launching...
       done, benign-yardbird:v2 deployed to Deis

       http://benign-yardbird.local3.deisapp.com

       To learn more, use `deis help` or visit http://deis.io

To ssh://git@deis.local3.deisapp.com:2222/benign-yardbird.git
 * [new branch]      master -> master
$ curl http://benign-yardbird.local3.deisapp.com
Powered by Deis
$ deis config:set DATABASE_URL=postgres://bacongobbler:mmmbacon@testdb.cjbohn01puzy.us-west-1.rds.amazonaws.com:5432/testdb
Creating config... done, v3

=== benign-yardbird
DATABASE_URL: postgres://bacongobbler:mmmbacon@testdb.cjbohn01puzy.us-west-1.rds.amazonaws.com:5432/testdb
$ deis run python manage.py syncdb --noinput
Creating tables ...
Installing custom SQL ...
Installing indexes ...
Installed 0 object(s) from 0 fixture(s)
```

## Additional Resources

* [Get Deis](http://deis.io/get-deis/)
* [GitHub Project](https://github.com/deis/deis)
* [Documentation](http://docs.deis.io/)
* [Blog](http://deis.io/blog/)
