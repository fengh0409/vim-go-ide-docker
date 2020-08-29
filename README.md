## vim-go-ide
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
- F10 显示目录树, by nerdtree
- F9 显示tag, by tagbar
- Ctrl + K 跳转到某个函数、变量的定义, by vim-godef
- Ctrl + J 查看某个接口的实现, by vim-godef 

## Build
```
docker build -t fengh0409/vim-go-ide:1.14.6 .
```

注意：由于网络问题，上述构建方式很可能会失败，最好在构建环境开启代理，加上构建参数 `--network=host` ：
```
docker build --network=host -t fengh0409/vim-go-ide:1.14.6 .
```

## Thanks
The vimrc from [vim-go-ide](https://github.com/BroQiang/vim-go-ide), and i made some changes.
