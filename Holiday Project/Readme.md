The project is a flask app.

The location used in the ansible play of this project should reflect where the flask folder is located either in your system or instance. 

For this project, I moved both the ansible and flask folder to the public instance 1, connected my private instance to the public instance and ran the playbook 
from my public instance. 

If you want to run the playbook to more than one private instance from public instance 1, changes must be made to the host file present in the ansible folder.

Finally, for the app to get your AWS instance informtion using boto3, the AWS access, key and region values should be added as environment variables in the
flask service folder located in the /etc/systemd/system folder.
