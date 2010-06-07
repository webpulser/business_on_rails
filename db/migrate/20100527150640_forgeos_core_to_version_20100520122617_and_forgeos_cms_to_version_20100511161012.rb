class ForgeosCoreToVersion20100520122617AndForgeosCmsToVersion20100511161012 < ActiveRecord::Migration
  def self.up
    Engines.plugins["forgeos_core"].migrate(20100520122617)
    Engines.plugins["forgeos_cms"].migrate(20100511161012)
  end

  def self.down
    Engines.plugins["forgeos_core"].migrate(20100413133941)
    Engines.plugins["forgeos_cms"].migrate(20100413134832)
  end
end
