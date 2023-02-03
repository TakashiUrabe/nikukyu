module RemoveBackground
  require 'httpclient'

  def remove_background(file)
    client = HTTPClient.new default_header: {
      "Authorization" => "#{ENV['clipping_magic_basic']}"
    }

    response = client.post("https://ja.clippingmagic.com/api/v1/images", {
      "image.url" => file,
      "format" => "result"
    })

    if response.status == 200 then
      image_id = response.header["x-amz-meta-id"][0]
      image_secret = response.header["x-amz-meta-secret"][0]

      puts "Id: " + image_id.to_s
      puts "Secret: " + image_secret.to_s

      File.open("./app/assets/images/remove_bg.png", 'wb') { |file| file.write(response.body) }
    else
      puts "Error: Code: " + response.status.to_s + ", Reason: " + response.reason
    end
  end
end
