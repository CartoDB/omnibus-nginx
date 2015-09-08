name 'lua'
default_version '5.3.1'

dependency 'readline'

relative_path "#{name}-#{version}"

source url: "http://www.lua.org/ftp/lua-#{version}.tar.gz",
       md5: "797adacada8d85761c079390ff1d9961"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  make "linux MYLIBS=\"-L#{install_dir}/embedded/lib -lncurses\"", env: env
  make "install INSTALL_TOP=#{install_dir}/embedded", env: env
end

