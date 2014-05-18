# java_sun
default['java']['jdk_version'] = '6'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

# hadoop
default['hadoop']['version'] = '0.20.2-cdh3u5'
default['hadoop']['checksum'] = '70001638f8ada92d94c1a11a4b025f7dc3fede72b6cedc3e2b9f316b6e8c161a'
default['hadoop']['home'] = '/opt/hadoop'
default['hadoop']['tmp'] = '/var/hadoop/tmp'
default['hadoop']['fs_default'] = 'hdfs://localhost:54310'
default['hadoop']['mapred_tracker'] = 'localhost:54311'
default['hadoop']['log_dir'] = '/var/hadoop/log'
default['hadoop']['pids_dir'] = '/var/hadoop/pids'

default['hadoop']['group']['name'] = 'hadoop'
default['hadoop']['group']['gid'] = 5000

default['hadoop']['user']['name'] = 'hduser'
default['hadoop']['user']['uid'] = 5000
default['hadoop']['user']['shell'] = '/bin/bash'
default['hadoop']['user']['auth_key'] = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3fmW8WoIF1cU6woKbRwV/08pMFL9zPvvqGqtd2aLotEg4RnZcm5lzRH4DiAPBrGKE81DAKsyr08F43qS8sXjxuQFuyIhMvn2OE7aaPgRPU7Eu5FkaMxT+nrpHjDsHuwGXnpW/JJLs6fGGvMz5oLb69U5hlZk+F4SFGCFchJXv0sqywfqHnDiDziSzgMyVXAgZIt1D8R1JDt49e1WhqRLbE1o3NsQDSAQZzIrUCVAmM5W9atQp5zn/lgn/2mu4yGB3AIKwVO3xSE3dLk5Rxm6wdba2qVJ85rgAQoJRCcIdXyMlXrT2872dJNlefI4joEnQ8l3+CuxKJ7gM25UNoIsH hduser@docker'
default['hadoop']['user']['id_rsa'] = <<EOS
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAt35lvFqCBdXFOsKCm0cFf9PKTBS/cz776hqrXdmi6LRIOEZ2
XJuZc0R+A4gDwaxihPNQwCrMq9PBeN6kvLF48bkBbsiITL59jhO2mj4ET1OxLuRZ
GjMU/p66R4w7B7sBl56VvySS7OnxhrzM+aC2+vVOYZWZPheEhRghXISV79LKssH6
h5w4g84ks4DMlVwIGSLdQ/EdSQ7ePXtVoakS2xNaNzbEA0gEGcyK1AlQJjOVvWrU
Kec5/5YJ/9pruMhgdwCCsFTt8UhN3S5OUcZusHW2tqlSfOa4AEKCUQnCHV8jJV60
9vO9nSTZXnyOI6BJ0PJd/grsSie4DNuVDaCLBwIDAQABAoIBAQCyPng5JXpUjLnQ
QI56o9z1tRg4G5d2LeKsIEgDHJyhjC7za48imovPauM2LvPnOLtjBrCUW38CEutH
rI8+NO+Vb++yW937Hrf8Qa4J2uB45oWhVXQwfRqR1EKDqfbVpZUAYa55RN/sf7x8
8/3xJ2tYEN6Y8Kcxp8q1NyGBK9IyaV2/f37EV8EaMCl0SAqzRZfHiEZeIuuzIkz5
uf2qwoj0eNCzU/LlHk4dwqLM9WARqWJSquz61S4PR/XIOIfl1ZU9kNayPdi7w085
LwOrUe5pcTeAXVa978bHcJ7Nc1pTbj04VjNq7kfkcUUN0V2283v7sB3+asDxyGH9
TSNJdm7xAoGBAOJlaHy38FAGItVGGXogL9jSpMPcOwtq/vScgDTaXq8XCLb4eTqE
MtztPBn6Bo/r7y4n1nTv6JPU7iq3f0VdVXEkAoNWJOcmgd0tLQ9vURI0Ule5M3Ox
TFKCQLEvpljY0JNNbaL8gbbmKVSgL2CO/UxG70QyEkx3mG1r2Jt4KHQVAoGBAM98
1dv1AriKuZ6IBrZCcIJhu3KYMbD6wfj5SJA8ccp677b9IJRLDRC8PXCzT0VZu0fO
6tqnxhteJMJu/afU4Fchv28bLkDWEQ3mWt4XkpKW0xhnKMdau6IUTqlqmS0RFTC2
/nZBX4qThs7j/q91Dp56+vaLYQrVYJb8R/gNqj2rAoGAdf6ed6oygLLCAuA3NRSD
e4FFyKMGzwuj9/99Po61nJHnw9066cmu7MBke7F5LBeuoCK5Plcvo6TtwKvElHVx
q7c17BfAwgyq0IjUHGBLI67LX9cxvtGgUrx6VR7dlx7hjnRjePgb7ySEVAvsxWmh
ENlDqQpjySDn+9einF0C0IUCgYEAnAMj0xYxi41T8O4bDeR7MK5IAeyKQKbsP0dB
1qJ8dWFm6dL/MkIUeubv09Qf4OeNuHrPgMXyYhWx0jkepZmdbibECMkJSFsty6PP
43saDPs3kvvOX8fLmh1m4GB0+LwFkPGn+EdDjbFMBjjNAiUkbunN1qAKwdibnivn
+Y5c2a0CgYAV0AaP3ZV6QMPxiX/JLQRBXBVAliTd8dggmc6A3xSzZwlkSsS0LsCA
kpm2cp6AlG6k5Tlbi6YuAFbpbFd8akWVo6i04zVV3/CW18SeD+EYOgV+uJPP3KuU
Nvr443yiqYP9i8hAgvsHE3KWdtZYmWR5q8Qfz2QOg+7GODiBa7VEtA==
-----END RSA PRIVATE KEY-----
EOS
