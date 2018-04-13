# README

### Ruby version: 2.4.1

### ElasticSearch installation for user search:
* Go to elasticsearch.org/download and download the DEB file.
* Once the file is local, type: 
`sudo dpkg -i elasticsearch-VERSION.deb`
* And start with : `sudo service elasticsearch start`

### Webpacker development configrations:
* Install yarn from: https://yarnpkg.com/en/docs/install
* To install all necessary packages run: `yarn install`
* To run webpacker dev server use instructions from: https://github.com/rails/webpacker
* To test chat in your local network please replace:

in **config/environments/development.rb**

config.action_cable.url = "ws://localhost:3000/cable" 

with

config.action_cable.url = "ws://your_local_ip:3000/cable"

in **app/javascript/packs/actioncable_connect.js**

var cable = ActionCable.createConsumer('ws://localhost:3000/cable')

with

var cable = ActionCable.createConsumer('ws://your_local_ip:3000/cable')

in **config/webpacker.yml**

dev_server:

    https: false
    host: localhost
    port: 3035
    public: localhost:3035
    hmr: false
    
with

dev_server:

    https: false
    host: your_local_ip
    port: 3035
    public: your_local_ip:3035
    hmr: false