defmodule HeirarchyWeb.TaGroupView do
  use HeirarchyWeb, :view

  def get_groups(group) do
    Enum.map(group, fn (group) -> [key: group.name, value: group.id] end)
  end
  
end
