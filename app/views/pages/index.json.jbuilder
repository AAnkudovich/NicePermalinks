json.array!(@pages) do |page|
  json.extract! page, :id, :title, :content, :parentPage, :slug, :template
  json.url page_url(page, format: :json)
end
