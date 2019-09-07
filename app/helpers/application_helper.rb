module ApplicationHelper
    def error_msgs(obj, attr)
        obj.errors.full_messages_for(attr).first
    end
end


