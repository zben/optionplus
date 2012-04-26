class Option
  include Mongoid::Document
  
  belongs_to :stock
  field :expiration
  field :strike
  has_many :bookmarkables, as: :bookmarkable
end

