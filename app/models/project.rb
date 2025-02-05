class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :version_histories, dependent: :destroy

  enum :status, {
    pending: "pending",
    in_progress: "in_progress",
    completed: "completed"
  }

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
