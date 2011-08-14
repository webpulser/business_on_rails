load File.join(Gem.loaded_specs['forgeos_core'].full_gem_path, 'app', 'models', 'user.rb')
class User < Person
  has_many :sites
end
