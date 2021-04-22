defmodule Inmana.Supplies.Create do

  alias Inmana.{Repo, Supply}

  def call(params) do
    params
    |> Supply.changeset()
    |> Repo.insert()
    |> handler_insert()
  end

  defp handler_insert({:ok, %Supply{}} = result), do: result
  defp handler_insert({:error, result }), do: {:error, %{result: result, status: :bad_request}}

end
