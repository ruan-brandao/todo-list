module ApplicationHelper
  def login_options
    if user_signed_in?
      link_to 'Sign out', destroy_user_session_path, method: :delete, class: "btn btn-default navbar-btn"
    else
      link_to 'Sign in', new_user_session_path, class: "btn btn-default navbar-btn"
    end
  end
end
