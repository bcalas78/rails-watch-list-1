if @review.persisted?
  json.form json.partial!("reviews/form.html.erb", list: @list, review: Review.new)
  json.inserted_item json.partial!("lists/review.html.erb", review: @review)
else
  json.form json.partial!("reviews/form.html.erb", list: @list, review: @review)
end
