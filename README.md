# Box Box

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

```
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
