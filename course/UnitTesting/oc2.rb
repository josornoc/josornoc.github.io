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

    return TO_EURO[from_currency.to_sym].to_f * amount if to_currency == "euro"
    return (((amount / FROM_EURO[to_currency.to_sym].to_f)*10000).round)/10000.to_f if from_currency == "euro"
    a = convert(amount, from_currency, "euro")
    b = convert(a, "euro", to_currency)

    # amount = .... unless from_currency == "euro" # convert to euro if needed
    # amount = .... unless to_currency == "euro" # convert from euro if needed
    # amount
    
  end
end


describe TheBanker do
  describe "#convert" do

    it "100 Dollars == 77.818 euros " do
      expect(TheBanker.convert(100, "usd", "euro")).to eq(77.818)
    end

    it "10 Euro == 7.7908 dollars " do
      expect(TheBanker.convert(10, "euro", "usd")).to eq(7.7908)
    end

    it "Should return that 1 gbp is 0.88030 aud" do
      expect(TheBanker.convert(1, "gbp", "aud")).to eq(0.88030)
    end

    it "Should return that 1000 gbp more than 1000 euros and less than 1300" do
      expect(TheBanker.convert(1000, "gbp", "euro")).to be_between(1000, 1300)
    end

    it "Should return that 100 usd estan entre 70 y 100 gbp" do
      expect(TheBanker.convert(100, "usd", "gbp")).to be_between(70, 100)
    end

    it "Should return that 1 usd is less than 1 gbp" do
      expect(TheBanker.convert(1, "usd", "gbp")).to be_between(0,1)
    end
  end
end









