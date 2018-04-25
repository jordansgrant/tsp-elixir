defmodule TSP.Tour do
  @moduledoc """
  A Tour is a set of locations which constitutes a route from a starting location
  through all other locations and back again.

  The Tour module contains all logic for building and manipulating a tour
  """

  alias TSP.Location, as: Location

  defstruct route: [], distance: 0

  def add_location(%TSP.Tour{route: []} = tour, location) do
    %{tour | route: [location]}
  end

  def add_location(tour, location) do
    distance = Location.distance(Enum.at(tour.route, 0), location)

    %{
      tour
      | distance: tour.distance + distance,
        route: [location] ++ tour.route
    }
  end

  def get_distance(%TSP.Tour{distance: distance} = tour) when distance > 0 do
    {:ok, tour.distance}
  end

  def get_distance(tour) do
    {:set, get_total_distance(tour)}
  end

  defp get_total_distance(tour) do
    tour.route
    |> Enum.reduce({nil, 0}, &distance_reducer/2)
    |> distance_back_to_beginning(tour)
  end

  defp distance_reducer(location, acc) when elem(acc, 0) == nil do
    {location, 0}
  end

  defp distance_reducer(location, {prev, dist}) do
    {location, dist + Location.distance(location, prev)}
  end

  defp distance_back_to_beginning({last, dist}, tour) do
    dist + Location.distance(last, Enum.at(tour.route, 0))
  end
end
