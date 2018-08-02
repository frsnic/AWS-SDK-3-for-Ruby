require 'aws-sdk'
Aws.config.update({
  :access_key_id => "*****",
  :secret_access_key => "*****",
  :region => "*****",
  :endpoint => "*****",
})

s3 = Aws::S3::Client.new
resp = s3.list_objects(bucket: '*****', max_keys: 2)
resp.contents.each do |object|
  puts "#{object.key} => #{object.etag}"
end

File.open('filename', 'wb') do |file|
  reap = s3.get_object({ bucket: '*****', key: '*****' }, target: file)
end
