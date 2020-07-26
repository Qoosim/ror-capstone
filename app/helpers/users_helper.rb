module UsersHelper
  def display_notice
    flash.notice if notice
  end
end
