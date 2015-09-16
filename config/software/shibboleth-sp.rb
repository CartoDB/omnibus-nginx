name "shibboleth-sp"
default_version "2.5.5"

source url: "http://shibboleth.net/downloads/service-provider/#{version}/#{name}-#{version}.tar.gz",
       md5: "7dc27a9876a7cef281995075d62e16ce"

relative_path "#{name}-#{version}"

dependency "xerces-c"
dependency "log4cpp"
dependency "xml-security-c"
dependency "xmltooling"
dependency "opensaml"
dependency "fcgi"

build do

  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --with-log4cpp=#{install_dir}/embedded"  \
          " --with-log4shib=#{install_dir}/embedded" \
          " --with-openssl=#{install_dir}/embedded"  \
          " --with-fastcgi=#{install_dir}/embedded"

  make "-j #{workers}", env: env
  make "install", env: env

end
