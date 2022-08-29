defmodule PocOban.Repo.Migrations.AddObanJobsTable do
  use Ecto.Migration

  def up do
    Oban.Migrations.up(version: 11)
  end

  def down do
    Oban.Migrations.up(version: 1)
  end
end
