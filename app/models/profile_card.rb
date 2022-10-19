class ProfileCard < ApplicationRecord
  require 'net/http'
  require 'json'

  belongs_to :user, optional: true
  belongs_to :breed, optional: true

  mount_uploader :pad_image, PadImageUploader
  mount_uploader :face_image, FaceImageUploader

  enum personality: { typeA: 1, typeB: 2, typeC: 3, typeD: 4, typeE: 5 }

  def user_id_setting(id)
    self.user_id = id
    self.save
  end

  def image_recognition(file,kind)
    binding.b
    if kind == "1"
      self.dog_image_recognition(file)
    else
      self.cat_image_recoginition(file)
    end
  end

  def dog_image_recognition(file)
    uri = URI('https://productdogpad-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/1e6387fe-c18f-4bf5-b3d8-321ba0526d81/classify/iterations/product_dog_classification/url')
    uri.query = URI.encode_www_form({
        # Request parameters
        'application' => '{string}'
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Prediction-key'] = '9ca9a8130da44fa5bb21339c2cb704c1'
    # Request body
    request.body = "{Url: '#{file}'}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    result = response.body
    JSON.parse(result)["predictions"][0]["tagName"]
  end

  def cat_image_recoginition(file)
    uri = URI('https://productcatpad-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/a5313cec-758a-4928-9813-b6f3d1c15765/classify/iterations/product_cat_classification/url')
    uri.query = URI.encode_www_form({
        # Request parameters
        'application' => '{string}'
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Prediction-key'] = 'a5974b9f15854ad284650cff9b52f13b'
    # Request body
    request.body = "{Url: '#{file}'}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end

    result = response.body
    JSON.parse(result)["predictions"][0]["tagName"]
  end

end
