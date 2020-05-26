
# install go and go utilities
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
export PATH=$PATH:/usr/local/go/bin
go get -u github.com/odeke-em/drive/cmd/drive


