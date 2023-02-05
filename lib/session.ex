defmodule Dpi.Api.Session do
  alias Dpi.Api.Nodes
  Dpi.Api.Bus
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> nil end, name: __MODULE__)
  end

  def get() do
    Agent.get(__MODULE__, fn session -> session end)
  end

  def put(session) do
    Agent.update(__MODULE__, fn _ -> session end)
  end

  def login(session), do: rpc(session)
  def logout(), do: rpc(nil)

  defp rpc(session) do
    Nodes.foreach(fn node ->
      # returns {:badrpc, reason}
      :rpc.call(node, Dpi.Api.Session, :put, [session])
      :rpc.call(node, Dpi.Api.Bus, :dispatch!, [:session, session])
    end)
  end
end
