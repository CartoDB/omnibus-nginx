name 'lua-nginx-module'
default_version '0.9.16'

dependency "luajit"

relative_path "#{name}-#{version}"

source url: "https://github.com/openresty/#{name}/archive/v#{version}.tar.gz",
       md5: "4041309464989fe3970c5a0efa931d53"

relative_path "#{name}-#{version}"

build do
  mkdir "#{install_dir}/embedded/share/nginx/#{name}"
  copy  "#{project_dir}/*", "#{install_dir}/embedded/share/nginx/#{name}/"
end
