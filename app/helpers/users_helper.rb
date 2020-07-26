module UsersHelper
    def display_notice
        if notice
            flash.notice
        end
    end
end
