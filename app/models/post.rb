class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :postvotes
end

def update_from_params(source)
  self.title = source[:title]
  self.description = source[:description]
  self.location = source[:location]
  self.price = source[:price]
  self.start_date = source[:startdate]
  self.end_date = source[:enddate]
  self.photo_url = source[:photourl]
end
