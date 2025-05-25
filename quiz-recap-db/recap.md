```sql
SELECT * FROM books WHERE publishing_year < 1985;
```

```sql
SELECT * FROM books JOIN authors ON books.author_id = authors.id
WHERE authors.name = 'Jules Verne' ORDER BY books.publishing_year DESC LIMIT 3;
```

```ruby
class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
  end
end
```

```ruby
class CreateBooks < ActiveRecord::Migration[7.0]
 def change
    create_table :books do |t|
      t.string :title
      t.integer :publishing_year
      t.references :author, foreign_key: true

      t.timestamps
    end
 end
end
```

```ruby
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end
  end
end
```

```ruby
class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
```

```ruby
class AddCategoryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :category, :string
  end
end
```

```ruby
class Author
  has_many :books
end

class Book
  belongs_to :author
  has_many :readings
  has_many :users, through: :readings
end

class User
  has_many :readings
  has_many :books, through: :readings
end

class Reading
  belongs_to :user
  belongs_to :book
end
```

```ruby
#1. Add your favorite author to the DB
Author.create(name: 'Antonio')

#2. Get all authors
Author.all

#3. Get author with id=8
Author.find(8)

#4. Get author with name="Jules Verne", store it in a variable: jules
jules = Author.find_by(name: 'Jules Verne')
jules = Author.find_by_name('Jules Verne')

#5. Get all Jules Verne's books
Book.where(author_id: jules.id)
jules.books

#6. Create a new book "20000 Leagues under the Seas". Store it in a variable: twenty_thousand
twenty_thousand = Book.new(title: '20000 Leagues under the Seas', publishing_year: 1869, category: 'Sci-Fi')

#7. Add Jules Verne as this book's author
twenty_thousand.author = jules

#8. Now save this book in the DB!
twenty_thousand.save!
twenty_thousand.save

# Difference between save! or save is save! raises an error if it fails to save
# .save just returns `false` when it fails to save
```

```ruby

class Author
  validates :name, uniqueness: true
end

```
