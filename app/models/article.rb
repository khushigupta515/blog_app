class Article < ApplicationRecord
    # include Visible
    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, inclusion: { in: VALID_STATUSES }
  
    def archived?
      status == 'archived'
    end
    has_many :comments ,dependent: :destroy
    validates :title,presence:true
    validates :body,presence:true, length: { minimum: 10 }

    
end
