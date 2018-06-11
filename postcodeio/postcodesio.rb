require 'httparty'
require 'json'

class Postcodes
    include HTTParty

    attr_accessor :single_postcode_results, :multi_postcodes_results

    base_uri 'https://api.postcodes.io'

    def get_single_postcode(postcode)
        @single_postcode_results = self.class.get("/postcodes/#{postcode}").body
    end
    def get_multi_postcodes(postcodeArray)
        @multi_postcodes_results = self.class.post("/postcodes/", body: {'postcodes': postcodeArray}).body
        @multi_postcodes_results = JSON.parse(@multi_postcodes_results)
    end
end

t = Postcodes.new
# t.get_single_postcode("W93UL")
# p t.single_postcode_results

p t.get_multi_postcodes(["W93UL", "W25EN", "W10"])



