class Subject < ApplicationRecord
    acts_as_list
    has_many :pages

    #named scopes to shorten query methods
    scope :visible, -> {where(:visible => true)}
    scope :invisible, -> {where(:visible => false)}
    scope :sorted, -> {order(:position => :asc)}
    scope :newest_first, -> {order("created_at DESC")}
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

    validates_presence_of :name
    validates_length_of :name, :maximum => 255
end
