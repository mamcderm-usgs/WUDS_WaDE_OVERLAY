# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-6.8"

  # Before running this, you will need to create an environment
  # variable on your host to pass in your GitHub access token.
  # This is done because https://github.com/USGS-CIDA/postgres-fullapp
  # is a private repository and authentication is required to pull
  # down code from it. The environment variable is named GITHUB_ACCESS_TOKEN
  # Example:
  # $ export GITHUB_ACCESS_TOKEN=<token value>
  # $ vagrant up
  #
  # We are not using SSL verification to use the https endpoint with
  # GitHub. When on the DOI network, there is an intercept root certificate
  # that is used for all HTTPS communications. Because this is for
  # development use, we bypass SSL verification.
  config.vm.provision "shell" do |s|
    s.privileged = false
    s.env = {
      GITHUB_ACCESS_TOKEN:ENV['GITHUB_ACCESS_TOKEN'],
      GIT_SSL_NO_VERIFY:true,
      WADE_VERSION:ENV['WADE_VERSION'] || '0.0.1'
    }
    s.inline = <<-SHELL
      echo "Installing necessary build tools"
      sudo yum makecache
      sudo yum install -y git rpmdevtools

      echo "Creating build directory"
      rpmdev-setuptree

      if [ ! -d ~/original/.git/ ]; then
        echo "Downloading original source"
        git clone https://$GITHUB_ACCESS_TOKEN:x-oauth-basic@github.com/USGS-CIDA/postgres-fullapp.git ~/original/
      fi

      if [ ! -d ~/overlay/.git ]; then
        echo "Downloading overlay source"
        git clone https://github.com/USGS-CIDA/WUDS_WaDE_OVERLAY.git ~/overlay/
      fi


      echo "Creating tar package"
      mkdir -p ~/wade-web-$WADE_VERSION/var/www/html
      cp -a ~/original/webservices/WADE ~/wade-web-$WADE_VERSION/var/www/html
      cp -a ~/overlay/webservices/WADE ~/wade-web-$WADE_VERSION/var/www/html
      tar -zcf ~/wade-web-$WADE_VERSION.tar.gz -C ~ ./wade-web-$WADE_VERSION/
      mv ~/wade-web-$WADE_VERSION.tar.gz ~/rpmbuild/SOURCES/
      cp ~/overlay/wade.spec ~/rpmbuild/SPECS/
      cd ~/rpmbuild/SPECS/
      rpmbuild -v --clean -ba wade.spec
    SHELL
  end
end
