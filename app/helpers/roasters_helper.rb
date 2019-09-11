module RoastersHelper
    def roaster_link(roaster)
        link_to(roaster.name, roaster_path(roaster))
    end
end
