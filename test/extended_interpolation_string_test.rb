require 'test_helper'
describe 'ExtendedInterpolationString' do
  describe '#%' do
    subject do
      extended_string = string.extended
      extended_string.interpolator = interpolator
      extended_string % options
    end

    context "mixed lambda and regular interpolation" do 
      let(:string) { "This %{advanced} interpolation %{is} cool" }
      let(:interpolator) { OpenStruct.new(advanced: "Advanced") }
      let(:options) do
        {
          is: 'IS',
          advanced: lambda { |interpolator| "so #{interpolator.advanced}" }
        }
      end

      it 'should call lambda upon interpolator before interpolating and interpolate hash' do
        subject.must_equal "This so Advanced interpolation IS cool"
      end
    end
  end
end
