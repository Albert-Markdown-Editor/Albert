require "model_test_helper"

class ProjectDeliverableTest < ModelTestHelper
  # Database View Kinds
  # -------------------
  ProjectDeliverable.compatible_kinds.each do |kind|
    test "View model parses #{kind} Project Deliverables" do
      kind_records = kind.constantize.all

      result = ProjectDeliverable.where(kind:)

      assert_equal_relation_records(kind_records, result)
    end
  end
end
