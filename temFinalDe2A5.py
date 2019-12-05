#!python3


import re
import sys


with open('ipconfig.txt', 'r') as file:
    content = file.read()


result = 0

numbers = re.findall(r'192\.168\.(\d)\.(\d+)', content)[0]

gateway = numbers[0]
ip = numbers[1]


for i in ip:
    i = int(i)
    if i >= 2 or i <= 5:
        result = 1
        break


with open('EstouEmSaoCarlos.txt', 'w', encoding='utf-8') as file:
    file.write(str(result))


with open('gateway.txt', 'w', encoding='utf-8') as file:
    file.write('192.168.'+gateway+'.1')