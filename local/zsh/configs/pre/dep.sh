#!/usr/bin/env bash

function dep {

  local cmd="$1"

  usage="dep [-h] [-l -d -b] -- script to host a website intended for Google App
  Engine locally or to deploy it to GAE.

  where:
  -h  show this help text
  local | -l run the app locally
  deploy | -d deploy the app
  browse | -b launch a browser and view the remote app"

  case "${cmd}" in
    "local|-l")
      run "${VERBOSE}" \
        "dev_appserver.py app.yaml" \
        "Running app locally" \
        "true"
      ;;
    "deploy|-d")
      run "${VERBOSE}" \
        "gcloud app deploy" \
        "Deploying app" \
        "true"
      ;;
    "browse|-b")
      run "${VERBOSE}" \
        "gcloud app browse" \
        "Going to remote app" \
        "true"
      ;;
    *)
      cprint "${usage}"
      ;;
  esac
}
