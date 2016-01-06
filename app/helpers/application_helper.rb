module ApplicationHelper
  def login_options
    if user_signed_in?
      link_to 'Sign out', destroy_user_session_path, method: :delete, class: "btn btn-default navbar-btn"
    else
      link_to 'Sign in', new_user_session_path, class: "btn btn-default navbar-btn"
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).build
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to name, "#", onclick: "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"
  end
end
