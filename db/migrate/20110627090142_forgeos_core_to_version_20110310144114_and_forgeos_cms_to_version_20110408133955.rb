class ForgeosCoreToVersion20110310144114AndForgeosCmsToVersion20110408133955 < ActiveRecord::Migration
  def self.up
    Engines.plugins["forgeos_core"].migrate(20110310144114)
    Engines.plugins["forgeos_cms"].migrate(20110408133955)
  end

  def self.down
    Engines.plugins["forgeos_core"].migrate(0)
    Engines.plugins["forgeos_cms"].migrate(0)
  end
end
