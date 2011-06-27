class Contact < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :email, :firm, :message
  validates_format_of   :email, :with => /^\S+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,4})(\]?)$/ix

  column :email, :string
  column :firm, :string
  column :firstname, :string
  column :lastname, :string
  column :message, :text

  after_create :log_creation
  def self.columns
    @columns ||= [];
  end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  # Override the save method to prevent exceptions.
  def save(validate = true)
    validate ? valid? : true
  end

  private

  def log_creation
    Journal.create(:category => "Contact",:message => "Un message a été envoyé</a> par #{email}.")
  end
end
