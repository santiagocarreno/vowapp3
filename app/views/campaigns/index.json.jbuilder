json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :id, :name, :date_start, :date_end, :days, :hours, :status_campaign
  json.url campaign_url(campaign, format: :json)
end
