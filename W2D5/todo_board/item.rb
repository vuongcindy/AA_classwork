class Item

    attr_reader :title, :deadline, :description

    def self.valid_date?(date_string)
        date_parts = date_string.split("-") # 2022-01-03 returns [2022, 01, 03]

        if date_parts[1].to_i > 12 || date_parts[1].to_i < 01
            return false
        end
        if date_parts[2].to_i > 32 || date_parts[2].to_i < 01
            return false
        end
        true

    end

    def initialize(title, deadline, description)
        @title = title
        if !Item.valid_date?(deadline)
            raise "not a valid date"
        end
        @deadline = deadline
        @description = description
    end

    def title=(new_title)
        title = new_title
    end

   def deadline=(new_deadline)
        deadline = new_deadline
   end

   def description=(new_description)
        description = new_description
   end
end