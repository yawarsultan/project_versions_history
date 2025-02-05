class VersionHistory < ApplicationRecord
  belongs_to :project

  enum :version_type, {
    comment: "comment",
    status_change: "status_change",
  }
end
