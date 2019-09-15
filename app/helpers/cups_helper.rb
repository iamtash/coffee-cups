module CupsHelper
    def new_cup_button
        button_to('Sip a Cup', new_cup_path, method: 'get')
    end

    def display_cup_rating(cup)
        "#{cup.user.first_name} rated this cup #{cup.rating.out_of_five}." if cup.rating
    end

    def cup_url(cup)
        user_cup_path(cup.user, cup)
    end
end
