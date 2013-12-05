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

## Необходимые гемы

    $ gem install bundler chef berkshelf knife-solo --no-ri --no-rdoc
    $ vagrant plugin install vagrant-foodtaster-server

## Добавление бокса

Перейдите в папку, взятую с флешки и выполните команду:

    $ vagrant box add ubuntu1204 ubuntu1204.box

# Этапы мастеркласса

  * [step1](https://github.com/mlapshin/chef-workshop/tree/step1) -
    чистый chef-репозиторий
  * [step2](https://github.com/mlapshin/chef-workshop/tree/step2) -
    элементарный кукбук и тест на него
  * [step3](https://github.com/mlapshin/chef-workshop/tree/step3) -
    рецепт для установки PostgreSQL
  * [step4](https://github.com/mlapshin/chef-workshop/tree/step4) -
    рецепт redmine::install + спека
  * [step5](https://github.com/mlapshin/chef-workshop/tree/step5) -
    рецепт redmine::webserver + спека
  * [step6](https://github.com/mlapshin/chef-workshop/tree/step6) -
    готовый кукбук redmine + интеграцонная спека
