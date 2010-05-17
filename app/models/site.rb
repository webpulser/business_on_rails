class Site < ActiveRecord::Base
  translates :name, :url, :description
  validates_presence_of :name, :url

  acts_as_taggable

  has_and_belongs_to_many :site_categories, :readonly => true, :join_table => 'categories_elements', :foreign_key => 'element_id', :association_foreign_key => 'category_id'
  has_and_belongs_to_many_attachments

  def activate
    update_attribute(:active, !self.active)
  end

  # URI cf RFC2396
  validates_format_of :url, :with => /^(([^:\/?#]+):)?(\/\/([^\/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?/


end
