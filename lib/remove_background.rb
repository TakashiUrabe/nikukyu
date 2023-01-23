module RemoveBackground
  require 'httpclient'

  def remove_background(file)
    client = HTTPClient.new default_header: {
      "Authorization" => "Basic MTUzNTI6Z2Jnb3E3N284OTViZzduaTlzdWhtOXR0ZmlzbHZzMWFvcG8wY3NrYWx1NXFxYmNqZ210bw=="
    }

    response = client.post("https://ja.clippingmagic.com/api/v1/images", {
      "image.url" => file, # TODO: Replace with your image URL
      "format" => "result",
      "test" => "true" # TODO: Remove for production
      # TODO: Add more upload parameters here
    })

    if response.status == 200 then
      # TODO: Store these if you want to be able to use the Smart Editor
      image_id = response.header["x-amz-meta-id"][0]
      image_secret = response.header["x-amz-meta-secret"][0]

      puts "Id: " + image_id.to_s
      puts "Secret: " + image_secret.to_s

      # Write result to disk, TODO: or wherever you'd like
      File.open("./app/assets/images/remove_bg.png", 'wb') { |file| file.write(response.body) }
    else
      puts "Error: Code: " + response.status.to_s + ", Reason: " + response.reason
    end
  end
end