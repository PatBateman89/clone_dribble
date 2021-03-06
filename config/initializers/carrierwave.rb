require 'fog/aws'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'                                # required
    # production
      config.fog_credentials = {
        provider:              'AWS',                            # required
        aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],                 # required
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],             # required
        region:                ENV["S3_REGION"],                 # optional, defaults to 'us-east-1'
        # host:                  's3.example.com',               # optional, defaults to nil
        # endpoint:              'https://s3.example.com:8080'   # optional, defaults to nil
      }
      config.fog_directory  = ENV["S3_BUCKET_NAME"]              # required
      config.fog_public     = false                              # optional, defaults to true
      # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
      config.fog_authenticated_url_expiration = 2.minute
    else
      config.root = "#{Rails.root}/uploads"
  end
end
