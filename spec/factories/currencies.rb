FactoryBot.define do
  factory :currency do
    initials { 'BRL'}
    name { 'Real' }
  
    initials { 'USD'}
    name { 'Dólar Americano' }
  end
end