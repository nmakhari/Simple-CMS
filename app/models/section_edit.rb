class SectionEdit < ApplicationRecord
    acts_as_list :scope => :page
    belongs_to :admin_user
    belongs_to :section

    scope :visible, -> {where(:visible => true)}
    scope :sorted, -> {order(:position => :asc)}
    scope :invisible, -> {where(:visible => false)}
    scope :newest_first, -> {order(:created_at => :desc)}

    CONTENT_TYPES = ['text', 'HTML']

    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_inclusion_of :content_type, :in =>CONTENT_TYPES, :message => "must be one of: #{
        CONTENT_TYPES.join(", ")
    }"
    validates_presence_of :content
end
