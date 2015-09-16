#
# Copyright 2012-2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "libgd"
default_version "2.1.1"

dependency "libiconv"
dependency "zlib"
dependency "libjpeg"
dependency "libpng"

# TODO: make sure that this is where we want to download libgd from
source url: "http://fossies.org/linux/www/#{name}-#{version}.tar.gz",
       md5: "914f27f31ceb46827a322a1bc5165aff"

relative_path "libgd-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path).merge(
    "LIBS" => "-liconv",
  )

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --with-libiconv-prefix=#{install_dir}/embedded" \
          " --with-jpeg=#{install_dir}/embedded" \
          " --with-png=#{install_dir}/embedded" \
          " --without-x" \
          " --without-freetype" \
          " --without-fontconfig" \
          " --without-xpm", env: env

  make "-j #{workers}", env: env
  make "install", env: env
end
