# Cards

##Notes
    Elixir
        Mix
            Creates Projects
            Compiles Projects
            Runs 'tasks'
            Manages Dependencies
        -- elixir

        -- mix new projectname

        -- iex -S mix        -compile project and launch interactive elixir shell

        -- recompile         -recompile elixir shell

        Destructuring

          deck = Cards.create_deck()
          { hand, rest_of_deck } = Cards.deal(deck, 5)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cards` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cards, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/cards](https://hexdocs.pm/cards).

