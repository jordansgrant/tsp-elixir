defmodule TSP.LocationTest do
  use ExUnit.Case
  alias TSP.Location, as: Location

  doctest Location

  setup do
    {
      :ok,
      loc1: %Location{name: "first", x: 0, y: 0},
      loc2: %Location{name: "second", x: 10, y: 10}
    }
  end

  describe "Calculates proper distance" do
    test "when passed in given order", state do
      assert Location.distance(state[:loc1], state[:loc2]) == 14
    end

    test "when passed in reverse order", state do
      assert Location.distance(state[:loc1], state[:loc2]) == 14
    end
  end
end
