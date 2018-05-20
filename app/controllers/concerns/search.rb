# class Hello
#     include HTTParty
#     attr_accessor :location
    
#         base_uri 'https://api.yelp.com/v3/businesses/search?'
        
#         def initialize(location)
#             @location = { restaurant: location } 
#         end

#         def location
#             self.class.get("categories=restaurants&location=10038", @location)
#         end

#     end

#   hi = Hello.new(10038)
#   puts location.name