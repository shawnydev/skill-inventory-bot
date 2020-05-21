# Create instance
```
  gcloud config set project cashslide-dev
  gcloud config get-value project
  gcloud compute instances create devops-bot --zone=asia-northeast1-a --image=ubuntu-1804-bionic-v20200108 --machine-type=g1-small --image-project=ubuntu-os-cloud\n
```


# Instance Scripts
## rvm
- setup
  ```
    gcloud compute ssh devops-bot

    sudo su -l devops
    sudo apt-get update

    sudo gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -L https://get.rvm.io | sudo bash -s stable
    sudo usermod -a -G rvm devops
    echo '[[ -s /usr/local/rvm/scripts/rvm ]] && source "/usr/local/rvm/scripts/rvm"' >> ~/.bashrc

    ssh-keygen -t rsa -b 4096 -C "devops@nbt.com"
    # id_rsa.pub register github deploy keys
  ```
- nginx
  ```
    sudo apt-get install nginx
  ```
