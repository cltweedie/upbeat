# encoding: utf-8

class AudioAwsUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :aws
      # storage :fog

      def initialize(*)
        super

        self.aws_bucket = 'upbeat-sounds'
        self.aws_acl    = 'public-read'

        # Optionally define an asset host for selfurations that are fronted by a
        # content host, such as CloudFront.
        self.asset_host = 'http://example.com'

        # The maximum period for authenticated_urls is only 7 days.
        self.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

        # Set custom options such as cache control to leverage browser caching
        self.aws_attributes = {
          expires: 1.week.from_now.httpdate,
          cache_control: 'max-age=604800'
        }

        self.aws_credentials = {
          access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
          secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
          region:            'eu-west-1' # Required
        }

        # Optional: Signing of download urls, e.g. for serving private
        # content through CloudFront.
        self.aws_signer = -> (unsigned_url, options) { Aws::CF::Signer.sign_url unsigned_url, options }
      end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/sound"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
