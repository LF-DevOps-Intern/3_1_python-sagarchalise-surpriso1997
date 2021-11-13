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

function create_and_activate_virtual_env {

    virtualenv venv

    source ./venv/bin/activate

    pip install -r requirements.txt

}

function dispaly_help_messages_if_no_args_parsed {
    if [[ "$#" == 0 || "$1"=="--help" || "$1"=="-h" ]]; then
        echo -ne "\n\n"
        echo -ne "description:\n"
        echo -ne "\n\n"
        echo -ne "\t --url or -u  \t\t URL to the remote file\n"
        echo -ne "\n\n"

        exit 0
    fi

}

# function parse_the_arguments() {
#     url=${var:-value}
#     echo "$#"

#     #  looping through the arguments while the length of arguements is greater than 0
#     while [[ "$#" -gt 0 ]]; do
#         args="$1"
#         case "$args" in
#         #  case where argument is either -u or --url
#         -u | --url)
#             echo "Parsing the url arguments "
#             url=$2
#             shift
#             shift
#             echo "$url"
#             ;;
#             # case where aggumetn --http_server
#         --http_server)
#             shift
#             ;;
#             #  default case
#         *)
#             echo "Invalid Arguments"
#             exit 0
#             ;;
#         esac

#     done

# }

function check_the_system_versions_requirements {
    check_python_version
    check_pip3_version
    check_virtualenv_version

}

function startup {

    check_the_system_versions_requirements

    create_and_activate_virtual_env

    python3 main.py

}

startup"$@"