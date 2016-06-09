# Python Quick Start Guide

This guide will walk you through deploying a Python / [Django](https://www.djangoproject.com/) application on [Deis Workflow][].

## Usage

```console
$ git clone https://github.com/deis/example-python-django.git
$ cd example-python-django
$ deis create
Creating Application... done, created italic-rucksack
Git remote deis added
remote available at ssh://git@deis-builder.deis.rocks:2222/italic-rucksack.git
$ git push deis master
Counting objects: 75, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (46/46), done.
Writing objects: 100% (75/75), 12.01 KiB | 0 bytes/s, done.
Total 75 (delta 31), reused 53 (delta 21)
Starting build... but first, coffee!
-----> Python app detected
-----> Installing python-2.7.11
       $ pip install -r requirements.txt
       Collecting Django==1.9.5 (from -r requirements.txt (line 1))
       Downloading Django-1.9.5-py2.py3-none-any.whl (6.6MB)
       Collecting gunicorn==19.4.5 (from -r requirements.txt (line 2))
       Downloading gunicorn-19.4.5-py2.py3-none-any.whl (112kB)
       Collecting dj-static==0.0.6 (from -r requirements.txt (line 3))
       Downloading dj-static-0.0.6.tar.gz
       Collecting static==1.1.1 (from -r requirements.txt (line 4))
       Downloading static-1.1.1.tar.gz
       Collecting static3 (from dj-static==0.0.6->-r requirements.txt (line 3))
       Downloading static3-0.7.0.tar.gz
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
       Successfully installed Django-1.9.5 dj-static-0.0.6 gunicorn-19.4.5 pystache-0.5.4 static-1.1.1 static3-0.7.0

       $ python manage.py collectstatic --noinput
       56 static files copied to '/app/staticfiles'.

-----> Discovering process types
       Procfile declares types -> web
-----> Compiled slug size is 42M
Build complete.
Launching App...
Done, italic-rucksack:v2 deployed to Deis

Use 'deis open' to view this application in your browser

To learn more, use 'deis help' or visit https://deis.com/

To ssh://git@deis-builder.deis.rocks:2222/italic-rucksack.git
 * [new branch]      master -> master
$ curl http://italic-rucksack.deis.rocks
Powered by Deis
```

## Additional Resources

* [GitHub Project](https://github.com/deis/workflow)
* [Documentation](https://deis.com/docs/workflow/)
* [Blog](https://deis.com/blog/)

[Deis Workflow]: https://github.com/deis/workflow#readme
