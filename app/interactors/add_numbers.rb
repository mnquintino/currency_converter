# frozen_string_literal: true

class AddNumbers
  include Interactor

  def call
    context.sum = context.a + context.b
  rescue StandardError => e
    context.fail!(error: e.message)
  end
end

# exemplo https://blog.saeloun.com/2020/05/06/rails-using-interactor-gem.html
# aqui funciona, comecei a testar como enviar os parametros sem o 'requires' que é usado no app da Qulture é um método criado por eles.

# result = AddNumbers.call(a: 1, b: "abcd")

# puts result.failure?
# => true

# puts result.error
# => String can't be coerced into Integer
