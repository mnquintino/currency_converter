require 'csv'

csv_file = File.read(Rails.root.join('lib', 'seeds', 'currencies.csv'))
currencies = CSV.parse(csv_file, :headers => true, :encoding => 'ISO-8859-1')

currencies.each do |row|
  c = Currency.new
  c.id = row['id']
  c.name = row["name"]
  c.initials = row["initials"]
  c.save!
end