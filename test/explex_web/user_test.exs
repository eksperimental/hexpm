defmodule ExplexWeb.UserTest do
  use ExplexWebTest.Case

  alias ExplexWeb.User

  test "create user and auth" do
    assert { :ok, User.Entity[] } = User.create("eric", "hunter42")
    assert User.get("eric") |> User.auth?("hunter42")
  end

  test "create user and fail auth" do
    assert { :ok, User.Entity[] } = User.create("eric", "erics_pass")
    refute User.get("josé") |> User.auth?("erics_pass")
    refute User.get("eric") |> User.auth?("wrong_pass")
  end
end
