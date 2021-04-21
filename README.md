<h3 align="center">
  <img src="images/logo.png" alt="fastlane Logo" width="150" align="center">
</h3>

<h1 align="center">kommit.rb</h1>

<h4 align="center">I believe these little green squares with different shades on people's GitHub profiles should be interpreted as what they are - colorful squares. They don't respresent anything in a legitimate form since they can be easily spoofed. That's why I created <ins>kommit.rb</ins></h4>
<hr>

## Requirements

- Ruby
- GitHub CLI [Link](https://cli.github.com/)
<hr>

#### What does it do?

`kommit.rb` is a simple CLI tool that allows you to create an arbitrary amount of git commits dating back to an arbitrary date in the past which can result in a completly changed commit history on a user's GitHub profile page. Users answer a few questions and `kommit.rb` does the rest.

#### How does it work?

`kommit.rb` uses the GitHub CLI to create a private repository in the user's home directory. Based on the user's input it then creates a certain amount of commits for a certain amount of days back in the past and then pushes them to GitHub all at once.

#### Reverting changes

As `kommit.rb` uses a private repository reverting all commits is as simple as deleting the repository on GitHub.

<hr>

## Usage

1. Navigate inside the project folder
2. Run `ruby kommit`
