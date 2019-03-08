require 'docking_station'
describe DockingStation do

  describe '#initialize' do

    it 'creates an array' do
      expect(subject.bikes).to eq []
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

    it 'raise an exception if there is already a bike in the docking station' do
      20.times { subject.dock Bike.new }
      expect{ subject.dock(Bike.new) }.to raise_error("Docking station full")
    end


    it 'show a bike has been docked' do
      my_bike = Bike.new
      subject.dock(my_bike)
      expect(subject.bikes).to include my_bike
    end
  end
end
