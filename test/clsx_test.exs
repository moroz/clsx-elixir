defmodule ClsxTest do
  use ExUnit.Case
  doctest Clsx

  describe "clsx/1" do
    test "returns empty string when called with nil" do
      assert Clsx.clsx(nil) == ""
    end

    test "returns empty string when called with false" do
      assert Clsx.clsx(false) == ""
    end

    test "returns empty string when called with empty string" do
      assert Clsx.clsx("") == ""
    end

    test "returns empty string when called with an empty array" do
      assert Clsx.clsx([]) == ""
    end

    test "returns single class when called with a string" do
      assert Clsx.clsx("button") == "button"
    end

    test "returns single class when called with a single-element list" do
      assert Clsx.clsx(["button"]) == "button"
    end

    test "returns single class when called with keyword: true" do
      assert Clsx.clsx(button: true) == "button"
    end

    test "returns empty string when called with keyword: false" do
      assert Clsx.clsx(button: false) == ""
    end

    test "returns single class when called with a {binary, true} tuple" do
      assert Clsx.clsx({"card", true}) == "card"
    end

    test "returns empty string when called with a {binary, false} tuple" do
      assert Clsx.clsx({"card", false}) == ""
    end

    test "returns correctly joined classes when called with list of strings" do
      assert Clsx.clsx(["btn", "btn-primary", "btn-wide"]) == "btn btn-primary btn-wide"
    end

    test "returns correctly joined classes when called with list of atoms" do
      assert Clsx.clsx(~w(button is-primary is-large)a) == "button is-primary is-large"
    end

    test "returns correctly joined classes when called with a nested lists of strings" do
      assert Clsx.clsx([["button", "is-primary"], {"is-large", true}]) ==
               "button is-primary is-large"
    end

    test "returns correctly joined classes when called with a map with string keys" do
      assert Clsx.clsx(%{
               "button" => true,
               "is-primary" => true,
               "is-wide" => false
             }) == "button is-primary"
    end

    test "returns correctly joined classes when called with a map with atom keys" do
      assert Clsx.clsx(%{
               card: true,
               hero: false,
               "text-align-center": true
             }) == "card text-align-center"
    end

    test "returns correctly joined classes when called with a string and a map" do
      assert Clsx.clsx(["button", %{"is-primary" => true}]) == "button is-primary"
    end
  end
end
