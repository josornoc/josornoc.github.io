puts "What is the source file?"
sourceFile = gets.chomp
file_contents = IO.read(sourceFile)
puts "What is the destination file?"
destinationFile = gets.chomp
IO.write(destinationFile, file_contents)