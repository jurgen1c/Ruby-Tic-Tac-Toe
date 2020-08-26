class Player
    attr_reader :name, :icon
    attr_writer :icon
    def initialize(name, icon = nil)
        @name = name
        @icon = icon
    end

    def name_check(@name)
        return !@name.empty?
    end
end
