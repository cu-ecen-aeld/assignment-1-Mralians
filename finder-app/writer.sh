#! /usr/bin/env bash
#
# SCRIPT: ./finder.sh
# DESCRIPTION: -
# AUTHOR: Mralians


set -o pipefail

if [[ -n ${DEBUG} ]];then
    set -x
fi

readonly _EXIT_SUCCESS=0
readonly _EXIT_FAILURE=1


_WRITE_FILE="${1}"
_WRITESTR="${2}"

if [[ $# -ne 2 ]];then
    exit ${_EXIT_FAILURE}
fi

_DIR_NAME=$(dirname "${_WRITE_FILE}")
if ! [[ -d "${_DIR_NAME}" ]];then
    mkdir -p "${_DIR_NAME}"
fi
echo "${_WRITESTR}" > "${_WRITE_FILE}" || exit "${_EXIT_FAILURE}"


exit "${_EXIT_SUCCESS}"
