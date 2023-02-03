defmodule Dpi.Api.Session do
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
    rpc(:dpi_console@localhost, session)
    rpc(:dpi_manager@localhost, session)
  end

  defp rpc(node, session) do
    # returns {:badrpc, reason}
    :rpc.call(node, Dpi.Api.Session, :put, [session])
    :rpc.call(node, Dpi.Api.Bus, :dispatch!, [:session, session])
  end
end
