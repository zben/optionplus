class Pricing
  include Mongoid::Document
  
  field :date, type: Date
  field :ranking, type: Float
  field :industry_ranking, type: Float
  belongs_to :stock
end

