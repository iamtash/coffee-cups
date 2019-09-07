module CupsHelper
    def new_cup_button
        button_to('Sip a Cup', new_cup_path, method: 'get')
    end
end
