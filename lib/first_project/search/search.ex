defmodule FirstProject.Search do
  defstruct [:sku]
  @types %{sku: :string}
  import Ecto.Changeset

  def change_search(%__MODULE__{} = search, attrs \\ %{}) do
    changeset(search, attrs)
  end

  def changeset(%__MODULE__{} = search, attrs) do
    {search, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:sku])
    |> validate_length(:sku, is: 7, message: "must have at least 7 characters")
  end
end
