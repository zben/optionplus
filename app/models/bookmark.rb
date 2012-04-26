class Bookmark
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  belongs_to :bookmarkable, polymorphic: true
  
end

