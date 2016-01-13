require 'test_helper'

class RspecScaffoldGenTest < ActiveSupport::TestCase

  include RspecScaffoldGen

  test "truth" do
    assert_kind_of Module, RspecScaffoldGen
  end

  test "generate controller" do
  	generate_controller("content_group_item",{campo1: "string", campo2: "integer"})
  end
end
