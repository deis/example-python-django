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
Counting objects: 69, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (40/40), done.
Writing objects: 100% (69/69), 10.79 KiB | 0 bytes/s, done.
Total 69 (delta 27), reused 54 (delta 21)
-----> Python app detected
-----> Installing python-2.7.11
       $ pip install -r requirements.txt
       Collecting Django==1.9.4 (from -r requirements.txt (line 1))
       Downloading Django-1.9.4-py2.py3-none-any.whl (6.6MB)
       Collecting gunicorn==19.4.5 (from -r requirements.txt (line 2))
       Downloading gunicorn-19.4.5-py2.py3-none-any.whl (112kB)
       Collecting dj-static==0.0.6 (from -r requirements.txt (line 3))
       Downloading dj-static-0.0.6.tar.gz
       Collecting static==1.1.1 (from -r requirements.txt (line 4))
       Downloading static-1.1.1.tar.gz
       Collecting static3 (from dj-static==0.0.6->-r requirements.txt (line 3))
       Downloading static3-0.6.1.tar.gz
       Collecting pystache (from static==1.1.1->-r requirements.txt (line 4))
       Downloading pystache-0.5.4.tar.gz (75kB)
       Installing collected packages: Django, gunicorn, static3, dj-static, pystache, static
       Running setup.py install for static3: started
           Running setup.py install for static3: finished with status 'done'
         Running setup.py install for dj-static: started
           Running setup.py install for dj-static: finished with status 'done'
         Running setup.py install for pystache: started
           Running setup.py install for pystache: finished with status 'done'
         Running setup.py install for static: started
           Running setup.py install for static: finished with status 'done'
       Successfully installed Django-1.9.4 dj-static-0.0.6 gunicorn-19.4.5 pystache-0.5.4 static-1.1.1 static3-0.6.1

       $ python manage.py collectstatic --noinput
       56 static files copied to '/app/staticfiles'.

-----> Discovering process types
       Procfile declares types -> web
-----> Compiled slug size is 42M

-----> Building Docker image
remote: Sending build context to Docker daemon 43.32 MB
Step 0 : FROM deis/slugrunner
# Executing 3 build triggers
Trigger 0, RUN mkdir -p /app
Step 0 : RUN mkdir -p /app
 ---> Running in 152fa7df025c
Trigger 1, WORKDIR /app
Step 0 : WORKDIR /app
 ---> Running in 6b7c03526965
Trigger 2, ADD slug.tgz /app
Step 0 : ADD slug.tgz /app
 ---> 3a005ce7a8ce
Removing intermediate container 394d85dbe6e3
Removing intermediate container 152fa7df025c
Removing intermediate container 6b7c03526965
Step 1 : ENV GIT_SHA 3de49bc53dbe39042fabcaf4ca12f98fb350563f
 ---> Running in 669a3b4d666c
 ---> 386ea982527d
Removing intermediate container 669a3b4d666c
Successfully built 386ea982527d
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
