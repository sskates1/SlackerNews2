

# gets the root URL
def strip_url(url)
    url.match(/\/\/[a-zA-Z0-9\-\.]+/)[0].gsub(/\/\//, "")
end

#gets api object
def get_api(url)
  response = Net::HTTP.get_response(URI.parse(url))
  JSON.parse(response.body)
end






