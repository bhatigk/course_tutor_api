module ApiHelpers
  def json_data
    JSON.parse(response.body)["data"]
  end
end
