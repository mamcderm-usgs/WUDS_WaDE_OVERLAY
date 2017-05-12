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
mkdir -p %{buildroot}/%{_bindir}

install -m 0755 %{name} %{buildroot}/%{_bindir}/%{name}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc

%changelog
* Tue May 31 2016 Adam Miller <maxamillion@fedoraproject.org> - 0.1-1
- First bello package
- Example second item in the changelog for version-release 0.1-1
