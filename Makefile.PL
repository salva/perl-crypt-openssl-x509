use inc::Module::Install;

use Config;

name('Crypt-OpenSSL-X509');
license('perl');
perl_version('5.005');
all_from('X509.pm');

homepage 'https://github.com/dsully/perl-crypt-openssl-x509';
bugtracker 'https://github.com/dsully/perl-crypt-openssl-x509/issues';

requires_external_cc();

if ($Config::Config{myuname} =~ /^Win(32|64) strawberry-perl\b/) {
    cc_lib_links("eay$1");
}
else {
    cc_inc_paths('/usr/include/openssl', '/usr/local/include/ssl', '/usr/local/ssl/include');
    cc_lib_paths('/usr/lib', '/usr/local/lib', '/usr/local/ssl/lib');

    cc_lib_links('crypto');

    cc_optimize_flags('-O2 -g -Wall -Werror');
}

auto_install();
WriteAll();
