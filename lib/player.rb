class Player
    attr_reader :name, :icon
    attr_writer :icon
    def initialize(name, icon = nil)
        @name = name
        @icon = icon
    end
end
