# Use an appropriate base image with Python installed
ARG PYTHON_VERSION=3.11.2
FROM python:${PYTHON_VERSION}-slim as base

# Set the working directory inside the container
WORKDIR /app

# Copy the Pipfile and Pipfile.lock into the container at /app
COPY Pipfile Pipfile.lock /app/

# Install pipenv
RUN pip install pipenv

# Install dependencies from requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app

ENTRYPOINT [ "python" ]

EXPOSE 5001

# Command to run your application
CMD [ "app.py" ]
