# Box Box &mdash; The development box

![Box Box devlopment machine](docs/logo.jpg)

Simple, no bullshit development box. No ansible, no chef, no pupper. Just Ubuntu 14.04 and simple bash.

It includes:

- Basic tools (git, curl, vim, zsh)
- Postgresql
- RabbitMQ
- Ruby 2.3
- Node 6.0

The default shell is `zsh`.

## Installation

Run the following command:

``` bash
curl -L https://raw.githubusercontent.com/shiroyasha/boxbox/master/install | bash
```

note: not yet implemented use the manual installer

## Usage

Start working:

``` bash
$ bb
```

Stop working:

``` bash
$ bhalt
```

## (Optional) Manual Installation

First, make sure that you have Vagrant, VirtualBox installed:

```
$ vagrant --version
Vagrant 1.8.1

$ vboxmanage --version
5.0.4r102546
```

Then, install vagrant host manager:

```
vagrant plugin install vagrant-hostmanager
```

Then, clone the directory:

```
git clone https://github.com/shiroyasha/boxbox.git ~/boxbox
cd ~/boxbox
```

Then, provision your box:

```
vagrant up
```

Then, add an alias an your host machine to `.bashrc`:

```
alias bb="cd ~/boxbox && vagrant up && vagrant ssh -c 'tmux -2'"
alias bhalt="cd ~/boxbox && vagrant up && vagrant ssh -c 'tmux -2'"
```

## License

The MIT License (MIT)
Copyright (c) 2016 Igor Sarcevic

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
