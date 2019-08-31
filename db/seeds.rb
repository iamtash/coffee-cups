starbucks = Roaster.create(name: 'Starbucks', location: 'Seattle')
illy = Roaster.create(name: 'illy', location: 'Italy')
peets = Roaster.create(name: 'Peets Coffee', location: 'San Francisco')
philz = Roaster.create(name: 'Philz Coffee', location: 'San Francisco')
stumptown = Roaster.create(name: 'Stumptown', location: 'Portland')

pike_place = Coffee.create(name: 'Pike Place', roast: 'Dark', roaster: starbucks)
big_bang = Coffee.create(name: 'Big Bang', roast: 'Medium', roaster: peets)
silken_splendor = Coffee.create(name: 'Silken Splendor', roast: 'Medium', roaster: philz)
philharmonic = Coffee.create(name: 'Philharmonic', roast: 'Medium', roaster: philz)

natasha = User.create(first_name: 'Natasha', last_name: 'Chernis', email: 'natasha@email.com', password: 'password')
jessica = User.create(first_name: 'Jessica', last_name: 'Felix', email: 'jessica@email.com', password: 'password')
leeya = User.create(first_name: 'Leeya', last_name: 'Davis', email: 'leeya@email.com', password: 'password')
tiff = User.create(first_name: 'Tiffany', last_name: 'Wei', email: 'tiff@email.com', password: 'password')

cup1 = natasha.cups.build(brew: 'Cold brew', coffee: pike_place)
cup2 = jessica.cups.build(brew: 'Latte', coffee: big_bang)
cup3 = leeya.cups.build(brew: 'Iced coffee', coffee: silken_splendor)
cup4 = tiff.cups.build(brew: 'Americano', coffee: philharmonic)

cup1.save
cup2.save
cup3.save
cup4.save