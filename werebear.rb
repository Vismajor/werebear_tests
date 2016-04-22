class WereBear

  attr_reader :name, :clothes, :belly

  def initialize(name)
    @name = name
    @clothes = []
    @belly = []
    @intolerances = ["cheese", "cream", "milk"]
  end

  def eat(food)
    @belly.push(food) unless intolerant?(food)
  end

  def intolerant?(food)
    for item in @intolerances
     return true if food.include?(item)
    end
    return false
  end

  def add_clothes(*clothes)
    for item in clothes
      @clothes.push(item)
    end
  end

  def check_outfit
    return "#{@name} is naked! Oh noes!" if @clothes.length == 0
    pretty_string = "#{@name} is currently wearing a "
    index = 0
    for item in @clothes
      if index == 0
        pretty_string += item
      elsif index == (@clothes.length - 1)
        pretty_string += " and a #{item}"
      else
        pretty_string += ", a #{item}"
      end
        index += 1
    end
    return pretty_string
  end
end