defmodule DnsappWeb.RecordController do
  use DnsappWeb, :controller

  alias Dnsapp.Entries
  alias Dnsapp.Entries.Record

  def index(conn, _params) do
    records = Entries.list_records()
    render(conn, "index.html", records: records)
  end

  def new(conn, _params) do
    changeset = Entries.change_record(%Record{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"record" => record_params}) do
    case Entries.create_record(record_params) do
      {:ok, record} ->
        conn
        |> put_flash(:info, "Record created successfully.")
        |> redirect(to: record_path(conn, :show, record))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    record = Entries.get_record!(id)
    render(conn, "show.html", record: record)
  end

  def edit(conn, %{"id" => id}) do
    record = Entries.get_record!(id)
    changeset = Entries.change_record(record)
    render(conn, "edit.html", record: record, changeset: changeset)
  end

  def update(conn, %{"id" => id, "record" => record_params}) do
    record = Entries.get_record!(id)

    case Entries.update_record(record, record_params) do
      {:ok, record} ->
        conn
        |> put_flash(:info, "Record updated successfully.")
        |> redirect(to: record_path(conn, :show, record))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", record: record, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    record = Entries.get_record!(id)
    {:ok, _record} = Entries.delete_record(record)

    conn
    |> put_flash(:info, "Record deleted successfully.")
    |> redirect(to: record_path(conn, :index))
  end
end
