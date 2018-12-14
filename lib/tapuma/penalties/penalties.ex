defmodule Tapuma.Penalties do
  @moduledoc """
  The Penalties context.
  """

  import Ecto.Query, warn: false
  alias Tapuma.Repo

  alias Tapuma.Penalties.Penalty

  @doc """
  Returns the list of penalties.

  ## Examples

      iex> list_penalties()
      [%Penalty{}, ...]

  """
  def list_penalties do
    Repo.all(Penalty)
  end

  @doc """
  Gets a single penalty.

  Raises `Ecto.NoResultsError` if the Penalty does not exist.

  ## Examples

      iex> get_penalty!(123)
      %Penalty{}

      iex> get_penalty!(456)
      ** (Ecto.NoResultsError)

  """
  def get_penalty!(id), do: Repo.get!(Penalty, id)

  @doc """
  Creates a penalty.

  ## Examples

      iex> create_penalty(%{field: value})
      {:ok, %Penalty{}}

      iex> create_penalty(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_penalty(attrs \\ %{}) do
    %Penalty{}
    |> Penalty.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a penalty.

  ## Examples

      iex> update_penalty(penalty, %{field: new_value})
      {:ok, %Penalty{}}

      iex> update_penalty(penalty, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_penalty(%Penalty{} = penalty, attrs) do
    penalty
    |> Penalty.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Penalty.

  ## Examples

      iex> delete_penalty(penalty)
      {:ok, %Penalty{}}

      iex> delete_penalty(penalty)
      {:error, %Ecto.Changeset{}}

  """
  def delete_penalty(%Penalty{} = penalty) do
    Repo.delete(penalty)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking penalty changes.

  ## Examples

      iex> change_penalty(penalty)
      %Ecto.Changeset{source: %Penalty{}}

  """
  def change_penalty(%Penalty{} = penalty) do
    Penalty.changeset(penalty, %{})
  end
end
