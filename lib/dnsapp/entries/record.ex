defmodule Dnsapp.Entries.Record do
  use Ecto.Schema
  import Ecto.Changeset
  alias Dnsapp.Entries.Record


  schema "records" do
    field :expires, :date
    field :hostname, :string
    field :type, :string
    field :ip_addr, :string

    timestamps()
  end

  @doc false
  def changeset(%Record{} = record, attrs) do
    record
    |> cast(attrs, [:hostname, :type, :ip_addr, :expires])
    |> validate_required([:hostname, :type, :ip_addr, :expires])
  end
end
