defmodule PocOban.Jobs.LogData do
  use Oban.Worker

  alias Oban.Job

  @impl Oban.Worker
  def perform(%Job{} = job) do
    IO.puts("\n=====> Data to be logged")
    IO.inspect(job)

    IO.puts("\n=====> Logging data...")
    :timer.sleep(2000)

    IO.puts("\n=====> Data Logged")

    :ok
  end
end
