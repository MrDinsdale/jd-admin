defmodule JdAdmin.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  imports other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  @username Application.get_env(:jd_admin, :basic_auth)[:username]
  @password Application.get_env(:jd_admin, :basic_auth)[:password]

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest

      alias JdAdmin.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]

      import JdAdmin.Router.Helpers

      # The default endpoint for testing
      @endpoint JdAdmin.Endpoint
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(JdAdmin.Repo, [])
    end

    header_content = "Basic " <> Base.encode64("#{@username}:#{@password}")

    conn_with_header = Phoenix.ConnTest.conn()
    |> Plug.Conn.put_req_header("authorization", header_content)

    {:ok, conn: conn_with_header}
  end
end
