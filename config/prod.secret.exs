use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :dnsapp, DnsappWeb.Endpoint,
  secret_key_base: "duTrvQsFB5A2PHHMEJcHaNG5Ay5j/8eppMTitSOBbU2pNsIw1InOjgCMCTRz4260"

# Configure your database
config :dnsapp, Dnsapp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "dnsapp_prod",
  pool_size: 15
