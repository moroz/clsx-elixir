defmodule Clsx do
  @moduledoc """
  Simple helper functions to conditionally determine class names.
  This library is largely inspired by the JavaScript library
  [clsx](https://www.npmjs.com/package/clsx), commonly used in the
  React ecosystem.
  """

  def clsx(list) when is_list(list) do
    list
    |> Enum.map(&resolve_classes/1)
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" ")
  end

  defp resolve_classes(list) when is_list(list), do: clsx(list)

  defp resolve_classes(map) when is_map(map) do
    map
    |> Enum.filter(fn {_, condition} -> condition end)
    |> Enum.map(fn {name, _} -> to_string(name) end)
    |> Enum.join(" ")
  end

  defp resolve_classes(string) when is_binary(string), do: string
  defp resolve_classes(false), do: nil
  defp resolve_classes(nil), do: nil
  defp resolve_classes(atom) when is_atom(atom), do: Atom.to_string(atom)
  defp resolve_classes({_, falsey}) when falsey in [nil, false], do: nil
  defp resolve_classes({name, _}), do: name
end
