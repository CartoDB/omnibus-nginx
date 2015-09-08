#
# This project is a container of common libraries used by applications in CartoDB stack
# Software dependents of these libraries shouldn't need to rebuild them but just deploy the produced package
#
name "nginx"
maintainer "Data Visualization WEBMAPS team"
homepage "https://cms.prod.bloomberg.com/team/display/datavis/Webmap"

build_version Omnibus::BuildVersion.semver
build_iteration 1

MYUSERNAME = ENV['LOGNAME']

package_user  "#{MYUSERNAME}"
package_group "#{MYUSERNAME}"

install_dir "#{ENV['HOME']}/software"

exclude "**/.git"
exclude "**/bundler/git"

dependency "nginx"
