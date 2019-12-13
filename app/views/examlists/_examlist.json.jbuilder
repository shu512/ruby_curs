json.extract! examlist, :id, :student_id, :examination_id, :mark, :created_at, :updated_at
json.url examlist_url(examlist, format: :json)
