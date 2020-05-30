# requires make, vagrant

DEFAULT_GOAL: init

init:
	git submodule update --init --recursive && \
	vagrant plugin install vagrant-disksize

update:
	vagrant box update

build:
	vagrant destroy -f && sleep 15 && vagrant up

