#!/usr/bin/env bash

# Function
run () {

  # Arguments
  local verbose="$1"
  local command="$2"
  local description="$3"
  local exit_on_error="$4"
  local exit_code=1

  if [ "$verbose" = true ]; then
    if [ ! -z "$description" ]; then
      cprint info "$description"
    fi
    cprint "Running: $command"

    eval $command
    local exit_code=$?

    if [ $exit_code -eq 0 ]; then
      cprint success "Finished $description"
    else
      cprint error "Failed $description"
    fi

  else
    local output_file="$( mktemp -t 'XXXXXXX.dotfiles.output.run' )"
    eval $command >/dev/null 2> "$output_file" &
    local pid=$!

    local spin[0]="⣷"
    local spin[1]="⣯"
    local spin[2]="⣟"
    local spin[3]="⡿"
    local spin[4]="⢿"
    local spin[5]="⣻"
    local spin[6]="⣽"
    local spin[7]="⣾"

    while kill -0 $pid &> /dev/null
    do
      for i in "${spin[@]}"
      do
        if [ ! -z "$description" ]
        then
          printf "\r$i  $description"
        else
          printf "\r$i"
        fi
        sleep 0.1
      done
    done
    if [ ! -z "$description" ]
    then
      local clean_description="$( printf "%${#description}s" |tr " " " " )"
      printf "\r$clean_description   \r"
    else
      printf "\r \r"
    fi

    wait $pid
    local exit_code=$?

    if [ $exit_code -eq 0 ]; then
      cprint success "Finished $description"
    else
      cat "$output_file"
      cprint error "Failed $description"
    fi
    rm -f "$output_file"

  fi

  if [ "$exit_on_error" = true ] && [ $exit_code -ne 0 ]; then
    exit 1
  fi
  return $exit_code

}

