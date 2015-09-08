name 'ngx_devel_kit'
default_version '0.2.19'

source url: "https://github.com/simpl/#{name}/archive/v#{version}.tar.gz",
       md5: "09a18178adca7b5674129d8100ce4f68"


relative_path "#{name}-#{version}"


build do
  mkdir "#{install_dir}/embedded/share/nginx/#{name}"
  copy  "#{project_dir}/*", "#{install_dir}/embedded/share/nginx/#{name}/"
end
