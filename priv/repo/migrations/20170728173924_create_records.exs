defmodule Dnsapp.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :hostname, :string
      add :type, :string
      add :expires, :date

      timestamps()
    end

  end
end
