json.array!(@email_templates) do |email_template|
  json.extract! email_template, :id, :name, :body
  json.url email_template_url(email_template, format: :json)
end
