#!/bin/bash
# this will install common libraries in pip 

# adjust the pip version to whatever coincides with the python version installed in python.sh
# should be a good base of pkgs - https://pythontips.com/2013/07/30/20-python-libraries-you-cant-live-without/ip2 install lxml

version=2.7
pip${version} install requests
pip${version} install lxml
pip${version} install requests
pip${version} install scrapy
pip${version} install BeautifulSoup4
pip${version} install twisted
pip${version} install numpy
pip${version} install scapy
pip${version} install nose
pip${version} install ipython
