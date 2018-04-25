defmodule TSP.TourTest do
  use ExUnit.Case
  alias TSP.Location, as: Location
  alias TSP.Tour, as: Tour

  doctest TSP.Tour

  setup_all do
    {
      :ok,
      locations: [
        %Location{name: "1", x: 0, y: 0},
        %Location{name: "2", x: 10, y: 10},
        %Location{name: "3", x: 20, y: 20},
        %Location{name: "4", x: 30, y: 30},
        %Location{name: "5", x: 40, y: 40},
        %Location{name: "6", x: 50, y: 50}
      ]
    }
  end

  describe "Building a tour with add_location" do
    test "The first added location yields a 0 distance", state do
      tour = Tour.add_location(%Tour{}, Enum.at(state[:locations], 0))
      {_, dist} = Tour.get_distance(tour)

      assert dist == 0
    end

    test "The next added location yields the correct distance", state do
      tour = Tour.add_location(%Tour{}, Enum.at(state[:locations], 0))
      tour = Tour.add_location(tour, Enum.at(state[:locations], 1))
      {status, dist} = Tour.get_distance(tour)

      assert status == :ok
      assert dist == 14
    end
  end

  describe "Given a new, unprocessed Tour" do
    test "calculates the proper distance, returning atom :set in tuple", state do
      tour = %Tour{route: state[:locations]}

      {status, dist} = Tour.get_distance(tour)
      assert status == :set
      assert dist == 141
    end
  end

  describe "Given an already processed Tour" do
    test "calculates the proper distance, returning atom :ok in tuple", state do
      tour = %Tour{route: state[:locations]}
      {_, dist} = Tour.get_distance(tour)

      {status, dist} = Tour.get_distance(%{tour | distance: dist})
      assert status == :ok
      assert dist == 141
    end
  end
end
