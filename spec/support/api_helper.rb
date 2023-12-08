# frozen_string_literal: true

module ApiHelper
  def parsed_response
    JSON.parse(response.body, symbolize_names: true)
  end
end

RSpec.configure do |config|
  config.include ApiHelper, type: :controller
end
