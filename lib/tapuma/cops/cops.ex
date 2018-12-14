defmodule Tapuma.Cops do
  @moduledoc """
  The Cops context.
  """

  import Ecto.Query, warn: false
  alias Tapuma.Repo

  alias Tapuma.Cops.Cop

  @doc """
  Returns the list of cops.

  ## Examples

      iex> list_cops()
      [%Cop{}, ...]

  """
  def list_cops do
    Repo.all(Cop)
  end

  @doc """
  Gets a single cop.

  Raises `Ecto.NoResultsError` if the Cop does not exist.

  ## Examples

      iex> get_cop!(123)
      %Cop{}

      iex> get_cop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cop!(id), do: Repo.get!(Cop, id)

  @doc """
  Creates a cop.

  ## Examples

      iex> create_cop(%{field: value})
      {:ok, %Cop{}}

      iex> create_cop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cop(attrs \\ %{}) do
    %Cop{}
    |> Cop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cop.

  ## Examples

      iex> update_cop(cop, %{field: new_value})
      {:ok, %Cop{}}

      iex> update_cop(cop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cop(%Cop{} = cop, attrs) do
    cop
    |> Cop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cop.

  ## Examples

      iex> delete_cop(cop)
      {:ok, %Cop{}}

      iex> delete_cop(cop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cop(%Cop{} = cop) do
    Repo.delete(cop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cop changes.

  ## Examples

      iex> change_cop(cop)
      %Ecto.Changeset{source: %Cop{}}

  """
  def change_cop(%Cop{} = cop) do
    Cop.changeset(cop, %{})
  end
end
