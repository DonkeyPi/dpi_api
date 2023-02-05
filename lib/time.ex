defmodule Dpi.Api.Time do
  alias Dpi.Api.Nodes
  alias Dpi.Api.Store

  def get_timezone(), do: Store.get(:timezone, "CET")

  def set_timezone(zone) do
    Nodes.foreach(fn node ->
      # returns {:badrpc, reason}
      :rpc.call(node, Dpi.Api.Store, :put, [:timezone, zone])
      :rpc.call(node, Dpi.Api.Bus, :dispatch!, [:timezone, zone])
    end)
  end

  def get_time(), do: DateTime.now!(get_timezone())
  def get_time(zone), do: DateTime.now!(zone)
end
