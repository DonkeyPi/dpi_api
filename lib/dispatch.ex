defmodule Dpi.Api.Dispatch do
  def all(event, darg \\ nil) do
    for node <- Node.list() do
      :rpc.call(node, Dpi.Api.Bus, :dispatch!, [event, darg])
    end
  end
end
