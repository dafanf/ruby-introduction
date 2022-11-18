# Super class Vehicle
require 'Date'
class Vehicle
    attr_accessor :year
    # initializing year field
    def initialize(year)
        self.year = year
    end
    
    # show year to screen
    def print_stats()
        puts "Year: #{self.year}"
    end

end

# module to check wheter car older than 30 years or not
module OldtimerCheck

    # checking method
    def isOldtimer?(year)

        # .to_i for converting year(string) to integer
        year.to_i < (Date.today.year-30)
    end
end

# sub class Car
# extends vehicle class
class Car < Vehicle
    attr_accessor :model, :brand
    # including OldtimerCheck module to Car class
    # now we can call isOldtimer? to our Car's object
    include OldtimerCheck

    # initializing
    def initialize(model, brand, year)
        self.model = model
        self.brand = brand
        # use super for calling superclass(Vehicle) constructor
        super(year)
    end

    def print_stats()
        puts ("Specification :\nModel : #{@model.chomp} \nBrand : #{@brand.chomp} \nYear : #{@year}")
    end
end

# main
print ("insert year : ") 
year = gets 

print ("insert model : ")
model = gets

print ("insert brand : ")
brand = gets

# create new Car object
newCar = Car.new(model, brand, year)
newCar.print_stats

# Call isOldtimer from Module
if newCar.isOldtimer?(year) == true
    puts "Older than 30 years"
else
    puts "Newer than 30 years"
end