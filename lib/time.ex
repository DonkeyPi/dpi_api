defmodule Dpi.Api.Time do
  alias Dpi.Api.Store

  def load_timezone(), do: Store.get(:timezone, "CET")
  def save_timezone(zone), do: Store.put(:timezone, zone)

  def get_time(), do: DateTime.now!(load_timezone())
  def get_time(zone), do: DateTime.now!(zone)
end
