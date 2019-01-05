workflow "Validate" {
  on = "push"
  resolves = ["bin"]
}

action "Build Jekyll" {
  uses = "ArctiqTeam/jekyll-build@master"
  secrets = [""]
}

action "bin" {
  uses = "actions/bin/sh@master"
  needs = ["GitHub Action for Docker"]
  args = "[\"ls -ltr\"]"
}
