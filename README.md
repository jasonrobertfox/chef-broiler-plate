#Chef Broiler Platter

An opinionated, test driven, "broiler platter" for developing your chef infrastructure.

The goals of this project are:
- Learn how to develop Chef cookbooks.
- Develop cookbooks in a sound, test driven way.
- Help others new to the game.

##Can you party?
There are a number of dependencies to use this, at a bare minimum:

- Ruby 1.9.3
- Rake
- Bundler

Run this command to check the rest of your dependencies:

    rake check

##It is this simple:

Clone this repository:

    git clone git@github.com:jrobertfox/chef-broiler-platter.git

Go into the directory:

    cd chef-broiler-platter

Install your dependencies:

    bundle install

Start your box:

    vagrant up

or

    rake start

##Testing
This is supposed to be super simple. To run the suite of tests against your project:

    rake build
