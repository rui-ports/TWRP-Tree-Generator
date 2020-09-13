name: oOf dynamic again

on:
#  release:
#    types: [published]
#  push:
#    branches:
#      - master
#    paths:
#      - '.config'
#  schedule:
#    - cron: 0 8 * * 5
  watch:
    types: [started]
    
env:
  ROM_URL: https://oxygenos.oneplus.net/OnePlus6TOxygen_34_OTA_047_all_2007171912_3ac1d37aee4841a9.zip
  ROM_NAME: OxygenOS-OP6T
  PRODUCT_IMAGE: false
  OPPRODUCT_IMAGE: false
  WHOLE_VENDOR: false
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
       - name: Checkout
         uses: actions/checkout@master

       - name: Initializing environments
         run: |
            sudo -E apt-get -qq update
            sudo -E apt-get -qq install git openjdk-8-jdk wget
            sudo apt-get update -y
            sudo apt-get install -y simg2img 
            sudo apt-get install zip gzip tar
            sudo -E apt-get install expect
            sudo pip3 install --upgrade setuptools
            sudo pip3 install --upgrade pip
            sudo apt update 2>/dev/null | grep packages
        
       - name: Making
         run: |
              git clone https://github.com/SebaUbuntu/TWRP-device-tree-generator
              sudo chmod +x TWRP-device-tree-generator
              cd TWRP-device-tree-generator
              sudo ./start.sh --cli
             
