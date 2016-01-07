module ListsHelper
  def list_management(list)
    if user_signed_in? && list.user == current_user
      link_to("Delete list", list, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger btn-xs")
    end
  end

  def new_list_button
    link_to("New List", new_list_path, class: "btn btn-primary") if user_signed_in?
  end

  def edit_button_for(list)
    if user_signed_in? && list.user == current_user
      link_to("Edit List", edit_list_path(list), class: "btn btn-primary")
    end
  end

  def favorite_list_button(list)
    return nil if user_signed_in? || list.user == current_user
    if current_user.favorited?(list)
      link_to("Unfavorite List", "/lists/#{list.id}/unfavorite", class: "btn btn-default")
    else
      link_to("Favorite List", "/lists/#{list.id}/favorite", class: "btn btn-default")
    end
  end
end
