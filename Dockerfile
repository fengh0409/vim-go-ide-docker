FROM centos:7

LABEL Maintainer=fenghui<fengh0409@gmail.com>

# install something necessary for vim and YouCompleteMe
RUN yum install -y \
	gcc \
	gcc-c++ \
	make \
	cmake \
	ncurses \
	ncurses-devel \
	ctags \
	python-devel python36-devel \
	ruby ruby-devel \
	lua lua-devel \
	luajit luajit-devel \
	perl perl-devel \
	perl-ExtUtils-ParseXS \
	perl-ExtUtils-XSpp \
	perl-ExtUtils-CBuilder \
	perl-ExtUtils-Embed \
	git \
	wget

# install golang
RUN mkdir -p /root/gowork/{src,bin,pkg} && \
	wget https://gomirrors.org/dl/go/go1.14.6.linux-amd64.tar.gz && \
	tar -xzf go1.14.6.linux-amd64.tar.gz -C /usr/local && \
	echo 'export GOROOT=/usr/local/go' >> /root/.bashrc && \
	echo 'export GOPATH=/root/gowork' >> /root/.bashrc && \
	echo 'export GO111MODULE=on' >> /root/.bashrc && \
	echo 'export GOSUMDB=off' >> /root/.bashrc && \
	echo 'export GOPROXY=https://goproxy.cn' >> /root/.bashrc && \
	echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> /root/.bashrc && \
	rm -rf go1.14.6.linux-amd64.tar.gz

# install vim 
RUN	mkdir -p /usr/lib/python2.7/config && \
	git clone https://github.com/vim/vim.git && \
	cd vim && \
	./configure --with-features=huge \
	--enable-pythoninterp \
	--enable-python3interp \
	--enable-rubyinterp \
	--enable-luainterp \
	--enable-perlinterp \
	--with-python-config-dir=/usr/lib/python2.7/config/ \
	--enable-cscope \
	--enable-multibyte && \
	make && make install && \
	cd .. && rm -rf vim

# install plugin for vim
#RUN mkdir -p /root/.vim/autoload/ && \
	#curl --resolve raw.githubusercontent.com:443:8.8.8.8 -sfSLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY plug.vim /root/.vim/autoload/plug.vim
COPY vimrc /root/.vimrc
RUN vim -E -s -u "/root/.vimrc" +PlugInstall +qall || true
RUN source /root/.bashrc && \
	vim -E -s -u "/root/.vimrc" +GoInstallBinaries +qall && \
	rm -rf /root/gowork/pkg/mod

# install YouCompleteMe
RUN source /root/.bashrc && \
	/root/.vim/plugged/YouCompleteMe/install.py --gocode-completer

# install gomock and golangci-lint
RUN source /root/.bashrc && \
	go get github.com/golang/mock/mockgen@v1.4.3 && \
	curl -sSfL --resolve raw.githubusercontent.com:443:8.8.8.8 https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.30.0 && \
	rm -rf /root/gowork/pkg/mod

WORKDIR /root/gowork/src
