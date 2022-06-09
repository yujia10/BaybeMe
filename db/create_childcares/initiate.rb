require 'pry-byebug'
require "json"
require "rest-client"


CHILDCARE_INDEX = "app/assets/json_files/childcare_index.json"

def create_childcares_index_file
  response = RestClient.get  "https://maps.googleapis.com/maps/api/place/nearbysearch/json"\
  "?location=-33.283581,149.101273"\
  "&radius=5000"\
  "&types=establishment"\
  "&name=child+care+centre"\
  "&key=AIzaSyBSRAcvG8WZfaVpDmbkfpBMHXxf9KhZocw"
  repos = JSON.parse(response)
  File.write(CHILDCARE_INDEX, JSON.dump(repos))
end



def create_childcares_ids
  Childcare.destroy_all
  OpeningHour.destroy_all
  Review.destroy_all
  file = File.read CHILDCARE_INDEX
  hash = JSON.parse(file)
  hash["results"].each_with_index do |daycare, daycare_number|
    daycare_number = Childcare.create!(place_id: daycare["place_id"])
  end

end

def create_childcares_data
  Childcare.all.each do |childcare|
    response = RestClient.get  "https://maps.googleapis.com/maps/api/place/details/json"\
    "?place_id=#{childcare[:place_id]}"\
    "&fields=name,"\
    "formatted_address,"\
    "geometry/location,"\
    "photos,"\
    "url,"\
    "opening_hours,"\
    "website,"\
    "rating,"\
    "price_level,"\
    "rating,"\
    "reviews,"\
    "formatted_phone_number"\
    "&key=#{ENV['GOOGLE_KEY']}"
  repos = JSON.parse(response)
  File.write("app/assets/json_files/Orange_childcares/#{childcare[:id]}_data.json", JSON.dump(repos))
  end
end


def insert_childcare_information
  Childcare.all.each_with_index do |childcare, index|
    file = File.read "app/assets/json_files/Orange_childcares/#{index+4}_data.json"
    hash = JSON.parse(file)
    temp = hash["result"]['name'] || nil
    temp.slice!"Nurture One"
    temp.strip
    childcare[:name] = temp  || nil
    temp = hash["result"]['formatted_address']  || nil
    temp.slice!", Australia"
    childcare[:address] = temp
    childcare[:email] = hash["result"]['email'] || nil
    childcare[:url] = hash["result"]['website']  if  hash["result"]['website']
    opening_hours(hash, childcare, index)
    creating_reviews(hash, childcare, index)
    childcare[:rating] = hash["result"]["rating"]  || nil
    save_photos(hash["result"], childcare)
    childcare.save!
  end
end

def opening_hours(hash, childcare, index)
  if  hash["result"].key?('opening_hours')

    hash["result"]['opening_hours']['weekday_text'].each do |hours|
      unless hours.nil?
        day = OpeningHour.new(time: hours)
        day.childcare = childcare
        day.save!
      end
    end
  end
end

def creating_reviews(hash, childcare, index)

  if  hash["result"].key?('reviews')
    hash["result"]['reviews'].each do |review|
      unless review["text"].nil?
        person = Review.new(description: review["text"])
        person.childcare = childcare
        person.save!
      end
    end
  end
end


def save_photos(hash, childcare)

  hash['photos']&.each do |element|
    # element['photo_reference']
    # photo = Down.download"https://maps.googleapis.com/maps/api/place/photo"\
    # "?maxwidth=500"\
    # "&photo_reference=#{element['photo_reference']}"\
    # "&key=#{ENV['GOOGLE_KEY']}"
    # FileUtils.mv(photo.path, "./1123.png")

    file2 = URI.open("https://maps.googleapis.com/maps/api/place/photo"\
      "?maxwidth=500"\
      "&photo_reference=#{element['photo_reference']}"\
      "&key=#{ENV['GOOGLE_KEY']}")
    childcare.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
  end
end
