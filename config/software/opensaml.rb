name "opensaml"
default_version "2.5.5"

source url: "http://shibboleth.net/downloads/c++-opensaml/2.5.5/#{name}-#{version}.tar.gz",
       md5: "85c1e093b8df11d7b197f6d7585e46e5"

relative_path "#{name}-#{version}"

dependency 'zlib'

build do
  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --disable-doxygen-doc" \
          " --with-log4cpp=#{install_dir}/embedded" \
          " --with-log4shib=#{install_dir}/embedded" \
          " --with-zlib=#{install_dir}/embedded"
  make "install"
end
