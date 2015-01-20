# OC2. Money, money, money

# We were going back home yesterday. Second week, Monday, rain, new teacher... But just before getting into the subway, we found a bag full of
# money in different currencies! So we skipped TV shows for now (we’ll be back sometime, don’t worry!) because, don’t know why, we were
# suddenly interested in money.

# So we got to our local dealer, knowing that either way he will have a cut of the deal, but anyway we asked him about the current rates.
# And instead of using his services, we decided we wanted to get home, and write an awesome currency converter so we could know how much
# money was in the bag.

# Let’s do it now!

# You already have a little skeleton class with currency exchanges from and to €. Note that converting from/to € is direct, but if none
# of the from/to currencies is the € you have to do two conversions, using the € as a bridge.

# The only condition is: write ALL the tests first. Go full TDD on it. Yeah, all tests first. All of them. Yeah, every single one. Every.
# Single. One. Got it? One more time: every single one. And then, when everything is failing and so on... go implement it.

# Feel free to add support for your country currency! :)

class TheBanker

  TO_EURO = {
    usd: 0.77818,
    gbp: 1.27341,
    cad: 0.70518,
    aud: 0.69052
  }

  FROM_EURO = {
    usd: 1.28356,
    gbp: 0.78478,
    cad: 1.41613,
    aud: 1.44651
  }

  def self.convert(amount, from_currency, to_currency)
    TO_EURO[:to_currency]
  end
end


describe TheBanker do
  describe "#convert" do

    it "Should return that 1 Euro is 0.77818 dollars " do
      expect(TheBanker.convert(1, "euro", "usd")).to eq(0.77818)
    end

    it "Should return that 1.28356 usd = 1 Euro" do
      expect(TheBanker.convert(1.28356, "usd", "euro")).to eq(1)
    end

    it "Should return that 1 Euro is 1.27341 gbp " do
      expect(TheBanker.convert(1, "euro", "gbp")).to eq(1.27341)
    end

    it "Should return that 0.78478 gbp is 1 euro " do
      expect(TheBanker.convert(0.78478, "gbp", "euro")).to eq(1)
    end

    it "Should return that 1 Euro is 0.70518 cad " do
      expect(TheBanker.convert(1, "euro", "cad")).to eq(1.70518)
    end

    it "Should return that 1.41613 cad is 1 euro" do
      expect(TheBanker.convert(1.41613, "cad", "euro")).to eq(1)
    end

    it "Should return that 1 Euro is 0.69052 aud " do
      expect(TheBanker.convert(1, "euro", "aud")).to eq(0.69052)
    end

    it "Should return that 1.44651 aud is 1 euro " do
      expect(TheBanker.convert(1.44651, "aud", "euro")).to eq(1)
    end

    it "Should return that 1 gbp is 1.13593" do
      expect(TheBanker.convert(1, "gbp", "aud")).to eq(1.13593)
    end
  end
end









