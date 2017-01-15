
#categories = ["Art & Photography", "Audio Books", "Biography", "Business,
#              Finance & Law", "Children's Books", "Computing",
#              "Crafts and Hobbies", "Crime & Thriller", "Dictionaries & Languages",
#              "Entertainment", "Fiction", "Food & Drink",
#              "Graphic Novels, Anime & Manga", "Health", "History & Archaeology",
#              "Home & Garden", "Humour", "Medical", "Mind, Body & Spirit",
#              "Natural History", "Personal Development", "Poetry & Drama",
#              "Reference", "Religion", "Romance", "Science & Geography",
#              "Science Fiction, Fantasy & Horror", "Society & Social Sciences",
#              "Sport", "Stationery", "Teaching Resources & Education",
#              "Technology & Engineering", "Transport",
#              "Travel & Holiday Guides"]

categories = [
  "Computing", "Entertainment", "Fiction", "Technology & Engineering",
]

Category.create(categories.map { |category_name| { name: category_name }}) unless Category.count > 0

unless Author.count > 0
  authors = []
  1.upto(3) do |_|
    authors << { name: Faker::Book.author }
  end
  Author.create authors
end

unless Book.count > 0
  category_count = Category.count
  author_count = Author.count
  books = []
  1.upto(10) do |_|
    category_id = rand(1..category_count)
    author_id = rand(1..author_count)
    isbn = Faker::Code.isbn
    image = RubyIdenticon.create_base64(isbn)
    books << {
      name: Faker::Book.title,
      isbn: isbn,
      category_id: category_id,
      author_id: author_id,
      cover: image,
      price: Faker::Commerce.price
    }
  end
  Book.create books
end
