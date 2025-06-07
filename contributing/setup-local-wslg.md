On local WSLg machines it's needed to install the following packages:

```bash
sudo apt install tk-dev
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.13 python3.13-dev python3.13-tk
```

and to setup the environment in the following way:

```bash
rm -rf .venv
uv venv --python /usr/bin/python3.13
uv sync
```

And to install Go + misspell (get latest version and replace the version in the command):

```bash
sudo rm -rf /usr/local/go
cd /tmp
wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz
# Add Go to PATH
export PATH=$PATH:/usr/local/go/bin

# Set up Go workspace
mkdir -p ~/go/{bin,src,pkg}
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

# Verify Go installation
go version

# Install misspell
go install github.com/client9/misspell/cmd/misspell@latest
```

Check Tkinter and pyinstaller versions:

```bash
uv run python -c "import tkinter; print(tkinter.TkVersion)"
uv run python -c "import PyInstaller; print(PyInstaller.__version__)"
```
