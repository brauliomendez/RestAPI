defmodule Tapuma.Travels do
  @moduledoc """
  The Travels context.
  """

  import Ecto.Query, warn: false
  alias Tapuma.Repo

  alias Tapuma.Travels.Travel

  @doc """
  Returns the list of travels.

  ## Examples

      iex> list_travels()
      [%Travel{}, ...]

  """
  def list_travels do
    Repo.all(Travel)
  end

  @doc """
  Gets a single travel.

  Raises `Ecto.NoResultsError` if the Travel does not exist.

  ## Examples

      iex> get_travel!(123)
      %Travel{}

      iex> get_travel!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel!(id), do: Repo.get!(Travel, id)

  @doc """
  Creates a travel.

  ## Examples

      iex> create_travel(%{field: value})
      {:ok, %Travel{}}

      iex> create_travel(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel(attrs \\ %{}) do
    %Travel{}
    |> Travel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel.

  ## Examples

      iex> update_travel(travel, %{field: new_value})
      {:ok, %Travel{}}

      iex> update_travel(travel, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel(%Travel{} = travel, attrs) do
    travel
    |> Travel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Travel.

  ## Examples

      iex> delete_travel(travel)
      {:ok, %Travel{}}

      iex> delete_travel(travel)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel(%Travel{} = travel) do
    Repo.delete(travel)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel changes.

  ## Examples

      iex> change_travel(travel)
      %Ecto.Changeset{source: %Travel{}}

  """
  def change_travel(%Travel{} = travel) do
    Travel.changeset(travel, %{})
  end
end
