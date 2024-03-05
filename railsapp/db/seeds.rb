# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
article1 = Article.find_or_create_by(name: "TUFS", url: "https://www.tufs.ac.jp/")
article2 = Article.find_or_create_by(name: "Qiita", url: "https://qiita.com/")
article3 = Article.find_or_create_by(name: "Zenn", url: "https://zenn.dev/")

categories = Category.create([{ name: "school" }, { name: "dev" }, { name: "favorite" }])

article1.categories << categories[0]
article2.categories << categories[1]
article2.categories << categories[2]
article3.categories << categories[1]
article3.categories << categories[2]
