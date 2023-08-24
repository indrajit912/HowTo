# LaTeX Distributions Installation Guide

This guide provides step-by-step instructions for installing LaTeX distributions on Linux, macOS, and Windows. LaTeX is a typesetting system used for creating documents with complex formatting, such as academic papers, theses, and presentations.

- Author: [Indrajit Ghosh](https://github.com/indrajit912)

- GitHub URL: 

- License: [MIT](LICENSE)

## Table of Contents

- [TeX Live Installation](#tex-live-installation)
  - [Linux](#linux)
  - [macOS](#macos)
  - [Windows](#windows)
- [MiKTeX Installation](#miktex-installation)
  - [Windows](#windows-1)
- [MacTeX Installation](#mactex-installation)
  - [macOS](#macos-1)

## TeX Live Installation

### Linux

1. Open a terminal.

2. Update package lists:
   ```bash
   sudo apt-get update
3. Install TeX Live:
    ```bash
    sudo apt-get install texlive-full
    ```

### macOS
1. Open a terminal.

2. Install Homebrew (if not already installed):
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

3. Install TeX Live using Homebrew:
    ```bash
    brew install --cask mactex-no-gui
    ```


### Windows
1. Download the TeX Live installer from https://www.tug.org/texlive/acquire-netinstall.html.

2. Run the installer and follow the installation prompts.


## MiKTeX Installation

### Windows
1. Download the MiKTeX installer from https://miktex.org/download.

2. Run the installer and follow the installation prompts.


## MacTeX Installation
### macOS
1. Download the MacTeX installer from http://www.tug.org/mactex/.

2. Run the installer and follow the installation prompts.

3. MacTeX includes TeX Live and additional tools tailored for macOS.

## License

This guide is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

