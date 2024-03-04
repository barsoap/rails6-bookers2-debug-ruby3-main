class Like < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, uniqueness: {scope: :book_id} #user_idとbook_idのペアが一意である（重複しない）状態に制限
end
