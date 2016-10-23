require "spec_helper"

describe Hash do

  subject do
    {
      yellow: { contrast: 10, saturation: nil },
      red: { contrast: nil, saturation: "20" },
      black: nil,
      purple: "15"
    }
  end

  context "#deep_reject" do
    it "should not change the original hash" do
      modified = subject.deep_reject { |k,v| true }
      expect(modified).not_to eql subject
    end

    it "should remove all nil values (based on given block)" do
      expected = {
        yellow: { contrast: 10 },
        red: { saturation: "20" },
        purple: "15"
      }

      modified = subject.deep_reject { |k,v| v.nil? }

      expect(modified).to eql(expected)
    end

    it "should compare and remove some keys (based on given block)" do
      expected = {
        yellow: { contrast: 10 },
        red: { contrast: nil },
        purple: "15"
      }

      modified = subject.deep_reject { |k,v| k == :saturation || k == :black }

      expect(modified).to eql(expected)
    end
  end

  context "#deep_reject!" do
    it "should change the original hash" do
      subject.deep_reject! { |k,v| true }
      expect(subject).to eql({})
    end

    it "should remove all nil values (based on given block)" do
      expected = {
        yellow: { contrast: 10 },
        red: { saturation: "20" },
        purple: "15"
      }

      subject.deep_reject! { |k,v| v.nil? }

      expect(subject).to eql(expected)
    end

    it "should compare and remove some keys (based on given block)" do
      expected = {
        yellow: { contrast: 10 },
        red: { contrast: nil },
        purple: "15"
      }

      subject.deep_reject! { |k,v| k == :saturation || k == :black }
      
      expect(subject).to eql(expected)
    end
  end
end
