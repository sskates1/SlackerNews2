require 'csv'

# gets the root URL
def strip_url(url)
  if url.match(/\/\/[a-zA-Z0-9\-\.]+/) != nil
    url.match(/\/\/[a-zA-Z0-9\-\.]+/)[0].gsub(/\/\//, "")
  else
    url
  end
end

#gets api object
def get_api(url)
  response = Net::HTTP.get_response(URI.parse(url))
  JSON.parse(response.body)
end

def read_csv(file)
  submissions ={}
  submissions["items"] =[]
  CSV.foreach(file, headers: true) do |row|
    submissions["items"] << row
  end
  submissions
end





