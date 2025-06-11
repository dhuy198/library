
# Tạo danh sách tác giả
authors = Author.create!([
  { name: "Robert C. Martin" },
  { name: "Andy Hunt" },
  { name: "David Thomas" },
  { name: "Martin Fowler" }
])

# Tạo danh sách thể loại
genres = Genre.create!([
  { name: "Software Engineering" },
  { name: "Programming" },
  { name: "Agile" }
])

# Tạo sách và liên kết với tác giả & thể loại
Book.create!([
  {
    title: "Clean Code",
    subtitle: "A Handbook of Agile Software Craftsmanship",
    image: "https://example.com/clean_code.jpg",
    publishing_year: 2008,
    quantity_in_stock: 10,
    description: "Cuốn sách dạy cách viết mã sạch.",
    author: authors[0],
    genre: genres[0]
  },
  {
    title: "The Pragmatic Programmer",
    subtitle: "Your Journey to Mastery",
    image: "https://example.com/pragmatic_programmer.jpg",
    publishing_year: 1999,
    quantity_in_stock: 7,
    description: "Hướng dẫn lập trình thực tiễn.",
    author: authors[1],
    genre: genres[1]
  },
  {
    title: "Refactoring",
    subtitle: "Improving the Design of Existing Code",
    image: "https://example.com/refactoring.jpg",
    publishing_year: 1999,
    quantity_in_stock: 5,
    description: "Cẩm nang về cải tiến mã nguồn.",
    author: authors[3],
    genre: genres[2]
  }
])
