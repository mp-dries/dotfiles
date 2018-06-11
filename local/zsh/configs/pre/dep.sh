#!/usr/bin/env bash

dep () {

  local cmd="$1"

  usage="dep [-h] [-l -d -b] -- script to host a website intended for Google App
  Engine locally or to deploy it to GAE.

  where:
  -h  show this help text
  local | -l run the app locally
  deploy | -d deploy the app
  browse | -b launch a browser and view the remote app"

  case "${cmd}" in
    "local"|"-l")
        dev_appserver.py app.yaml
      ;;
    "deploy"|"-d")
        gcloud app deploy
      ;;
    "browse"|"-b")
        gcloud app browse
      ;;
    *)
      cprint "${usage}"
      ;;
  esac
}
