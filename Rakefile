require "bundler/setup"

task :default => [:list]

desc "Lists all the tasks."
task :list do
  puts "Tasks: \n- #{(Rake::Task.tasks).join("\n- ")}"
end

desc "Checks for required dependencies."
task :check do
  environment_vars = [
    'OPSCODE_USER',
    'OPSCODE_ORGNAME',
    'KNIFE_CLIENT_KEY_FOLDER',
    'KNIFE_VALIDATION_KEY_FOLDER',
    'KNIFE_CHEF_SERVER',
    'KNIFE_COOKBOOK_COPYRIGHT',
    'KNIFE_COOKBOOK_LICENSE',
    'KNIFE_COOKBOOK_EMAIL',
    'KNIFE_CACHE_PATH'
  ]
  errors = []
  environment_vars.each do |var|
    if ENV[var].nil?
      errors.push(" - \e\[31m#Variable: #{var} not set!\e\[0m\n")
    else
      puts " - \e\[32mVariable: #{var} set to \"#{ENV[var]}\"\e\[0m\n"
    end
  end

  # client_key               "#{ENV['HOME']}/.chef/#{user}.pem"
  # validation_client_name   "#{ENV['ORGNAME']}-validator"
  # validation_key           "#{ENV['HOME']}/.chef/#{ENV['ORGNAME']}-validator.pem"
  # chef_server_url          "https://api.opscode.com/organizations/#{ENV['ORGNAME']}"


  file_list = [
    "#{ENV['KNIFE_CLIENT_KEY_FOLDER']}/#{ENV['OPSCODE_USER']}.pem",
    "#{ENV['KNIFE_VALIDATION_KEY_FOLDER']}/#{ENV['OPSCODE_ORGNAME']}-validator.pem",
  ]

    file_list.each do |file|
      if File.exist?(file)
        puts " - \e\[32mFile: \"#{file}\" found.\e\[0m\n"
      else
        errors.push(" - \e\[31mRequired file: \"#{file}\" not found!\e\[0m\n")
      end
    end

    if system("command -v virtualbox >/dev/null 2>&1")
      puts " - \e\[32mProgram: \"virtualbox\" found.\e\[0m\n"
    else
      errors.push(" - \e\[31mProgram: \"virtualbox\" not found!\e\[0m\n")
    end

    if system("command -v vagrant >/dev/null 2>&1")
      puts " - \e\[32mProgram: \"vagrant\" found.\e\[0m\n"
      %x{vagrant --version}.match(/\d+\.\d+\.\d+/) { |m|
        if Gem::Version.new(m.to_s) < Gem::Version.new('1.1.0')
          errors.push(" -- \e\[31mVagrant version \"#{m.to_s}\" is too old!\e\[0m\n")
        else
          puts " - \e\[32mVagrant \"#{m.to_s}\" works!\e\[0m\n"
        end
      }
    else
      errors.push(" - \e\[31mProgram: \"vagrant\" not found!\e\[0m\n")
    end

  unless errors.empty?
    puts "The following errors occured:\n#{errors.join()}"
  end
end

desc "Builds the package."
task :build do
  Rake::Task[:knife_test].execute
  Rake::Task[:foodcritic].execute
  Rake::Task[:chefspec].execute
end

desc "Builds the package for ci server."
task :build_ci do
  Rake::Task[:knife_test_ci].execute
  Rake::Task[:foodcritic].execute
  Rake::Task[:chefspec].execute
end

desc "Fires up the Vagrant box."
task :start do
  sh "vagrant up"
end

desc "Creates a new cookbook."
task :new_cookbook, :name do |t, args|
  sh "bundle exec knife cookbook create #{args.name}"
  sh "bundle exec knife cookbook create_specs #{args.name}"
  minitest_path = "cookbooks/#{args.name}/files/default/tests/minitest"
  mkdir_p minitest_path
  File.open("#{minitest_path}/default_test.rb", 'w') do |test|
    test.puts "require 'minitest/spec'"
    test.puts "describe_recipe '#{args.name}::default' do"
    test.puts "end"
  end
end

desc "Runs chefspec on all the cookbooks."
task :chefspec do
  sh "bundle exec rspec cookbooks"
end

desc "Runs foodcritic against all the cookbooks."
task :foodcritic do
  sh "bundle exec foodcritic -I test/foodcritic/* -f any cookbooks"
end

desc "Runs knife cookbook test against all the cookbooks."
task :knife_test do
  sh "bundle exec knife cookbook test -a"
end

desc "Runs foodcritic against all the cookbooks."
task :knife_test_ci do
  sh "bundle exec knife cookbook test -a -c test/knife.rb"
end

desc "Uploads Berkshelf cookbooks to our chef server"
task :berks_upload do
  sh "bundle exec berks upload -c config/berks-config.json"
end
