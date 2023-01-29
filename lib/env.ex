defmodule Dpi.Api.Env do
  def in_rt(), do: System.get_env("DPI_RT") == "true"
  def in_nerves(), do: System.get_env("DPI_NERVES") == "true"
  def node_remote(), do: System.get_env("DPI_NODE") |> String.to_atom()
  def node_name(), do: System.get_env("DPI_NAME") |> String.to_atom()
  def app_name(), do: System.get_env("DPI_APP") |> String.to_atom()
  def cookie(), do: System.get_env("DPI_COOKIE") |> String.to_atom()
  def data(), do: path() |> String.replace_suffix(".lib", ".data")
  def path(), do: System.get_env("DPI_PATH")
end
