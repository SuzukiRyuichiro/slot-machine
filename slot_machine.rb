class SlotMachine
  SYMBOLS = ['cherry', 'seven', 'bell', 'star', 'joker']

  def initialize(reels)
    @reels = reels
  end

  def score
    # check if all of them are the same
    if @reels[0] == @reels[2] && @reels[1] == @reels[2] # also, we can check this with @reels.uniq.length == 1
      item = @reels[0] # any of the element is fine for reference
      return (SYMBOLS.index(item) + 1) * 10
    elsif two_of_the_same
      if @reels.include?("joker")
        reels = @reels.dup  # Copy reels so we don't have to modify the instance variable
        reels.delete("joker")
        # if there's only one joker
        if reels.length == 2
          # reels had one joker and something else twice
          item = reels[0]
          return (SYMBOLS.index(item) + 1) * 5
        else
          return 25 # two jokers and one something else
        end
      else
        return 0
      end
    else
      return 0
    end
  end

  private

  def two_of_the_same
    @reels.uniq.length == 2
  end
end

