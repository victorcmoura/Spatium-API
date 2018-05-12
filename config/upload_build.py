import requests
import json
from requests_toolbelt.multipart.encoder import MultipartEncoder
import base64
filename = 'test_file.zip'
file_object = open(filename, 'rb')

files = {'build': file_object}

build = {
    'description': 'File uploaded by Python Script',
    'name':filename,
    'dev_tag':0,
    'master_tag': 1,
    'build_url':'',
    'build_aws_id':'',
    'is_master': True,
    'file': file_object.read()
    }

# {"build":{"description":"test", "name":"test", "dev_tag":"1", "master_tag":"1", "build_url":"", "build_aws_id":"1", "is_master":"true"}}
# {"build": {"description": "test", "build_url": "", "master_tag": 1, "is_master": true, "file": "", "dev_tag": 0, "name": "test_file.txt", "build_aws_id": ""}}
values = {
    'build': build
    }

# json_data = json.dumps(values)
# url = 'http://localhost:3000/builds'
url = 'http://localhost:3000/file_objects'

# r = requests.post(url, files=values)
# print(values)

multipart_data = MultipartEncoder(
    fields={

                # a file upload field
                'file_object': (filename, open(filename, 'rb'), 'text/plain'),
                # # # plain text fields
                # 'description': 'File uploaded by Python Script',
                # 'name':filename,
                # 'dev_tag':'0',
                # 'master_tag': '1',
                # 'build_url':'',
                # 'build_aws_id':'',
                # 'is_master': 'True'
        }

)

response = requests.post(url, data=multipart_data, headers={'Content-Type': multipart_data.content_type})
# print(r)
# print(json_data)

# import requests
# import base64
# from datetime import datetime
# import json
#
# f = open('output.mp3')
# recording = base64.b64encode(f.read())
# current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
#
# payload = {'build': {'device':'0005', 'time':current_time, }}
# headers = {'content-type':'application/json'}
# response = requests.post('http://localhost:7000/api/audio_clips', data=json.dumps(payload), headers=headers)
# print response.text
# print response
