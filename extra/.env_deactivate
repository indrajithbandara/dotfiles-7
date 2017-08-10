BASE_PATH=`dirname "${BASH_SOURCE}"` 
PWD=`pwd`

if [[ "${BASE_PATH}" == "${PWD}" ]]
then
    declare -f -F deactivate &>/dev/null

    if [[ "${?}" == "0" ]]
    then
        deactivate
    fi
fi
