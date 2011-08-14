class Site < ActiveRecord::Base
  belongs_to :user
  translates :name, :url, :description
  validates :name, :presence => true
  validates :url, :presence => true, :uniqueness => true
  validates_associated :user

  acts_as_taggable

  has_and_belongs_to_many :categories, :readonly => true, :join_table => 'categories_elements', :foreign_key => 'element_id', :association_foreign_key => 'category_id'
  has_and_belongs_to_many_attachments

  include AASM
  aasm_column :status
  aasm_initial_state :active
  aasm_state :disabled
  aasm_state :active

  aasm_event :activate do
    transitions :to => :active, :from => :disabled
  end

  aasm_event :disable do
    transitions :to => :disabled, :from => :active
  end

end
