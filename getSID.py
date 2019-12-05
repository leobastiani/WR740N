#!python3


import re

with open('login.txt', 'r') as file:
    sid = re.findall(r'http://192\.168\.0\.1/(\w+)/', file.read())[0]


# salvo a sid em outro arquivo
with open('sid.txt', 'w', encoding='utf-8') as file:
    file.write(sid)


print(sid)