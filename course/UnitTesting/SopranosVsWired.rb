describe SeriesMaster do

	before do
		@seriesMaster = SeriesMaster.new
	end

	describe "#return_number_of_results" do
		it "Should state that there are more than 200 results with the string cat" do
			numberOfResults = @seriesMaster.return_number_of_reslts("Cat")
			expect(numberOfResults).to be_between(200, 1000)
		end
	end

	describe "#most_episodes" do
		it "Should state that Lost has more episodes than True Detective" do
			numberOfResults = @seriesMaster.most_episodes("Lost", "True Detective")
			expect(numberOfResults).to match(/Lost/)
		end
	end
end




