module CoffeesHelper
    def coffee_link(coffee)
        link_to(coffee.name, roaster_coffee_path(coffee.roaster, coffee))
    end
end
