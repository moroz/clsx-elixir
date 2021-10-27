defmodule Clsx do
  @moduledoc """
  Simple helper functions to conditionally determine class names.
  This library is largely inspired by the JavaScript library
  [clsx](https://www.npmjs.com/package/clsx), commonly used in the
  React ecosystem.
  """

  def clsx([]), do: ""

  def clsx(enumerable) when is_list(enumerable) or is_map(enumerable) do
    enumerable
    |> Enum.map(&clsx/1)
    |> Enum.reject(fn el -> el in ["", nil] end)
    |> Enum.join(" ")
  end

  def clsx(string) when is_binary(string), do: string
  def clsx(false), do: ""
  def clsx(nil), do: ""
  def clsx(atom) when is_atom(atom), do: Atom.to_string(atom)
  def clsx({_, falsey}) when falsey in [nil, false], do: ""
  def clsx({name, _}), do: name
end
