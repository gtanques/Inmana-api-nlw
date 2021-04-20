defmodule Inmana.Restaurants.Create do

  alias Inmana.{Repo, Restaurant}

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handler_insert()
  end

  defp handler_insert({:ok, %Restaurant{}} = result), do: result
  defp handler_insert({:error, result }), do: {:error, %{result: result, status: :bad_request}}

end
