json.array!(@reports) do |report|
  json.extract! report, 
  json.url report_url(report, format: :json)
end