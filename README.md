## vim-go-ide-docker
This is a docker image for vim go ide

## Version
- centos 7
- go 1.14.6

## Go env
```
GOROOT=/usr/local/go
GOPATH=/root/gowork
GO111MODULE=on
GOSUMDB=off
GOPROXY=https://goproxy.cn
PATH=$PATH:$GOPATH/bin:$GOROOT/bin
```

## Go tools
- asmfmt
- dlv
- errcheck
- fillstruct
- godef
- goimports
- golangci-lint
- golint
- gomodifytags
- gopls
- gorename
- gotags
- guru
- iferr
- impl
- keyify
- mockgen
- motion

## Vim plugins
- vim-go
- vim-godef
- vimcdoc
- nerdtree
- vim-nerdtree-tabs
- nerdtree-git-plugin
- tagbar
- auto-pairs
- vim-airline
- YouCompleteMe
- vim-gitgutter
- gruvbox
- vim-one

## Usage
```
docker pull fengh0409/vim-go-ide:1.14.6
docker run -ti $GOPATH:/root/gowork fengh0409/vim-go-ide:1.14.6 bash
```

#### shortcut key
- F10 Show the directory tree, by nerdtree plugin
- F9 Show the classes/methods/variables, etc., can be selected to quickly jump to the target location, by tagbar plugin
- Ctrl + K Jump to the definition of a function or variable, by vim-godef plugin
- Ctrl + J Jump to the implementation of an interface, by vim-godef plugin

## Build
```
docker build -t fengh0409/vim-go-ide:1.14.6 .
```

Note：Due to network problems, the above build method is likely to fail, it is best to enable the proxy in the construction environment, and add the parameter `--network=host` when build image：
```
docker build --network=host -t fengh0409/vim-go-ide:1.14.6 .
```

## Thanks
The vimrc from [vim-go-ide](https://github.com/BroQiang/vim-go-ide), and i made some changes.
