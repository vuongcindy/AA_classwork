require_relative 'item.rb'
class List

    attr_reader :label

    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        label = new_label
    end

    