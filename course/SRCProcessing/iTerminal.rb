require 'terminfo'

class FileReader

	def read_file(fileName)
		@content = IO.read(fileName)
		get_slide_array
	end

	private
	def get_slide_array
		slidesArray = []
		slidesArray = @content.split("\n----\n")
		slidesArray
	end
end

class DisplayText

	def initialize(slideArray)
		@qLinesPerSlide = []
		@numOfVerticalLines = TermInfo.screen_size[0] / 2
		@numOfHorizontalChars = TermInfo.screen_size[1] / 2
		@slideArray = slideArray
		centerStringArray
	end

	def get_blank_chars_number(str)
		qSpaces = @numOfHorizontalChars - str.length/2
		qSpaces
	end

	def printBlnkLines(num)
		num.times do |line|
			puts ""
		end
	end

	def addBlankCharacters(str)
		str = str.insert(0, " " * get_blank_chars_number(str))
		str
	end

	def printSlides(str)
		str
	end

	def centerStringArray

		@slideArray.each do |word|

			tmpVar = word.split("\n")

			@qLinesPerSlide << tmpVar.length

			# tmpVar.each do |tmpLine|
			# 	tmpLine = addBlankCharacters(tmpLine)
			# end
		end
	end

	def centerString(currentSlide)
		mQuanBreaklines = @numOfVerticalLines - @qLinesPerSlide[currentSlide]
		printBlnkLines(mQuanBreaklines)
		puts @slideArray[currentSlide]
		printBlnkLines(mQuanBreaklines)
	end
end

class SlideShow

	def initialize(fileName)
		@autoAdvance = false
		@fileName = fileName
		@currentSlide = 0
		fileReaderInit
		displayTextInit
	end

	def fileReaderInit
		fr = FileReader.new
		@slides = fr.read_file(@fileName)
	end

	def displayTextInit
		@dp = DisplayText.new(@slides)
	end

	def showSlide
		@dp.centerString(@currentSlide)
		if(@autoAdvance)	
			startAutoAdvance
		else
			requestCommand
		end
	end

	def requestCommand
		print "> "
		@userCommand = gets.chomp
		react
	end

	private
	def startAutoAdvance
		sleep 3 
		nextSlide
	end
	def react
		if(@userCommand == "next")
			nextSlide
		elsif(@userCommand == "prev")
			prevSlide
		elsif(@userCommand == "auto")
			@autoAdvance = true
			startAutoAdvance
		end
	end
	def nextSlide
		if(@currentSlide == @slides.length - 1)
			@currentSlide = 0
		else
			@currentSlide += 1
		end
		showSlide
	end
	def prevSlide
		if(@currentSlide == 0)
			@currentSlide = @slides.length-1
		else
			@currentSlide -= 1
		end
		showSlide
	end
end


#DRIVER CODE
mySlideShow = SlideShow.new("terminalSlides.txt")
mySlideShow.showSlide





