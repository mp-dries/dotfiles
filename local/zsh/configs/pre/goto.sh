#!/usr/bin/env bash

# Function
goto () {
        if [[ "$#" -eq 2 ]]; then
                echo "Trying to reach ${1}@${2}"
                ssh ${1}@${2}
        elif [[ "$#" -eq 1 ]]; then
                echo "Trying to reach ${1}@${workserver}"
                ssh ${1}@${workserver}
        else
                echo "Wrong amount of arguments supplied"
        fi
}

