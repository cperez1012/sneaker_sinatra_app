#this is where I will create seed data to test my associations and app functionality
christian = User.create(username: "christian", email: "christian@gmail.com", bio: "I love Air Jordans", password: "christian")

Sneaker.create(name: "Air Jordan 1", image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fstockx-360.imgix.net%2FAir-Jordan-1-Retro-High-Bred-Toe%2FImages%2FAir-Jordan-1-Retro-High-Bred-Toe%2FLv2%2Fimg01.jpg%3Fauto%3Dformat%2Ccompress%26w%3D559%26q%3D90%26dpr%3D2%26updated_at%3D1538080256&imgrefurl=https%3A%2F%2Fstockx.com%2Fair-jordan-1-retro-high-bred-toe&docid=_k_timCEW5cp1M&tbnid=gIyr7_KPe5ajeM%3A&vet=10ahUKEwj2puOan9fmAhVqU98KHdPBDMYQMwiBAigAMAA..i&w=1118&h=745&bih=670&biw=727&q=air%20jordan%201&ved=0ahUKEwj2puOan9fmAhVqU98KHdPBDMYQMwiBAigAMAA&iact=mrc&uact=8", description: "2018 Jordan 1 Retro High Bred Toe", category: "Basketball", user_id: christian.id)

Sneaker.create(name: "Nike Air Max 90", image_url: "https://www.google.com/aclk?sa=l&ai=DChcSEwjW3YGniLbnAhWLn7MKHRO1CEwYABABGgJxbg&sig=AOD64_1cAK4dM4MvlgXDMUroSaCyEmZA5w&adurl&ctype=5&ved=2ahUKEwjzjfGmiLbnAhXnVd8KHYrdDeoQvhd6BAgBECs", description: "Nike Air Max 90 - White", category: "Training", user_id: christian.id)

Sneaker.create(name: "Puma Suede Classic", image_url: "http://t0.gstatic.com/images?q=tbn%3AANd9GcRVSthxxXyd00mWzWNKa1sNjEU_Dt3uGp4yswfvi0j29MSsE06eraVDnN0ZVAibLP833GfbYQ&usqp=CAc", description: "Puma Suede Classic - Black", category: "Lifestyle", user_id: christian.id)
