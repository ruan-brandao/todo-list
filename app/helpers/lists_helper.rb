module ListsHelper
  def list_management(list)
    if user_signed_in? && list.user == current_user
      link_to("Edit list", edit_list_path(list)) + " | " + 
      link_to("Delete list", list, method: :delete, data: { confirm: 'Are you sure?' })
    end
  end
end
