## Location Service Test

### Infra Template

The templates directory contains infra templates to support the map demo from the location service samples repo.

https://github.com/aws-samples/amazon-location-samples/blob/main/mapbox-gl-js/index.html


### Initialize and use a Python virtual environment

When making changes to the template use the `make lint` target to check the templates for issues. The various lint checks require that a number of python libraries are installed and that Docker is running.

#### Inital workspace setup
```
python3 -m venv ./venv
. ./venv/bin/activate
pip install -r requirements.txt
```
The creation of the virtual environment is a one-time per local environment setup. You'll need to repeat
the activation step for each console session.

#### Each new console session
```
. ./venv/bin/activate
make lint
```
