WUDS WaDE overlay
===

This project serves as content to overlay the WUDS WaDE wade source. The overlay is done during the artifact build process.  As content is added to the directories in this project, the empty `.keep` file may be removed from that directory. The `.keep` file is only used as a convention to allow adding empty directories to a git repository.

#### __wade.spec__

This file is still under development but ultimately will serve as the process by which an RPM is created for this project.  More info about SPEC files [can be found here](http://rpm-guide.readthedocs.io/en/latest/rpm-guide.html#what-is-a-spec-file).

#### Vagrantfile

The Vagrantfile provided is an example of how the RPM is built manually on a CentOS system.
In order for this to work, the Vagrantfile requires an environment variable named
`GITHUB_ACCESS_TOKEN` to be set. This is required in order to access the private
repository for https://github.com/USGS-CIDA/postgres-fullapp which is where the
original source is held. Before using Vagrant, you can set the environment variable:

`$ export GITHUB_ACCESS_TOKEN=<token>``


While in the same directory as the Vagrantfile, just type `vagrant up` and watch
as Vagrant creates a CentOS VM and builds the RPM. In the end, if everything worked
as expected, the source and binary RPMs will have been built. By default, the directory
containing your Vagrantfile is synched with the VM. When the RPMs are built, they
will also be copied to this directory.
