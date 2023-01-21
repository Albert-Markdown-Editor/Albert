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

  test "ViewBasedModel concerns defines kinds enum in included class" do
    ValidViewBasedModel.include(ViewBasedModel)

    assert ValidViewBasedModel.defined_enums.key?("kind")
  end

  test "ViewBasedModel concerns kinds enum includes the respective compatible_kind values" do
    ValidViewBasedModel.include(ViewBasedModel)

    assert_equal ValidViewBasedModel.defined_enums.values.first.values.sort, ValidViewBasedModel.compatible_kinds.sort
  end
end
