%define _rpmfilename %%{NAME}-%%{VERSION}-%%{RELEASE}.%{?dist}.%%{ARCH}.rpm
%define _unpackaged_files_terminate_build 0
%define apache_dir /var/www/html

Name: wade-web
Version: %{_wade_version}
Release: %{_wade_release}%{?dist}
Epoch: %{_wade_epoch}
Summary: The Water Data Exchange website
Group: Applications/Internet
License: GPL
URL: http://www.westernstateswater.org/wade/
Source: %{_topdir}/SOURCES/%{name}-%{version}.tar.gz
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
BuildArch: noarch
Packager: Ivan Suftin <isuftin@usgs.gov>
Prefix: %{apache_dir}

%description
Sets up the WaDE website on an Apache httpd server

%prep

%setup -q

%build

#%%configure

%pre
if [ "$1" = "2" ]; then
  rm -rf %{apache_dir}/WADE
fi

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}%{apache_dir}
cp -rp * %{buildroot}
find . -type f |sed -e 's/^\.//' > %{buildroot}/file.list.%{name}
find . -type l | sed -e 's,^\.,\%attr(-\,root\,root) ,' >> %{buildroot}/file.list.%{name}

%clean
rm -rf %{buildroot}

%files -f %{buildroot}/file.list.%{name}
%dir %{apache_dir}/WADE
%defattr(755,root,root,755)
%doc

%changelog
* Fri May 12 2017 Ivan Suftin <isuftin@usgs.gov> - 0.0.1-1
- Initial spec creation
