name "nginx-http-shibboleth"
default_version "master"

dependency "shibboleth-sp"

organization = "nginx-shib"

source git: "https://github.com/#{organization}/#{name}"

relative_path "#{name}-#{version}"

build do
  mkdir "#{install_dir}/embedded/share/nginx/#{name}"
  copy  "#{project_dir}/config", "#{install_dir}/embedded/share/nginx/#{name}"
  copy  "#{project_dir}/ngx_http_shibboleth_module.c", "#{install_dir}/embedded/share/nginx/#{name}"
end
