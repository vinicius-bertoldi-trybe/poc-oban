defmodule PocObanWeb.PageController do
  use PocObanWeb, :controller

  alias PocOban.Jobs.LogData

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    conn =
      case params |> LogData.new() |> Oban.insert() do
        {:ok, _job} -> put_flash(conn, :info, "Job agendado")
        {:error, _reason} -> put_flash(conn, :error, "Problemas para agendas o Job")
      end

    render(conn, "index.html")
  end
end
