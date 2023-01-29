defmodule Dpi.Api.Console do
  def home() do
    Process.send({Dpi.Term.Server, :dpi_console@localhost}, {:select, :home}, [:noconnect])
  end

  def set_timezone(zone) do
    :rpc.call(:dpi_console@localhost, Dpi.Api.Store, :put, [:timezone, zone])
  end
end
