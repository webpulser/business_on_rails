class SiteCategory < Category
  has_and_belongs_to_many :elements, :join_table => 'categories_elements', :foreign_key => 'category_id', :association_foreign_key => 'element_id', :class_name => 'Site'
  has_and_belongs_to_many :sites, :join_table => 'categories_elements', :foreign_key => 'category_id', :association_foreign_key => 'element_id'
end