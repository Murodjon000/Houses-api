class Api::V1::DirectUploadController < ApiController
  skip_before_action :set_default_format
  skip_before_action :authenticate_user!

  def create
    response = generate_direct_upload(blob_params)
    render json: response
  end

  private
  def blob_params
    params.require(:file).permit(:filename, :byte_size, :checksum, :content_type, metadata: {})
  end

  def generate_direct_upload(blob_args)
    blob = create_blob(blob_args)
    response = signed_url(blob)
    response[:blob_signed_id] = blob.signed_id
    response
  end

  def create_blob(blob_args)
    blob = ActiveStorage::Blob.create_before_direct_upload!(blob_args.to_h.deep_symbolize_keys)
    image_id = SecureRandom.uuid
    blob.update_attribute(:key, "uploads/#{image_id}")
    blob
  end

  def signed_url(blob)
    expiration_time = 30.minutes
    response_signature(
      blob.service_url_for_direct_upload(expires_in: expiration_time),
      headers: blob.service_headers_for_direct_upload
    )
  end

  def response_signature(url, **params)
    {
      direct_upload: {
        url: url
      }.merge(params)
    }
  end

end