class Page < ApplicationRecord
    belongs_to :subject
    has_many :sections
    has_and_belongs_to_many :admin_users

    scope :visible, -> {where(:visible => true)}
    scope :sorted, -> {order(:position => :asc)}
    scope :invisible, -> {where(:visible => false)}
    scope :newest_first, -> {order(:created_at => :desc)}
end
