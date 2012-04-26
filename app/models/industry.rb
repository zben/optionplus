class Industry
  include Mongoid::Document
  field :name
  has_many :stocks
end

