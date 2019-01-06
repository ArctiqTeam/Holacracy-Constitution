workflow "Validate" {
  on = "push"
  resolves = ["Git Push","Validate Site"]
}

action "bin" {
  uses = "actions/bin/sh@master"
  args = ["mkdir _site && chmod -R 777 _site"]
}

action "python_test" {
  uses = "actions/bin/sh@master"
  args = ["echo $(date) >> test.txt"]
}

action "Git Push" {
  uses = "ArctiqTeam/jekyll-ci/git_push@master"
  needs = ["python_test"]
  secrets = ["GITHUB_TOKEN"]
  args = "tag push"
}

action "Build Jekyll" {
  uses = "ArctiqTeam/jekyll-ci/build@master"
  needs = ["bin"]
}

action "Validate Site" {
  uses = "ArctiqTeam/jekyll-ci/validate@master"
  needs = ["Build Jekyll"]
  args = "--url-ignore \"https://www.arctiq.ca/tag/,/tag/\" --assume_extension --allow_hash_href --http-status-ignore \"999\" --empty_alt_ignore --check_html _site"
}
