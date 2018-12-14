defmodule Tapuma.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Tapuma.Repo

  alias Tapuma.Users.People

  @doc """
  Returns the list of people.

  ## Examples

      iex> list_people()
      [%People{}, ...]

  """
  def list_people do
    Repo.all(People)
  end

  @doc """
  Gets a single people.

  Raises `Ecto.NoResultsError` if the People does not exist.

  ## Examples

      iex> get_people!(123)
      %People{}

      iex> get_people!(456)
      ** (Ecto.NoResultsError)

  """
  def get_people!(id), do: Repo.get!(People, id)

  @doc """
  Creates a people.

  ## Examples

      iex> create_people(%{field: value})
      {:ok, %People{}}

      iex> create_people(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_people(attrs \\ %{}) do
    %People{}
    |> People.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a people.

  ## Examples

      iex> update_people(people, %{field: new_value})
      {:ok, %People{}}

      iex> update_people(people, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_people(%People{} = people, attrs) do
    people
    |> People.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a People.

  ## Examples

      iex> delete_people(people)
      {:ok, %People{}}

      iex> delete_people(people)
      {:error, %Ecto.Changeset{}}

  """
  def delete_people(%People{} = people) do
    Repo.delete(people)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking people changes.

  ## Examples

      iex> change_people(people)
      %Ecto.Changeset{source: %People{}}

  """
  def change_people(%People{} = people) do
    People.changeset(people, %{})
  end
end
