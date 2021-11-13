# ! /usr/bin/bash

function check_pip3_version {
    if [[ $(pip3 --version) ]]; then
        echo "Pip3 is already installed"
    else
        sudo apt install python3-pip
    fi
}

function check_virtualenv_version {
    if [[ $(virtualenv --version) ]]; then
        echo "Pyton virtaul  env is already installed"
    else
        sudo apt-get install virtualenv
    fi
}

function check_python_version {
    if [[ $(python3 --version) ]]; then
        echo $(python3 --version) "is already installed"
    fi
}

check_pip3_version
