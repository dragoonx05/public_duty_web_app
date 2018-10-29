module UsersHelper

    def admin?(role)
        role == "Administrator"
    end
end
