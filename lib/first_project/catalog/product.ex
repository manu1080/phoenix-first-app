defmodule FirstProject.Catalog.Product do
  alias FirstProject.Survey.Rating
  use Ecto.Schema
  import Ecto.Changeset
  @types %{sku: :number}

  schema "products" do
    field :name, :string
    field :description, :string
    field :unit_price, :float
    field :sku, :integer
    field :image_upload, :string
    timestamps()
    has_many :ratings, Rating
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :unit_price, :sku, :image_upload])
    |> validate_required([:name, :description, :unit_price, :sku])
    |> unique_constraint(:sku)
    |> validate_number(:unit_price, greater_than: 0.0)
  end

  def changeset_update_unit_price(new_product, product, attrs) do
    new_product
    |> cast(attrs, [:unit_price])
    |> validate_required([:unit_price])
    |> validate_number(:unit_price, greater_than: 0.0)
    |> validate_number(:unit_price, less_than: product.unit_price)
  end

  def changeset_search_sku(product, attrs) do
    product
    |> cast(attrs, [:sku])
    |> validate_required([:sku])
    |> validate_number(:sku, greater_than: 0.0)
    |> validate_change(:sku, required: true)
  end

  def changeset_search_sku(%__MODULE__{} = product, attrs) do
    {product, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:first_skuname])
    |> validate_change(:sku, required: true)
    |> validate_number(:sku, greater_than: 0.0)
  end
end
