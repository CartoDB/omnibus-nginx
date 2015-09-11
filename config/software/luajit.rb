name 'LuaJIT'
default_version '2.0.4'


relative_path "#{name}-#{version}"

source url: "http://luajit.org/download/LuaJIT-#{version}.tar.gz",
       md5: "dd9c38307f2223a504cbfb96e477eca0"

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  make "PREFIX=#{install_dir}/embedded", env: env
  make "install PREFIX=#{install_dir}/embedded", env: env
end

