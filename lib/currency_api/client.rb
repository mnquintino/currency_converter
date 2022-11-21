module CurrencyApi
  class Client

    include HTTParty

    base_uri 'https://free.currconv.com/api/v7/convert?'

    def request(query)
      self.class.get("q=#{query}&compact=ultra&apiKey=#{credentials}")
    end

    private

    def credentials
      Rails.application.credentials.currency_api.api_key
    end
  end
end
