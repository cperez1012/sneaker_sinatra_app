#this is where I will create seed data to test my associations and app functionality
christian = User.create(email: "christian@gmail.com", image_url: "", bio: "I love Air Jordans", password: "christian", username: "christian")

# gary = User.create(email: "gary@gmail.com", image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdnext.credit-suisse.com%2Fcareers%2Fen%2Four-people%2F_jcr_content%2Fcontent%2Fpagetabscontainer%2Ftabs%2Fpagetab%2FtabContent%2Fflexiblelist%2FflexibleListItems%2Fflexiblelistitem%2Fimage.revampimg.656.high.png%2Four-people-preview-raffaele.png&imgrefurl=https%3A%2F%2Fwww.credit-suisse.com%2Fcareers%2Fen%2Four-people.html&docid=ZFia45OZ7L6AnM&tbnid=I5BdVXrKQJlFlM%3A&vet=10ahUKEwit1M7pndfmAhWBMd8KHXlQBBYQMwiHASgSMBI..i&w=656&h=369&bih=670&biw=727&q=picture%20people&ved=0ahUKEwit1M7pndfmAhWBMd8KHXlQBBYQMwiHASgSMBI&iact=mrc&uact=8", bio: "I love Nike", password: "gary" username: "gary")
#
# sam = User.create(email: "sam@gmail.com", image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdnext.credit-suisse.com%2Fcareers%2Fen%2Four-people%2F_jcr_content%2Fcontent%2Fpagetabscontainer%2Ftabs%2Fpagetab%2FtabContent%2Fflexiblelist%2FflexibleListItems%2Fflexiblelistitem%2Fimage.revampimg.656.high.png%2Four-people-preview-raffaele.png&imgrefurl=https%3A%2F%2Fwww.credit-suisse.com%2Fcareers%2Fen%2Four-people.html&docid=ZFia45OZ7L6AnM&tbnid=I5BdVXrKQJlFlM%3A&vet=10ahUKEwit1M7pndfmAhWBMd8KHXlQBBYQMwiHASgSMBI..i&w=656&h=369&bih=670&biw=727&q=picture%20people&ved=0ahUKEwit1M7pndfmAhWBMd8KHXlQBBYQMwiHASgSMBI&iact=mrc&uact=8", bio: "I love Puma", password: "sam", username: "sam")

Sneaker.create(name: "Air Jordan 1", image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fstockx-360.imgix.net%2FAir-Jordan-1-Retro-High-Bred-Toe%2FImages%2FAir-Jordan-1-Retro-High-Bred-Toe%2FLv2%2Fimg01.jpg%3Fauto%3Dformat%2Ccompress%26w%3D559%26q%3D90%26dpr%3D2%26updated_at%3D1538080256&imgrefurl=https%3A%2F%2Fstockx.com%2Fair-jordan-1-retro-high-bred-toe&docid=_k_timCEW5cp1M&tbnid=gIyr7_KPe5ajeM%3A&vet=10ahUKEwj2puOan9fmAhVqU98KHdPBDMYQMwiBAigAMAA..i&w=1118&h=745&bih=670&biw=727&q=air%20jordan%201&ved=0ahUKEwj2puOan9fmAhVqU98KHdPBDMYQMwiBAigAMAA&iact=mrc&uact=8", description: "2018 Jordan 1 Retro High Bred Toe", category: "Basketball", user_id: christian.id)

Sneaker.create(name: "Nike Air Max 90", image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.endclothing.com%2Fmedia%2Fcatalog%2Fproduct%2F1%2F9%2F19-06-2019_nike_airmax90essential_white_537384-111_blr_1.jpg&imgrefurl=https%3A%2F%2Fwww.endclothing.com%2Fus%2Fnike-air-max-90-essential-537384-111.html&docid=rmYQ37v89lvyHM&tbnid=tOxaQVEVmC4mlM%3A&vet=10ahUKEwj7iYn0n9fmAhUwneAKHXGDDrUQMwiNAigAMAA..i&w=1000&h=1000&bih=670&biw=727&q=nike%20air%20max%2090&ved=0ahUKEwj7iYn0n9fmAhUwneAKHXGDDrUQMwiNAigAMAA&iact=mrc&uact=8", description: "Nike Air Max 90 - White", category: "Training", user_id: christian.id)

Sneaker.create(name: "Puma Suede Classic", image_url: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwip0P_SoNfmAhXuYt8KHZIUC3AQjRx6BAgBEAQ&url=https%3A%2F%2Fus.puma.com%2Fen%2Fus%2Fpd%2Fsuede-classic%252B-sneakers%2F352634.html&psig=AOvVaw1vUDnyQuAv8wJVXSvLtvSX&ust=1577585109190049", description: "Puma Suede Classic - Black", category: "Lifestyle", user_id: christian.id)
