env_parallel --session

start_stubby() {
  npm run stubs > /dev/null 2>&1 &
}

find_stubby() {
  local stubby_port
  stubby_port=7443

  sudo netstat -tnlp \
    | grep "$stubby_port" \
    | awk '{ print substr($NF, 0, index($NF, "/")-1) }'
}

run_smart_suite() {
  local suite=$1
  if [ -z "$suite" ]; then
    echo "Missing test suite"
    return
  fi

  local suites=("ams-data" "smart-cdk" "smart-webapp")
  if [[ ! "${suites[*]}" =~ "$suite" ]]; then
    echo "Invalid test suite"
    return
  fi

  ng test "$suite" --configuration=stubby --watch=false 2>&1 \
    | tee "$HOME/dev/work/${suite}_smart_tests.txt" \
    | grep --ignore-case "failed$" \
    | sed "s/.*/${suite} &/"

  return 0
}

view_smart_test_results() {
  local suite=$1
  if [ -z "$suite" ]; then
    echo "Missing test suite"
    return
  fi

  local suites=("ams-data" "smart-cdk" "smart-webapp")
  if [[ ! "${suites[*]}" =~ "$suite" ]]; then
    echo "Invalid test suite"
    return
  fi

  cat "$HOME/dev/work/${suite}_smart_tests.txt" | less -i
}

clear_smart_test_results() {
  local suite=$1
  if [ -z "$suite" ]; then
    echo "Missing test suite"
    return
  fi

  local suites=("ams-data" "smart-cdk" "smart-webapp")
  if [[ ! "${suites[*]}" =~ "$suite" ]]; then
    echo "Invalid test suite"
    return
  fi

  rm "$HOME/dev/work/${suite}_smart_tests.txt"
}

rst() {
  env_parallel run_smart_suite ::: "ams-data" "smart-cdk" "smart-webapp"
}

nr() {
  local script=$(cat ./package.json | jq -r '.scripts | keys []' | sort | fzf)
  if [ -z "$script" ]; then
    return
  fi

  npm run "$script"
}

sdp() {
  find . -type f -name "launchSettings.json" | xargs cat | jq -r ".profiles | keys[]" | grep ".*_.*" | fzf
}

dr() {
  local project=$(find . -type f -name "**.WebApi.csproj")
  if [ -z "$project" ]; then
    return
  fi

  local profile=$(sdp)
  if [ -z "$profile" ]; then
    return
  fi

  dotnet run --project "$project" --launch-profile "$profile"
}

alias vst="view_smart_test_results"
alias cst="clear_smart_test_results"

