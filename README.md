## Location Service Test

### Infra Template

The templates directory contains infra templates to support the map demo from the location service samples repo.

https://github.com/aws-samples/amazon-location-samples/blob/main/mapbox-gl-js/index.html


### Usage

1. Create a map in the AWS Console and remember the name of the map you use as we'll need that when we update the map web page
1. Copy the map ARN from the console
1. Deploy the `cognito.yaml` template to CloudFormation. The map ARN is an input parameter
1. Copy the IdentityPoolId output parameter from the CloudFormation template you just deployed
1. Copy the [index.html](https://github.com/aws-samples/amazon-location-samples/blob/main/mapbox-gl-js/index.html) file from the repo linked above.
1. Modify the index.html file replacing the `identityPoolId` and `mapName` placeholders
1. Load the page in a browser and it will retrieve a restricted set of AWS credentials using the Cognito UnAuthenticated identity pool which it will use to fetch the map tiles

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
