workflow "Validate" {
  on = "push"
  resolves = ["bin"]
}

action "debug" {
  uses = "actions/bin/debug@master"
}

action "Build Jekyll" {
  uses = "ArctiqTeam/jekyll-build@master"
  needs = ["debug"]
}

action "bin" {
  uses = "actions/bin/sh@master"
  needs = ["Build Jekyll"]
  args = "[\"ls -ltr\"]"
}
