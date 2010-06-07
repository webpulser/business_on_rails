class ForgeosCmsToVersion20100526163534 < ActiveRecord::Migration
  def self.up
    Engines.plugins["forgeos_cms"].migrate(20100526163534)
  end

  def self.down
    Engines.plugins["forgeos_cms"].migrate(20100511161012)
  end
end
