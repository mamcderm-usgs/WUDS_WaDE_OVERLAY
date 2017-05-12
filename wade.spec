# sudo yum install rpm-build

Name: wade-web
Version: 0.0.1
Release: 1%{?dist}
Summary: The Water Data Exchange website
Group: Applications/Internet
License: GPL
URL: http://www.westernstateswater.org/wade/
Source: /tmp/wade/build/wade-web-0.1.1.tar.gz
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
BuildRequires:
Requires:
BuildArch: noarch
Packager: Ivan Suftin <isuftin@usgs.gov>
Prefix: /var/www/html

%description
Sets up the WaDE website on an Apache httpd server

%prep

%setup -q

%build
%configure
make %{?_smp_mflags}

%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc
