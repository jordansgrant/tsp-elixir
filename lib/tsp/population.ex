defmodule TSP.Population do
  @moduledoc """
  A priority queue implementation aimed at retriving the minimum distance in
  a population of Tours
  """
  alias :array, as: Array
  alias TSP.Tour, as: Tour

  defstruct heap: nil, size: 0

  def new(size) when is_int(size) do
    %TSP.Population{heap: Array.new(size, {:default, nil})}
  end

  defp parent(index) do
    div(index, 2)
  end

  defp bubble(population, index) do
    cond do
      0 || compare(population, index, parent(index)) == 
    end
  end

  defp swap(population, loc1, loc2) do
    tour1 = Array.get(loc1, population.heap)
    tour2 = Array.get(loc2, population.heap)
    heap = Array.set(loc1, tour2, population.heap)
    heap = Array.set(loc2, tour1, heap)
    %{population | heap: heap}
  end

  defp compare(population, loc1, loc2) do
    tour1 = Array.get(loc1, population.heap)
    tour2 = Array.get(loc2, population.heap)

    case
  end
end
