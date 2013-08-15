defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn = conn.fetch([:cookies, :params])
    conn.assign :layout, "application_layout"
  end

  # It is common to break your Dynamo in many
  # routers forwarding the requests between them
  forward "/resources", to: ResourceRouter

  get "/" do
    redirect conn, to: "/resources"
  end
  
  post "/check-in/:id" do
    conn = conn.assign(:resources,
                       SharedResources.Assets.resource_index)
    conn.resp 200, Jsonex.encode [check_in: id]
  end

  post "/check-out/:id" do
    conn = conn.assign(:resources,
                       SharedResources.Assets.resource_index)
    conn.resp 200, Jsonex.encode [check_out: id]
  end
end
