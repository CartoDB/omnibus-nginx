name "headers-more-nginx-module"
default_version "0.261"

organization = "openresty"

relative_path "#{name}-#{version}"

source url: "https://github.com/#{organization}/#{name}/archive/v#{version}.tar.gz",
       md5: "1c62b9de27fe0df00f4eaae1b240652d"

build do
  mkdir "#{install_dir}/embedded/share/nginx/#{name}"
  copy  "#{project_dir}/*", "#{install_dir}/embedded/share/nginx/#{name}/"
end
