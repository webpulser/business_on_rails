class ForgeosCoreToVersion20100413133941AndForgeosCmsToVersion20100413134832 < ActiveRecord::Migration
  def self.up
    Engines.plugins["forgeos_core"].migrate(20100413133941)
    Engines.plugins["forgeos_cms"].migrate(20100413134832)
  end

  def self.down
    Engines.plugins["forgeos_core"].migrate(0)
    Engines.plugins["forgeos_cms"].migrate(0)
  end
end
