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

_FILE_DIR="${1}"
_SEARCH_STR="${2}"

if [[ $# -ne 2 ]];then
    exit ${_EXIT_FAILURE}
fi

if ! [[ -d "${_FILE_DIR}" ]];then
    exit ${_EXIT_FAILURE}
fi

_FILE_COUNT=0
_MATCHING_LINES_COUNT=0
while IFS= read -r file;do
    _MATCHING_LINES_COUNT=$(( _MATCHING_LINES_COUNT + $(grep -c "${_SEARCH_STR}" -c "${file}") ))
    if grep "${_SEARCH_STR}" -sq "${file}";then
        _FILE_COUNT=$(( _FILE_COUNT + 1 ))
    fi
done < <(find "${_FILE_DIR}" -type f)
printf "The number of files are %d and the number of matching lines are %d\n" "${_FILE_COUNT}" "${_MATCHING_LINES_COUNT}"
