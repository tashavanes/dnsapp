defmodule DnsappWeb.PageController do
  use DnsappWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
