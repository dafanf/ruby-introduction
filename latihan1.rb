# Super class Vehicle
class Vehicle

    # initializing year field
    def initialize(y)
        
        @year = y
    end
    
    # show year to screen
    def printStats

        puts @year
    end

end

# module to check wheter car older than 30 years or not
module OldtimerCheck

    # checking method
    def isOldtimer?(year)

        # .to_i for converting year(string) to integer
        year.to_i < 1992
    end
end

# sub class Car
# extends vehicle class
class Car < Vehicle

    # including OldtimerCheck module to Car class
    # now we can call isOldtimer? to our Car's object
    include OldtimerCheck

    # initializing
    def initialize(model, brand, year)
        
        @model, @brand = model, brand

        # use super for calling superclass(Vehicle) constructor
        super(year)
    end

    def printStats
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
mobilku = Car.new(model, brand, year)
mobilku.printStats

# Call isOldtimer from Module
if mobilku.isOldtimer?(year) == true
    puts "Older than 30 years"
else
    puts "Newer than 30 years"
end