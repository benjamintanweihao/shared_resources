defmodule SharedResources.Assets do
  use Amnesia
  require Exquisite

  def resource_index do
    query = Exquisite.match SharedResources.Database.Resource

    response = Amnesia.transaction do 
      Database.Resource.select query
    end

    extract_response response
  end
  
  defp extract_response({_, {_, records, _}}) do
    records
  end

  defp extract_response(_) do
    []
  end

end