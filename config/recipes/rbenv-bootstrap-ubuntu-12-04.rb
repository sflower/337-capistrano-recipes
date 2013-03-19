namespace :rbenv_bootstrap do
  task :install, roles: :app do
    run "#{sudo} apt-get update"
    
    # Install development tools:
    run "#{sudo} apt-get -y install build-essential"

    # Packages required for compilation of some stdlib modules
    run "#{sudo} apt-get -y install tklib"

    # Extras for RubyGems and Rails:
    run "#{sudo} apt-get -y install zlib1g-dev libssl-dev"

    # Readline Dev on Ubuntu 12.04 LTS:
    run "#{sudo} apt-get -y install libreadline-gplv2-dev"

    # Install some nokogiri dependencies:
    run "#{sudo} apt-get -y install libxml2 libxml2-dev libxslt1-dev"
  end
  after "deploy:install", "rbenv_bootstrap:install"
end