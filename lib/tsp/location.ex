defmodule TSP.Location do
  @moduledoc """
  A Location represents a single point.
  """
  alias :math, as: Math

  defstruct name: "", x: 0, y: 0, visited: false

  def distance(loc1, loc2) do
    x_dist = abs(loc1.x - loc2.x)
    y_dist = abs(loc1.y - loc2.y)

    Float.round(Math.sqrt(Math.pow(x_dist, 2) + Math.pow(y_dist, 2)))
  end
end
