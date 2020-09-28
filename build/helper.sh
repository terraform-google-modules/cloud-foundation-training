#!/usr/bin/env bash

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -eo pipefail

SOLUTION_JSON="build/solutions.json"
SOLUTION_EXT=".solution"

# replace one files in training module path with file from solution files
add_solutions(){
    if [ "$#" -lt 3 ]; then
        >&2 echo "Not all expected arguments set."
        exit 1
    fi
    file=${1}
    modules_path=${2}
    solution_path=${3}
    if [[ ! -f "${modules_path}/${file}" ]]; then
        echo "${modules_path}/${file} does not exist, exiting."
        exit 1
    fi
    if [[ ! -f "${solution_path}/${file}${SOLUTION_EXT}" ]]; then
        echo "${solution_path}/${file}${SOLUTION_EXT} does not exist, exiting."
        exit 1
    fi
    echo "Copying ${solution_path}/${file}${SOLUTION_EXT} to ${modules_path}/${file}"
    cp -f "${solution_path}/${file}${SOLUTION_EXT}" "${modules_path}/${file}"
}

for module in $(jq -r -c '.[]' "${SOLUTION_JSON}"); do
    get_attr() {
        echo "${module}" | jq -r -c "${1}"
        }
    files_to_replace=$(get_attr '.files_to_replace')
    modules_path=$(get_attr '.modules_path')
    solution_path=$(get_attr '.solution_path')
    for file in $(echo "${files_to_replace}" | jq -r -c '.[]'); do
        add_solutions "$file" "$modules_path" "$solution_path"
    done
done
