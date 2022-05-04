class Card

    attr_reader :face_value, :face_down, :backside

    def initialize(face_value)
        @face_value = face_value 
        @face_down = true
        @backside = " "
    end

    def hide
        if @face_down == false
           @face_down = true
           self.backside
        end
    end
    
    def reveal
        if @face_down == true
            @face_down = false
            self.face_value
        end
    end

    def to_s
        if @face_down == false
            self.face_value.to_s
        else
            @backside      
        end
    end

    def ==(card_1)
        self.to_s == card_1.to_s 
    end



end