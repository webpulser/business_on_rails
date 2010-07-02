class ForgeosCoreToVersion20100611161407 < ActiveRecord::Migration
  def self.up
    Engines.plugins["forgeos_core"].migrate(20100611161407)
  end

  def self.down
    Engines.plugins["forgeos_core"].migrate(20100520122617)
  end
end
