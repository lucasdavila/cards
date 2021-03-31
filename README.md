# Cards

This is a simple cards deck manager experiment build with elixir, it allows to:

* Create a deck
* Shuffle the cards
* Split the cards (deal)
* Check if contains a given card
* Save the deck into a file
* Load the deck from a saved file

## Dev env setup

* First clone this repo:

  `git clone git@github.com:lucasdavila/cards.git`

* Then install the deps:

  `mix deps.get`

## Tests

You can run the tests with:

`$ mix test`

## Docs

* You can generate the documentation with ex_doc:

`$ mix docs`

* Then you can check it:

`$ open doc/index.html`

## Usage

* Open the iex console loading the project:

  `$ iex -S mix`

* call the functions:

  ```elixir
  # create a deck
  deck = Cards.create_deck

  # shuffle the cards
  deck = Cards.shuffle(deck)

  # split the cards
  {hand, rest} = Cards.deal(deck, 7)

  # check if a hand contains a given card
  Cards.contains?(hand, "Four of Diamonds")

  # save a given deck on decks/deck_1.deck
  Cards.save(deck, 'deck_1')

  # load a given deck from decks/deck_1.deck
  deck = Cards.load('deck_1')
  ```
