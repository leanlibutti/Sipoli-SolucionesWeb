json.array!(@earns) do |earn|
  json.extract! earn, :id, :fech_ing, :fech_egr, :valor
  json.url earn_url(earn, format: :json)
end
