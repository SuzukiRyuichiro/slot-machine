require_relative '../slot_machine'

def test_scenario(reels, expected_score)
  it "returns #{expected_score} if given #{reels}" do
    slot_machine = SlotMachine.new(reels)
    expect(slot_machine.score).to eq(expected_score)
  end
end

describe SlotMachine do
  describe "#score" do
    test_scenario(%w[star seven cherry], 0)
    test_scenario(%w[cherry cherry joker], 5)
    test_scenario(%w[joker seven seven], 10)
    test_scenario(%w[joker bell bell], 15)
    test_scenario(%w[joker star star], 20)
    test_scenario(%w[joker joker seven], 25)
    test_scenario(%w[joker cherry joker], 25)
    test_scenario(%w[joker joker joker], 50)
    test_scenario(%w[star star star], 40)
    test_scenario(%w[bell bell bell], 30)
    test_scenario(%w[seven seven seven], 20)
    test_scenario(%w[cherry cherry cherry], 10)
  end
end
