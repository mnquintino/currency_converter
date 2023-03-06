# frozen_string_literal: true

require 'csv'

csv_file = File.read(Rails.root.join('lib', 'seeds', 'currencies.csv'))
currencies = CSV.parse(csv_file, headers: true, encoding: 'UTF-8')

currencies.each do |row|
  c = Currency.new
  c.name = row['name']
  c.initials = row['initials']
  c.save!
end
