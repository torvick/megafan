class ConnectAws

  def self.upload_image(args)
    object = service.object("#{args[:key]}.png")
    file = Base64.decode64(args[:file].split(',')[1])
    object.put(body: file, acl: 'public-read', content_type: 'image/jpeg', content_encoding: 'base64')
    s3.put_object_acl(bucket: ENV['S3_BUCKET'],key: "#{args[:key]}.png",acl: 'public-read')
    return object.public_url.to_s
  rescue Aws::S3::Errors::ServiceError
    return false
  end

  def self.s3
    @s3 ||= Aws::S3::Client.new(
      access_key_id: ENV['S3_KEY'],
      secret_access_key: ENV['S3_SECRET'],
      region: 'us-west-2'
    )
  end

  def self.service
    @service ||= Aws::S3::Resource.new(client: s3).bucket(ENV['S3_BUCKET'])
  end

end