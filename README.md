#Chef Broiler Plate (1.0.1)

![image](http://www.templeofthai.com/images/products/6270000420.jpg)

An opinionated, test driven, "broiler platter" for developing your chef infrastructure.

Master branch: [![Build Status](https://travis-ci.org/jrobertfox/chef-broiler-platter.png?branch=master)](https://travis-ci.org/jrobertfox/chef-broiler-platter)

Develop branch: [![Build Status](https://travis-ci.org/jrobertfox/chef-broiler-platter.png?branch=develop)](https://travis-ci.org/jrobertfox/chef-broiler-platter)

####The goals of this project are:
- Learn how to develop Chef cookbooks.
- Develop cookbooks in a sound, test driven way.
- Help others new to the game.

##Can you party?
There are a number of dependencies to use this, at a bare minimum:

- Ruby 1.9.3
- Rake
- Bundler
- Virtual Box
- Vagrant

Run this command to check the rest of your dependencies:

    rake check

Use the file located in `environment.sh` to set the needed environment variables. You can source this file or add the variables to your `.bash_profile`. These can be over ridden in forked projects by specifying them in the included `knife.rb` file. In general the file has been set up to allow multiple users to access the project repository. The fastest way is to just set your variables and run:

    source environment.sh

##It is this simple:

Clone this repository:

    git clone git@github.com:jrobertfox/chef-broiler-platter.git

Go into the directory:

    cd chef-broiler-platter

Install the submodules:

    git submodule init
    git submodule update

Install your dependencies:

    bundle install

Check to make sure everything is ok:

    rake check

Start your box:

    vagrant up

or

    rake start

##Testing
This is supposed to be super simple. To run the suite of tests against your project:

    rake build

##Contribution Guidelines
This project conforms to the [neverstopbuilding/craftsmanship](https://github.com/neverstopbuilding/craftsmanship) guidlines. Please see that repository for details on project administration.

