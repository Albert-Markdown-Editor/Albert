require "test_helper"

class ViewBasedModelTest < ActiveSupport::TestCase
  class ValidViewBasedModel < ActiveRecord::Base
    def self.compatible_kinds = %w[Test]
  end

  class InvalidViewBasedModel < ActiveRecord::Base
  end

  test "ViewBasedModel concern requires included classes to define compatible_kinds class method" do
    assert_nothing_raised do
      ValidViewBasedModel.include(ViewBasedModel)
    end

    assert_raises do
      InvalidViewBasedModel.include(ViewBasedModel)
    end
  end
end
