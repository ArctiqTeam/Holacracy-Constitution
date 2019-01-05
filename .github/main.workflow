workflow "Validate" {
  on = "push"
  resolves = ["bin"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  args = "run -v $(pwd):/srv/jekyll -it jekyll/jekyll:pages jekyll build --drafts"
}

action "bin" {
  uses = "actions/bin/sh@master"
  needs = ["GitHub Action for Docker"]
  args = "[\"ls -ltr\"]"
}
