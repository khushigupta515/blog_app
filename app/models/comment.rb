class Comment < ApplicationRecord
  # include Visible
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }
  def archived?
    status == 'archived'
  end
  belongs_to :article
  
end
