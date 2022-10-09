require "test_helper"

class FactoriesTest < ActiveSupport::TestCase
  FactoryBot.factories.map(&:name).each do |factory_name|
    test "Factory #{factory_name} generate valid records" do
      assert FactoryBot.build(factory_name).valid?
    end
  end
end
