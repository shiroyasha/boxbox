# Box Box &mdash; The development box

[![Build Status](https://semaphoreci.com/api/v1/renderedtext/boxbox/branches/master/badge.svg)](https://semaphoreci.com/renderedtext/boxbox)

![Box Box development machine](https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Anime_Expo_2011_-_box_robot_%285917932244%29.jpg/450px-Anime_Expo_2011_-_box_robot_%285917932244%29.jpg)

Simple, no bullshit development box, ideal for docker based development.

## Installation

First, make sure that you have Vagrant, VirtualBox installed:

```
$ vagrant --version
Vagrant 1.8.1

$ vboxmanage --version
5.0.4r102546
```

Install vagrant host manager:

``` bash
vagrant plugin install vagrant-hostmanager
```

Clone the directory:

``` bash
git clone https://github.com/renderedtext/boxbox.git ~/boxbox
cd ~/boxbox
```

Provision your box:

``` bash
vagrant up
```

Add an alias an your host machine to `.bashrc` or `.zhsrc`:

```
alias bb="cd ~/boxbox && vagrant up && vagrant ssh -c 'tmux -2'"
alias bhalt="cd ~/boxbox && vagrant halt"
```

## Usage

Start working:

``` bash
$ bb
```

Stop working:

``` bash
$ bhalt
```

In the machine, try to keep all your projects in one directory like `~/code` or `~/workplace`.
This will allow you to easily upgrade boxbox versions when necessary.

Access your box from the browser:

``` bash
http://boxbox:<port>
```

Or, you can do it via the static IP address:

``` bash
http://10.20.30.40:<port>
```

If you are running a web application inside of boxbox, make sure to attach to the 
`0.0.0.0` network interface. This will allow it to be visible from your host. 
For Rails, this can be achieved with:

``` bash
bundle exec rails -b 0.0.0.0
```

## How to rebuild your boxbox without loosing your projects?

Assuming that you keep your projects in the `~/code` directory, you need to:

In the boxbox machine:

``` bash
# move your projects to the host machine
cp ~/code /vagrant/code
```

On the host machine:

``` bash
# destroy the vagrant image
vagrant destroy

# rebuild your vagrant image
vagrant up
```

In the newly created image, copy your projects back to their original place:

``` bash
cp /vagrant/code ~/code
```

Everything should work.


## What should be included in the boxbox?

BoxBox aims to remain simple and clean. When adding new packages always check if the new package
has a wide use case, useful for many projects. Please avoid optimization for one project only.

Rules of thumb:

- ✅ We should install languages, databases, and background services for communication 
in boxbox directly. These are widely used, very generic tools.

- ✅ Common linux utilies like wget, curl, htop, ncdu, aws-cli, vim, zsh should 
also be installed in the boxbox. They have a wide use-case, necessary in every project.

- ❌ Gem dependancies like libicu should be managed on per-repository basis.

- ❌ cmake is in the gray area. It is a widely used tool, but we use it only for one project. 
It can be installed globally, or per-repo. In this case, we should be conservative and only
install it globally if more than one project requires it.

## License

The MIT License (MIT)
Copyright (c) 2017 RenderedText

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software
is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
