class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name, :url
      t.text :description
      t.boolean :active
      t.belongs_to :user

      t.timestamps
    end
    Site.create_translation_table!(:name=>:string,:url=>:string,:description=>:text)
  end

  def self.down
    Site.drop_translation_table!
    drop_table :sites
  end
end
