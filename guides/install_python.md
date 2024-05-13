# Python3 Installation Guide
This tutorial outlines the step-by-step process for installing Python3.

## Installation on Linux
- Begin by updating your system using the following command:
```bash
sudo apt update
```
- Proceed to install the necessary dependencies with this command:
```bash
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev
```
- With the dependencies installed, you can now proceed to install Python using the source file. Visit [this page](https://www.python.org/downloads/source/) and download your desired version of Python3 ('XZ compressed source tarball').
- After downloading, navigate to your ~/Downloads directory:
```bash
cd ~/Downloads
```
- Extract the downloaded file using the command:
```bash
tar -xJf Python-3.XX.X.tar.xz # Replace your python tar file name
```
- Move into the newly created directory:
```bash
cd Python-3.XX.X
```
- Compile the source code by running:
```bash
./configure --enable-optimizations
```
- Utilize the generated Makefile to build Python:
```bash
sudo make install
```
- Once the installation process completes, the installed version should become the default one on your device. To verify, check the Python version again:
```bash
Python-3.XX.X --version
```
- (Optional) Change your default Python version using the following command:
```bash
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.XX.X
```