require 'date'

class Subtitle

	attr_reader :subtitles
	def initialize
		@subtitles = []
	end

	def read_srt_file(fileName)

		file = IO.read(fileName).force_encoding("ISO-8859-1").encode("utf-8", replace: nil)

		myArray = file.split("\r\n\r\n")

		myArray.each do |item|

			temp = item.split("\r\n")
			
			t = temp[1].split(" --> ")

			if( temp[3] )
				finalText = temp[2] + " " + temp[3]			
			else
				finalText = temp[2]
			end

			@subtitles << ItemSubtitle.new( temp[0], t[0], t[1], finalText)			
		end


		@subtitles.each do |s|
			s.modify_time
			s.diccionario
		end
	end
end

class ItemSubtitle

	attr_reader :sTime

	def initialize(numero, sTime, fTime, text)
		@numero = numero
		@sTime = sTime
		@fTime = fTime
		@text = text
	end

	def diccionario

		palabras = @text.split #(" ")

		palabras.each do |palabra|
			
			archivo_temp = IO.read("diccionario_palabras.txt")
			palabra = palabra.split("<i>").join("")
			palabra = palabra.split("</i>").join("")
			palabra = palabra.gsub(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ\-]/,"") 
			
			puts palabra
			
			#IO.write("diccionario_palabras.txt", archivo_temp + "\n" + palabra )

		end
	end

	def modify_time(timeMil = -2500)

		timeResult = timeMil / 1000

		d = DateTime.parse(@sTime)
		d = d + Rational(timeResult, 86400)

		t = DateTime.parse(@fTime)
		t = t + Rational(timeResult, 86400)

		puts "------"
		puts DateTime.parse(@sTime)
		puts d
		puts "------"
		puts DateTime.parse(@fTime)
		puts t
		puts "------"
	end
end

mySubtitle = Subtitle.new
mySubtitle.read_srt_file("limitless.srt")



