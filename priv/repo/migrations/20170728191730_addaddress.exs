defmodule Dnsapp.Repo.Migrations.Addaddress do
  use Ecto.Migration

  def up do
   alter table(:records)   do
    add :ip_addr, :string
    end
  end

  def down do
   alter table(:records) do
    remove :ip_addr
    end
  end
end
