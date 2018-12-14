defmodule Tapuma.Passengers do
  @moduledoc """
  The Passengers context.
  """

  import Ecto.Query, warn: false
  alias Tapuma.Repo

  alias Tapuma.Passengers.Passenger

  @doc """
  Returns the list of passengers.

  ## Examples

      iex> list_passengers()
      [%Passenger{}, ...]

  """
  def list_passengers do
    Repo.all(from(d in Tapuma.Passengers.Passenger, preload: [:people], preload: [:travels]) )
  end

  @doc """
  Gets a single passenger.

  Raises `Ecto.NoResultsError` if the Passenger does not exist.

  ## Examples

      iex> get_passenger!(123)
      %Passenger{}

      iex> get_passenger!(456)
      ** (Ecto.NoResultsError)

  """
  def get_passenger!(id), do: from(d in Tapuma.Passengers.Passenger, preload: [:people],  preload: [:travels]) |> Repo.get!(id)

  @doc """
  Creates a passenger.

  ## Examples

      iex> create_passenger(%{field: value})
      {:ok, %Passenger{}}

      iex> create_passenger(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_passenger(attrs \\ %{}) do
    %Passenger{}
    |> Passenger.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a passenger.

  ## Examples

      iex> update_passenger(passenger, %{field: new_value})
      {:ok, %Passenger{}}

      iex> update_passenger(passenger, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_passenger(%Passenger{} = passenger, attrs) do
    passenger
    |> Passenger.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Passenger.

  ## Examples

      iex> delete_passenger(passenger)
      {:ok, %Passenger{}}

      iex> delete_passenger(passenger)
      {:error, %Ecto.Changeset{}}

  """
  def delete_passenger(%Passenger{} = passenger) do
    Repo.delete(passenger)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking passenger changes.

  ## Examples

      iex> change_passenger(passenger)
      %Ecto.Changeset{source: %Passenger{}}

  """
  def change_passenger(%Passenger{} = passenger) do
    Passenger.changeset(passenger, %{})
  end
end
