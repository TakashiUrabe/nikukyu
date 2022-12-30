module ImageRecognition
  require 'net/http'
  require 'uri'
  require 'json'

  def image_recognition(file, kind)
    hash_dog = { 'uri': 'https://productdogpad-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/1e6387fe-c18f-4bf5-b3d8-321ba0526d81/classify/iterations/product_dog_classification/url', 'prediction': '9ca9a8130da44fa5bb21339c2cb704c1' }
    hash_cat = { 'uri': 'https://productcatpad-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/a5313cec-758a-4928-9813-b6f3d1c15765/classify/iterations/product_cat_classification2/url', 'prediction': 'a5974b9f15854ad284650cff9b52f13b' }
    self.personality = if kind == '1'
                        custom_image_recognition(file,hash_dog)
                      else
                        custom_image_recognition(file,hash_cat)
                      end
    save
  end

  def custom_image_recognition(file,hash)
    uri = URI(hash[:uri])
    uri.query = URI.encode_www_form({
                                      # Request parameters
                                      'application' => '{string}'
                                    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Prediction-key'] = hash[:prediction]
    # Request body
    request.body = "{Url: '#{file}'}"

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    result = response.body
    JSON.parse(result)['predictions'][0]['tagName']
  end
end
