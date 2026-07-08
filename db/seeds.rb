Product.destroy_all

[
  ["Trailhead Backpack", 12, "<p>A rugged 30L pack for day hikes.</p>"],
  ["Thermos Flask",       8, "<p>Keeps drinks hot for 12 hours.</p>"],
  ["Camp Stove",          5, "<p>Compact single-burner stove.</p>"],
  ["Headlamp",            0, "<p>300-lumen rechargeable headlamp.</p>"],   # OUT OF STOCK
  ["Trekking Poles",      3, "<p>Collapsible carbon poles, pair.</p>"],
  ["Sleeping Bag",        0, "<p>Three-season down bag.</p>"],             # OUT OF STOCK
].each do |name, count, desc|
  Product.create!(name: name, inventory_count: count, description: desc)
end

puts "Seeded #{Product.count} products (#{Product.where(inventory_count: 0).count} out of stock)."
