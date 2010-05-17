class CreateSiteTranslation < ActiveRecord::Migration
  def self.up
    Site.create_translation_table!(:name=>:string,:url=>:string,:description=>:text)
  end

  def self.down
    Site.drop_translation_table!
  end
end
