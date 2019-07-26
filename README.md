# Card_Game_Simulation_Function

### Description
This function returns the expected value and the standard deviation of points obtained by: having a deck with n different cards and m different suits where when drawing all cards, without putting them back in the deck, you get a point for each time the subsequent card drawn has the same suit than the previous one. The number of cards is evenly distributed to each suit in the deck.

The calculation is made by simulating a specified number of experiments (20,000 by default).

A conditional probability can be returned if the parameters `x_greater_than` and `given_that` are specified.

### Usage
`card_game_sim(suits, cards, x_greater_than, given_that, experiments=20000, histogram=TRUE)`

### Arguments
`suits` number of different suits in the deck

`cards` number of cards in the deck

`x_greater_than` first condition to calculate conditional probability P( x > `x_greater_than` | x >= `given_that`)

`given_that` second condition to calculate conditional probability P( x > `x_greater_than` | x >= `given_that`)

`experiments` number of experiments to simulate

`histogram` A histogram is displayed by default showing the distribution of the points per experiment. if set to `FALSE` then no chart will be displayed.
