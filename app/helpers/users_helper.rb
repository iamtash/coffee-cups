module UsersHelper
    def youve_or_other(current_user)
        current_user == @user ? "you've" : "#{@user.first_name} has"
    end

    def who_hasnt(current_user)
        current_user == @user? "You haven't" : "#{@user.first_name} hasn't"
    end

    def user_link(user)
        link_to(user.first_name, user)
    end
end
