name "log4shib"
default_version "1.0.9"

source url: "http://shibboleth.net/downloads/#{name}/#{version}/#{name}-#{version}.tar.gz",
       md5: "7fc439b3ec63e5cb68e2106f4dcdffe9"

relative_path "#{name}-#{version}"

build do
  command "./configure" \
          " --prefix=#{install_dir}/embedded" 
  make "install"
end
