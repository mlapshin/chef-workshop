# Установка необходимого софта

  * [VirtualBox 4.2 или 4.3](https://www.virtualbox.org/)
  * [Vagrant 1.3.5](http://www.vagrantup.com/)
  * [Ruby 1.9.3 или 2.0](http://ruby-lang.org/)
  * [Chef 11.x](http://www.opscode.com/chef/)

## MacOS

### VirtualBox

Скачайте
[dmg-файл](http://download.virtualbox.org/virtualbox/4.3.4/VirtualBox-4.3.4-91027-OSX.dmg)
и установите как обычно.

### Vagrant

Скачайте
[dmg-файл](http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/Vagrant-1.3.5.dmg)
и установите как обычно.

### Ruby

Используйте системный руби, если его версия не 1.8.7. В противном
случае, установите руби с помощью
[Homebrew](http://brew.sh/):

    $ brew install ruby

### Chef

Установите Chef с помощью RubyGems:

    $ gem install chef

## Linux (Ubuntu)

### VirtualBox

    $ sudo apt-get install virtualbox

### Vagrant

Скачайте .deb-пакет для своей архитектуры
[i686](http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_i686.deb)/[x86_64](http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_x86_64.deb)
и установите:

    $ sudo dpkg -i vagrant_1.3.5_*.deb

### Ruby

Используйте системный руби или установите более свежий с помощью RVM.

### Chef

    $ gem install chef
