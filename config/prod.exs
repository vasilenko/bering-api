use Mix.Config

config :bering, Bering.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: 80],
  secret_key_base: "${ENDPOINT_SECRET_KEY}"

# Do not print debug messages in production
config :logger, level: :info

# Starts the server for all endpoints
config :phoenix, :serve_endpoints, true

# Configures database
config :bering, Bering.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${POSTGRES_URL}",
  pool_size: 20
