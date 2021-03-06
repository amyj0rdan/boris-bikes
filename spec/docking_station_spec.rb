require 'docking_station'
describe DockingStation do

  describe '#initialize' do

    it 'creates an array' do
      expect(subject.bikes).to eq []
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'can take a capacity from the user' do
      station = DockingStation.new(40)
      expect(station.capacity).to eq 40
    end

  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'gets a bike and the bike is working' do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'raise an exception if no bike is available to release' do
      expect{ subject.release_bike }.to raise_error("No bikes available")
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'shows the bike that has been docked' do
      bike = Bike.new
      expect(subject.dock(bike)).to include bike
    end

    it 'raise an exception if the docking station is full' do
      subject.capacity.times { subject.dock Bike.new }
      expect{ subject.dock(Bike.new) }.to raise_error("Docking station full")
    end

    it 'raise an exception if the docking station is full with a variable capacity' do
      docking_station = DockingStation.new(75)
      75.times { docking_station.dock Bike.new }
      expect{ docking_station.dock Bike.new }.to raise_error "Docking station full"
    end

    it 'show a bike has been docked' do
      my_bike = Bike.new
      subject.dock(my_bike)
      expect(subject.bikes).to include my_bike
    end
  end
  # removed tests for private methods as per instructions

  # describe '#full?' do
  #
  #   it {is_expected.to respond_to :full?}
  #
  #   it 'should be true if there are 20 bikes' do
  #     20.times { subject.dock Bike.new }
  #     expect(subject.full?).to eq true
  #   end
  # end
  #
  #
  # describe '#empty?' do
  #
  #   it { is_expected.to respond_to :empty? }
  #
  #   it 'should be true if there are 0 bikes' do
  #     expect(subject.empty?).to eq true
  #   end
  #
  # end
end
