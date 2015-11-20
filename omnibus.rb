MYUSERNAME = ENV['LOGNAME']

if MYUSERNAME == 'cartodb'
  base_dir ENV['OMNIBUS_BASE_DIR'] || '/var/omnibus'
elsif MYUSERNAME == 'jenkins'
  base_dir ENV['OMNIBUS_BASE_DIR'] || '/var/lib/jenkins/userContent/omnibus'
else
  base_dir      './local/omnibus'
  cache_dir     './local/omnibus/cache'
  git_cache_dir './local/omnibus/cache/git_cache'
  source_dir    './local/omnibus/src'
  build_dir     './local/omnibus/build'
  package_dir   './local/omnibus/pkg'
end

if !ENV['S3_ACCESS_KEY'].nil? && !ENV['S3_SECRET_KEY'].nil? && !ENV['S3_BUCKET'].nil?
  use_s3_caching true
  s3_access_key  ENV['S3_ACCESS_KEY']
  s3_secret_key  ENV['S3_SECRET_KEY']
  s3_bucket      ENV['S3_BUCKET']
end

software_gems ['omnibus-software']

build_retries 3
