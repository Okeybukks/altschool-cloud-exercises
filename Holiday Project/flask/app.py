from flask import Flask, render_template
import boto3
from config import region, aws_access_key_id, aws_secret_access_key


app = Flask(__name__)

client = boto3.client('ec2', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key,  region_name=region)
Myec2=client.describe_instances()

print(Myec2)
@app.route('/')
def hello():
    instance_info = Myec2['Reservations'][1]['Instances'][0]
    instance_type = instance_info['InstanceType']
    instance_ip = instance_info['PrivateIpAddress']
    return render_template('index.html', inst_type=instance_type, inst_ip=instance_ip)


if __name__ == "__main__":
    app.run(host='0.0.0.0')
