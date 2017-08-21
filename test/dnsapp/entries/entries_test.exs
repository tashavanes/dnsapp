defmodule Dnsapp.EntriesTest do
  use Dnsapp.DataCase

  alias Dnsapp.Entries

  describe "records" do
    alias Dnsapp.Entries.Record

    @valid_attrs %{expires: ~D[2010-04-17], hostname: "some hostname", type: "some type"}
    @update_attrs %{expires: ~D[2011-05-18], hostname: "some updated hostname", type: "some updated type"}
    @invalid_attrs %{expires: nil, hostname: nil, type: nil}

    def record_fixture(attrs \\ %{}) do
      {:ok, record} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entries.create_record()

      record
    end

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Entries.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Entries.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      assert {:ok, %Record{} = record} = Entries.create_record(@valid_attrs)
      assert record.expires == ~D[2010-04-17]
      assert record.hostname == "some hostname"
      assert record.type == "some type"
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entries.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      assert {:ok, record} = Entries.update_record(record, @update_attrs)
      assert %Record{} = record
      assert record.expires == ~D[2011-05-18]
      assert record.hostname == "some updated hostname"
      assert record.type == "some updated type"
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Entries.update_record(record, @invalid_attrs)
      assert record == Entries.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Entries.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Entries.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Entries.change_record(record)
    end
  end
end
