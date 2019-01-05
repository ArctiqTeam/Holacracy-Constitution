workflow "Validate" {
  on = "push"
  resolves = ["bin"]
}

action "Build Jekyll" {
  uses = "ArctiqTeam/jekyll-build@master"
}

action "bin" {
  uses = "actions/bin/sh@master"
  needs = ["Build Jekyll"]
  args = ["ls -ltr"]
}
