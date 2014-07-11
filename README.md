# Python Quick Start Guide

This guide will walk you through deploying a Django application on Deis.

## Usage

```
$ deis create
Creating application... done, created classy-unicycle
Git remote deis added
$ deis config:set DATABASE_URL=postgres://bacongobbler:mmmbacon@testdb.cjbohn01puzy.us-west-1.rds.amazonaws.com:5432/testdb
Creating config... done, v2

=== ginger-sculptor
DATABASE_URL: postgres://bacongobbler:mmmbacon@testdb.cjbohn01puzy.us-west-1.rds.amazonaws.com:5432/testdb
$ git push deis master
Counting objects: 7, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 406 bytes | 0 bytes/s, done.
Total 4 (delta 3), reused 0 (delta 0)
-----> Python app detected
-----> No runtime.txt provided; assuming python-2.7.6.
-----> Using Python runtime (python-2.7.6)
-----> Installing dependencies using Pip (1.5.4)
       Cleaning up...
-----> Preparing static assets
       Running collectstatic...
       69 static files copied to '/app/static'.

-----> Discovering process types
       Procfile declares types -> web
-----> Compiled slug size is 35M
remote: -----> Building Docker image
remote: Uploading context 36.34 MB
remote: Uploading context
remote: Step 0 : FROM deis/slugrunner
remote:  ---> 5567a808891d
remote: Step 1 : RUN mkdir -p /app
remote:  ---> Using cache
remote:  ---> 4096b5c0b838
remote: Step 2 : ADD slug.tgz /app
remote:  ---> 6e1479a36041
remote: Removing intermediate container f9873c2e2ecd
remote: Step 3 : ENTRYPOINT ["/runner/init"]
remote:  ---> Running in ce58a92a898b
remote:  ---> c3aa445864f5
remote: Removing intermediate container ce58a92a898b
remote: Successfully built c3aa445864f5
remote: -----> Pushing image to private registry
remote:
remote:        Launching... done, v3
remote:
remote: -----> classy-unicycle deployed to Deis
remote:        http://classy-unicycle.local.deisapp.com
remote:
remote:        To learn more, use `deis help` or visit http://deis.io
remote:
To ssh://git@local.deisapp.com:2222/classy-unicycle.git
 * [new branch]      master -> master
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
