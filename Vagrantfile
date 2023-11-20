Vagrant.configure("2") do |config|
  # Specify the base image
  config.vm.box = "ubuntu/bionic64"

  # Assign a private network with a specific IP
  config.vm.network "private_network", ip: "192.168.56.111"

  # Name your server
  config.vm.define "ubuntu-server" do |server|
  end

  # Allocate resources
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"   # 8 GB of RAM
    vb.cpus = 4          # 4 CPUs
  end

  # Provisioning scripts to install Java, Jenkins, Vim, and Python3
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y openjdk-17-jdk  # Install Java 17
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
                  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
                  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                  /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins              
    sudo apt-get install -y vim             
    sudo apt-get install -y python3         
  SHELL
end
