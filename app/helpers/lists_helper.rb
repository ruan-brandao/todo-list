module ListsHelper
  def list_management(list)
    if user_signed_in? && list.user == current_user
      link_to("Delete list", list, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger btn-xs")
    end
  end

  def new_list_button
    link_to("New List", new_list_path, class: "btn btn-primary") if user_signed_in?
  end
end
