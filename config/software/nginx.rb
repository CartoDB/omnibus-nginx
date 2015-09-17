name "nginx"
default_version "1.9.4"

dependency "libgd"
dependency "pcre"
dependency "openssl"
dependency "nginx-http-shibboleth"
dependency "headers-more-nginx-module"
dependency "lua-nginx-module"
dependency "ngx_devel_kit"
dependency "set-misc-nginx-module"
dependency "libxslt"
dependency "perl"
dependency "geoip"

source url: "http://nginx.org/download/nginx-#{version}.tar.gz",
    md5: "27322fbb4b265c0e0cc548f5e6b7f201"

relative_path "nginx-#{version}"

build do
        env = with_standard_compiler_flags(with_embedded_path).merge(
            "LUAJIT_INC" => "#{install_dir}/embedded/include/luajit-2.0",
            "LUAJIT_LIB" => "#{install_dir}/embedded/lib",
            "PERL_PATH"  => "#{install_dir}/embedded/bin/perl"
        )

        command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --sbin-path=#{install_dir}/embedded/sbin/nginx" \
          " --conf-path=#{install_dir}/embedded/etc/nginx/nginx.conf" \
          " --error-log-path=#{install_dir}/embedded/var/log/nginx/error.log" \
          " --http-log-path=#{install_dir}/embedded/var/log/nginx/access.log" \
          " --pid-path=#{install_dir}/embedded/var/run/nginx.pid" \
          " --lock-path=#{install_dir}/embedded/var/run/nginx.lock" \
          " --http-client-body-temp-path=#{install_dir}/embedded/var/cache/nginx/client_temp" \
          " --http-proxy-temp-path=#{install_dir}/embedded/var/cache/nginx/proxy_temp" \
          " --http-fastcgi-temp-path=#{install_dir}/embedded/var/cache/nginx/fastcgi_temp" \
          " --http-uwsgi-temp-path=#{install_dir}/embedded/var/cache/nginx/uwsgi_temp" \
          " --http-scgi-temp-path=#{install_dir}/embedded/var/cache/nginx/scgi_temp" \
          " --with-http_ssl_module" \
          " --with-http_spdy_module" \
          " --with-http_realip_module" \
          " --with-http_addition_module" \
          " --with-http_sub_module" \
          " --with-http_dav_module" \
          " --with-http_flv_module" \
          " --with-http_mp4_module" \
          " --with-http_gzip_static_module" \
          " --with-http_gunzip_module" \
          " --with-http_random_index_module" \
          " --with-http_secure_link_module" \
          " --with-http_stub_status_module" \
          " --with-mail" \
          " --with-mail_ssl_module" \
          " --with-file-aio" \
          " --with-ipv6" \
          # If you dont want debugging remove this flag
          " --with-debug" \
          " --with-http_perl_module" \
          " --with-http_image_filter_module" \
          " --with-http_geoip_module" \
          " --with-http_xslt_module" \
          " --add-module=#{install_dir}/embedded/share/nginx/headers-more-nginx-module" \
          " --add-module=#{install_dir}/embedded/share/nginx/lua-nginx-module" \
          " --add-module=#{install_dir}/embedded/share/nginx/ngx_devel_kit" \
          " --add-module=#{install_dir}/embedded/share/nginx/set-misc-nginx-module" \
          #Above configs are all standard NGINX Plus product configuration. Below is non Plus module for Single Signon technology support.
          " --add-module=#{install_dir}/embedded/share/nginx/nginx-http-shibboleth" \
          " --with-cc-opt=\"-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include -I#{install_dir}/embedded/include/libxml2\"" \
          " --with-ld-opt=\"-L#{install_dir}/embedded/lib -Wl,-rpath,#{install_dir}/embedded/lib\"", env: env

        make "-j #{workers}", env: env
        make "install", env: env

        # Ensure the logs directory is available on rebuild from git cache
        touch "#{install_dir}/embedded/logs/.gitkeep"
end
