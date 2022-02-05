# frozen_string_literal: true

module ApiHelper
  def body
    JSON.parse(response.body)
  end
end
