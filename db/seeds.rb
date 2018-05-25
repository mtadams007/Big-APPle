User.create(email: "sample@test.com", password: "test123", first_name: "Steve", last_name: "Rogers")

User.create(email: "test@test.com", password: "test123", first_name: "Bruce", last_name: "Wayne")

Schedule.create(created_at: '2018-05-24 15:40:13.418834', updated_at: '2018-05-24 15:40:13.418834', user_id: 1)

Activity.create(time_slot: 'Morning', schedule_id: 1, rating: 4.0, business_identity:'O1gHEYYSCULCcfJD9sLJqw', image_url: 'https://s3-media2.fl.yelpcdn.com/bphoto/OuHzHbajbwY5wpr0txLHVA/o.jpg', name: 'American Museum of Natural History', title: 'Museums', url: 'https://www.yelp.com/biz/american-museum-of-natural-history-new-york?adjust_creative=bmL3Q1He69WPtOUQBfAxLQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=bmL3Q1He69WPtOUQBfAxLQ', address: 'Central Park West 79th St New York, NY 10024', phone: '(212) 769-5100', latitude: 40.7812401294975, longitude: -73.9740586283456)

Activity.create(time_slot: 'Lunch', schedule_id: 1, business_identity: 'xt4sa64WOrpJvZBDPNPNYg', image_url: 'https://s3-media4.fl.yelpcdn.com/bphoto/gAPSgXM0l_YTh3nrCi_-fg/o.jpg', name: "Jacob's Pickles", title: "Comfort Food", rating: 4.0, url: 'https://www.yelp.com/biz/jacobs-pickles-new-york?adjust_creative=bmL3Q1He69WPtOUQBfAxLQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=bmL3Q1He69WPtOUQBfAxLQ', address: '509 Amsterdam Ave New York, NY 10024', phone: '(212) 470-5566', latitude: 40.7866504411994, longitude: -73.9755284786224)

Activity.create(time_slot: "Afternoon", schedule_id: 1, business_identity: 'EgqhJ0SZCpOikta4eYiAJg', image_url: 'https://s3-media4.fl.yelpcdn.com/bphoto/dEqL9st4GOg1Z4-SqvkxnA/o.jpg', name: 'New-York Historical Society', title: 'Libraries', rating: 4.0, url: 'https://www.yelp.com/biz/new-york-historical-society-new-york-2?adjust_creative=bmL3Q1He69WPtOUQBfAxLQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=bmL3Q1He69WPtOUQBfAxLQ', address: '170 Central Park W New York, NY 10024', phone: '(212) 873-3400', latitude: 40.7793496073291, longitude: -73.9741165394002)


Activity.create(time_slot: 'Dinner', schedule_id: 1, business_identity: 'rJJiGJx3kfMAxtD7P7okHQ', image_url: 'https://s3-media3.fl.yelpcdn.com/bphoto/oKc6X6XyN41PeP6Wjz0xyQ/o.jpg', name: 'Celeste', title: "Italian", rating: 3.5, url: 'https://www.yelp.com/biz/celeste-new-york?adjust_creative=bmL3Q1He69WPtOUQBfAxLQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=bmL3Q1He69WPtOUQBfAxLQ', address: '502 Amsterdam Ave New York, NY 10024', phone: '(212) 874-4559', latitude: 40.78666, longitude: -73.97599)
