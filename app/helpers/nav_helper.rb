module NavHelper
  def display_signin
    link_to 'Sign in', login_path, class: 'nav-link' if !logged_in?
  end

  def display_register
    link_to 'Register', new_user_path, class: 'nav-link shift' if !logged_in?
  end

  def display_new_article
    link_to 'New Article', new_article_path, class: 'nav-link' if logged_in?
  end

  def display_current_user
    link_to current_user.name, user_path(current_user), class: 'nav-link' if logged_in?
  end

  def display_logout
    link_to 'Log out', logout_path, method: :delete, class: 'nav-link shift' if logged_in?
  end
end
