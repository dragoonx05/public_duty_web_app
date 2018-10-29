module UsersHelper

    def admin?(current_user)
        current_user.role == "Administrator"
    end
end
