require 'scoring_array'
require 'binary_search'

describe BinarySearch do
  it "finds if it exists" do
    elements = ScoringArray.from_array([0,1,2,3,4,5,6,7])
    BinarySearch.contains?(elements, 0).should be_truthy
    BinarySearch.contains?(elements, 1).should be_truthy
    BinarySearch.contains?(elements, 2).should be_truthy
    BinarySearch.contains?(elements, 3).should be_truthy
    BinarySearch.contains?(elements, 4).should be_truthy
    BinarySearch.contains?(elements, 5).should be_truthy
    BinarySearch.contains?(elements, 6).should be_truthy
    BinarySearch.contains?(elements, 7).should be_truthy
  end

  it "does not find if absent" do
    elements = ScoringArray.from_array([0,1,2,3,4,5,6])
    BinarySearch.contains?(elements, 99).should be_falsey
  end
end
