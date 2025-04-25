# tag("h1", "Hello world")
# # => "<h1>Hello world</h1>"
# tag("span", "hey antonio")
# # => "<span>hey antonio</span>"

# tag("h1", "Hello world", { class: "bold" })
# # => <h1 class="bold">Hello world</h1>

# tag("a", "Le Wagon", { href: "http://lewagon.org", class: "btn" })
# # => <a href="http://lewagon.org" class="btn">Le Wagon</a>

def tag(name, content, attr = {})
  # make the attributes part
  if !attr.empty?
    formatted_attr = attr.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
    "<#{name} #{formatted_attr}>#{content}</#{name}>"
  else
    "<#{name}>#{content}</#{name}>"
  end
end

puts tag("h1", "Hello world")
puts tag("h1", "Hello world", { class: "bold" })
puts tag("a", "Le Wagon", href: "http://lewagon.org", class: "btn")
puts tag("a", "Le Wagon", href: "http://lewagon.org", class: "btn", id: "landing")
