# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    initials { }
    name { }
  end

  trait :brl do
    initials { 'BRL' }
    name { 'Real' }
  end

  trait :usd do
    initials { 'USD' }
    name { 'Dólar Americano' }
  end
end