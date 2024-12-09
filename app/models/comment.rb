class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype, class_name: "Prototype" # クラスはいらないかも
 
  validates :content, presence: true, length: { maximum: 500 }
end
