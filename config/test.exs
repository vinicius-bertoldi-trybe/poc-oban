import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :poc_oban, PocOban.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "poc_oban_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :poc_oban, PocObanWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Ls3v3Z0pGiSYprqXK1CJ1lzZQpe4yIhjhlQHXQRotpovkKD1R+P3G4W7MtJIGk32",
  server: false

# In test we don't send emails.
config :poc_oban, PocOban.Mailer, adapter: Swoosh.Adapters.Test

# Config Oban do test environment
config :poc_oban, Oban, testing: :inline

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
