defmodule Dpi.Api.Nodes do
  def foreach(callback) do
    for node <- nodes() do
      callback.(node)
    end
  end

  def dispatch!(event, darg \\ nil) do
    for node <- nodes() do
      :rpc.call(node, Dpi.Api.Bus, :dispatch!, [event, darg])
    end
  end

  def nodes(), do: [Node.self() | Node.list()]
end
