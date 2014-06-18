require_relative '../app/route'

describe Route do
  let(:pier_39) { Location.new(37.808673, -122.409821) }
  let(:lombard) { Location.new(37.802139 , -122.41874) }
  let(:sutro_heights) { Location.new(37.777794 , -122.511107) }

  context 'when defined by two locations' do
    it 'calculates driving distance' do
      fake_map = double
      expect(fake_map).to receive(:driving_distance).with(pier_39, lombard) {1.2}

      route = Route.new([pier_39, lombard], fake_map)
      expect(route.driving_distance).to eq 1.2
    end
  end

  context 'when defined by more than two locations' do
    it 'calculates summed driving distance' do
      fake_map = double
      expect(fake_map).to receive(:driving_distance).with(pier_39, lombard) {1.2}
      expect(fake_map).to receive(:driving_distance).with(lombard, sutro_heights) {6.6}

      route = Route.new([pier_39, lombard, sutro_heights], fake_map)
      expect(route.driving_distance).to eq 7.8
    end
  end
end
