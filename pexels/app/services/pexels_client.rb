class PexelsClient
  include HTTParty
  base_uri "https://api.pexels.com/v1"

  def initialize
    @api_key = Rails.application.credentials.dig(:pexels, :api_key)
  end

  def collection_media(collection_id)
    options = {
      headers: { "Authorization" => @api_key }
    }

    response = self.class.get("/collections/#{collection_id}", options)
    if response.code == 200
      response.parsed_response["media"]
    else
      []
    end
  end
end
