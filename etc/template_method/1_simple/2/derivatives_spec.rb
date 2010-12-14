describe "Derived Classes" do
  it "Derived classes should exist" do
    A.new.should_not == nil
    B.new.should_not == nil
  end
end
