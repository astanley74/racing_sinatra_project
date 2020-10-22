User.create(username: 'Rick Hendrick', password: '1234', team_name: "Hendrick Motorsporots", manufacturer: 'Chevorlet')
User.create(username: 'Roger Penske', password: '2122122', team_name: "Penske Racing", manufacturer: 'Ford')

Racecar.create(car_name: 'Napa Auto Parts Chevy', driver: 'Chase Elliott', number: '9', driver_bio: 'I drive for Rick Hendrick', user_id: '1')
Racecar.create(car_name: 'Menards Ford', driver: 'Ryan Blaney', number: '12', driver_bio: 'I drive for Roger Penske', user_id: '2')
