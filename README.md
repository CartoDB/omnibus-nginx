NGINX Plus omnibus build project
========================
This project creates full-stack platform-specific packages for
NGINX Plus version 1.9.4, 1.9.6. This also includes single signon integration via Shibboleth and SAML. Thus you can use your own shibboleth configured identity provider to protect access to your web services via the web server and not have to add custom authentication to your web applications or web services. Shibboleth+NGINX can handle that for you.

This is tested to work on Redhat and Ubuntu. This doesnt exclude some NGINX Plus features like streaming services.

Installation
------------
This omninus packaging does rely on the fakeroot package. Install this via your package manager like so

```shell
[root@nginx]# apt-get install fakeroot
```

You must have a sane Ruby 2.0+ environment with Bundler installed. Ensure all
the required gems are installed:

```shell
$ bundle install --binstubs
```

Usage
-----
### Build

You create a platform-specific package using the `build project` command:

```shell
$ bin/omnibus build nginx -l unknown
or
$ OMNIBUS_BASE_DIR=/home/foo/mybuildoutput bin/omnibus build nginx -l unknown
```

"-l unknown" is for maximum spew of build information.

The platform/architecture type of the package created will match the platform
where the `build project` command is invoked. For example, running this command
on a MacBook Pro will generate a Mac OS X package. After the build completes
packages will be available in the `$OMNIBUS_BASE_DIR/pkg/` folder or your local
build folder under local/omninus/pkg

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
$ bin/omnibus clean nginx
```

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/template`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bin/omnibus clean nginx --purge
```

### Publish

Omnibus has a built-in mechanism for releasing to a variety of "backends", such
as Amazon S3. You must set the proper credentials in your `omnibus.rb` config
file or specify them via the command line.

```shell
$ bin/omnibus publish path/to/*.deb --backend s3
```

### Help

Full help for the Omnibus command line interface can be accessed with the
`help` command:

```shell
$ bin/omnibus help
```

NOTE: On Redhat the RPM packager will use the /tmp directory for its temporary working space. We recommend overriding this to a disk area with more space like so

```shell
$ OMNIBUS_BASE_DIR=/home/foo/mybuildoutput TMPDIR=/my/big/disk/path bin/omnibus build nginx -l unknown
```


Kitchen-based Build Environment
-------------------------------
Every Omnibus project ships will a project-specific
[Berksfile](http://berkshelf.com/) that will allow you to build your omnibus projects on all of the projects listed
in the `.kitchen.yml`. You can add/remove additional platforms as needed by
changing the list found in the `.kitchen.yml` `platforms` YAML stanza.

This build environment is designed to get you up-and-running quickly. However,
there is nothing that restricts you to building on other platforms. Simply use
the [omnibus cookbook](https://github.com/opscode-cookbooks/omnibus) to setup
your desired platform and execute the build steps listed above.

The default build environment requires Test Kitchen and VirtualBox for local
development. Test Kitchen also exposes the ability to provision instances using
various cloud providers like AWS, DigitalOcean, or OpenStack. For more
information, please see the [Test Kitchen documentation](http://kitchen.ci).

Once you have tweaked your `.kitchen.yml` (or `.kitchen.local.yml`) to your
liking, you can bring up an individual build environment using the `kitchen`
command.

```shell
$ bin/kitchen converge ubuntu-1204
```

Then login to the instance and build the project as described in the Usage
section:

```shell
$ bundle exec kitchen login ubuntu-1204
[vagrant@ubuntu...] $ cd omnibus-nginx
[vagrant@ubuntu...] $ bundle install
[vagrant@ubuntu...] $ ...
[vagrant@ubuntu...] $ bin/omnibus build nginx
```

For a complete list of all commands and platforms, run `kitchen list` or
`kitchen help`.
