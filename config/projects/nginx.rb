name "nginx"
maintainer "CartoDB team"
homepage "https://github.com/CartoDB/omnibus-nginx/blob/master/README.md"

build_version Omnibus::BuildVersion.semver
build_iteration 1

package_user   ENV['OMNIBUS_PACKAGE_USER']  || ENV['LOGNAME'] || 'root'
package_group  ENV['OMNIBUS_PACKAGE_GROUP'] || ENV['OMNIBUS_PACKAGE_USER'] || ENV['LOGNAME'] || 'root'
package_root = ENV['OMNIBUS_PACKAGE_ROOT']  || '/opt'

build_iteration ENV['OMNIBUS_PROJECT_BUILD_ITERATION'] || 1

install_dir "#{package_root}/#{name}"

# .rpm and .deb are already compressed so the below compress doesnt help much. 
# compress :tgz

exclude "**/.git"
exclude "**/bundler/git"

dependency "nginx"
