workflow "Validate" {
  on = "push"
  resolves = ["Build Jekyll"]
}

action "bin" {
  uses = "actions/bin/sh@master"
  args = ["chmod -R 777 /github/workspace"]
}

action "Build Jekyll" {
  uses = "ArctiqTeam/jekyll-build@master"
  needs = ["bin"]
}
