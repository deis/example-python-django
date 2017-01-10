FROM python:3-onbuild

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "helloworld.wsgi"]
EXPOSE 8000
