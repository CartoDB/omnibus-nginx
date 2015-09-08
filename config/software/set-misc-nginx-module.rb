name 'set-misc-nginx-module'
default_version '0.29'

organization = "openresty"

relative_path "#{name}-#{version}"

source url: "https://github.com/#{organization}/#{name}/archive/v#{version}.tar.gz",
       md5: "a0d50283cdf9b9eb5bec07ca1530a6e0"

relative_path "#{name}-#{version}"


build do
  mkdir "#{install_dir}/embedded/share/nginx/#{name}"
  copy  "#{project_dir}/*", "#{install_dir}/embedded/share/nginx/#{name}/"
end
