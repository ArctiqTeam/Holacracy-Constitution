workflow "Validate" {
  on = "push"
  resolves = ["Validate Site"]
}

action "bin" {
  uses = "actions/bin/sh@master"
  args = ["mkdir _site && chmod -R 777 _site"]
}

action "Build Jekyll" {
  uses = "ArctiqTeam/jekyll-ci/build@master"
  needs = ["bin"]
}

action "Validate Site" {
  uses = "ArctiqTeam/jekyll-ci/validate@master"
  needs = ["Build Jekyll"]
  args = "--assume_extension --allow_hash_href --http-status-ignore \"999\" --empty_alt_ignore --check_html _site"
}
