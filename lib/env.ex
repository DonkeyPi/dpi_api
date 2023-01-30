defmodule Dpi.Api.Env do
  def rt?(), do: System.get_env("DPI_RT") == "true"
  def nerves?(), do: System.get_env("DPI_NERVES") == "true"
  def node_root(), do: System.get_env("DPI_ROOT") |> String.to_atom()
  def node_name(), do: System.get_env("DPI_NODE") |> String.to_atom()
  def app_name(), do: System.get_env("DPI_NAME") |> String.to_atom()
  def cookie(), do: System.get_env("DPI_COOKIE") |> String.to_atom()
  def boardid(), do: System.get_env("DPI_BID")
  def path(), do: System.get_env("DPI_PATH")
  def data(), do: System.get_env("DPI_DATA")
end
