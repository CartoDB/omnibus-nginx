name "nginx"
maintainer "CartoDB team"
homepage "https://github.com/CartoDB/omnibus-nginx/blob/master/README.md"

build_version Omnibus::BuildVersion.semver
build_iteration 1

MYUSERNAME = ENV['LOGNAME']

package_user  "#{MYUSERNAME}"
package_group "#{MYUSERNAME}"

package_root = ENV['OMNIBUS_PACKAGE_ROOT'] || "#{default_root}"
install_dir "#{package_root}/#{name}"

exclude "**/.git"
exclude "**/bundler/git"

dependency "nginx"
