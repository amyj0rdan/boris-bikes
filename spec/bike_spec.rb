require 'bike'
describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :broken? }

  it { is_expected.to respond_to :report_broken }

  it 'is expected to be broken if reported as broken' do
    broken_bike = Bike.new
    broken_bike.report_broken
    expect(broken_bike.broken?).to eq true
  end
end
