require 'pry-byebug'
require "json"
require "rest-client"



response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.283581,149.101273&radius=5000&types=establishment&name=child+care+centre&key=#{ENV['Google_api']}"

repos = JSON.parse(response)

File.write('app/assets/json_files/1.json', JSON.dump(repos))


file = File.read "app/assets/json_files/1.json"

hash = JSON.parse(file)

hash["results"]
