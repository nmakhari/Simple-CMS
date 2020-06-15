class AdminUser < ApplicationRecord
    has_and_belongs_to_many :pages
    has_many :section_edits
    has_many :sections, :through => :section_edits

    has_secure_password

    scope :sorted, -> {order(:last_name, :first_name => :asc)}

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    #sexy validations
    validates :first_name, :presence => true,
              :length => { :maximum => 25 }
    validates :last_name, :presence => true,
                          :length => { :maximum => 50 }
    validates :username, :length => { :within => 8..25 },
                        :uniqueness => true
    validates :email, :presence => true,
                      :length => { :maximum => 100 },
                      :format => EMAIL_REGEX,
                      :confirmation => true

    def name 
      "#{first_name} #{last_name}"
    end 
end
