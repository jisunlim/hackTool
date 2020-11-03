import os
import subprocess

def color_text(str):
    return '\033[33m' + str + '\033[0m'

def get_domain(url):
    # remove https:// or http://
    index = url.find('//')
    if index > 0:
        url = url[index+2:]

    # remove subdomain
    index = url.find('/')
    if index > 0:
        url = url[:url.find('/')]

    return url

if __name__ == '__main__':
    url = raw_input(color_text('=> input URL: '))

    # find ip address
    os.system('nslookup ' + get_domain(url))


    # port scan
    ip = raw_input(color_text('=> input IP: '))
    os.system('nmap ' + ip)
