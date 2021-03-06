class Page < ApplicationRecord
    acts_as_list :scope => :subject
    belongs_to :subject
    has_many :sections
    has_and_belongs_to_many :admin_users

    scope :visible, -> {where(:visible => true)}
    scope :sorted, -> {order(:position => :asc)}
    scope :invisible, -> {where(:visible => false)}
    scope :newest_first, -> {order(:created_at => :desc)}

    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_presence_of :permalink
    validates_length_of :permalink, :in =>3..255

    validates_uniqueness_of :permalink
end
