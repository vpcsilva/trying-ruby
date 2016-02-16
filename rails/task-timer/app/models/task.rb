class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, length: { maximum: 500 }
  validates :project_id, presence: true
end
