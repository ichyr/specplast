json.array!(@specdata) do |specdatum|
  json.extract! specdatum, :id, :gen_info, :proby, :activity, :provid, :specialization_id
  json.url specdatum_url(specdatum, format: :json)
end
