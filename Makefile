

install: install-ssh install-bashrc install-irbrc install-vimrc

install-ssh:
	cp -R ./src/.ssh ${HOME}/.ssh

install-bashrc:
	cp ./src/.bashrc ${HOME}/.bashrc

install-irbrc:
	cp ./src/.irbrc ${HOME}/.irbrc

install-vimrc:
	cp ./src/.vimrc ${HOME}/.vimrc

dist:
	${tar} -czf ../dots.tar.gz ./
