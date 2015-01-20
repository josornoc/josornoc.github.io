# SL5. Conway's Game of Life

# We now discovered that the amount of money in the bag only pays for a coffee, half muffin and a couple of Smints. 
# So we realized that we still have to be developers in order to pay rent. Isn’t that great? :)

# This got ourselves thinking about Life, in capitals. How we are just particles in the Universe, and how the shitty end of Lost is not THAT
# important (though, JJ Abrams, SERIOUSLY?).

# Anyway, while we are philosophing about Everything, we end up discovering about Conway’s Game of Life. More information is in here:
# http://en.wikipedia.org/wiki/Conway's_Game_of_Life

# We think this is a pretty cool game, so we want in, and decide to implement it. But not implement it cowboy-style: we know TDD! So we get
# prepared, roll up our sleeves (wait, no, it’s summer!) and implement this funny game, step by step, with TDD.

# Have fun!

# The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, 
# each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, 
# which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, 
# the following transitions occur:

# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

# The initial pattern constitutes the seed of the system. 
# The first generation is created by applying the above rules simultaneously to every cell in the 
# seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes 
# called a tick (in other words, each generation is a pure function of the preceding one). 
# The rules continue to be applied repeatedly to create further generations.

