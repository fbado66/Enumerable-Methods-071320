require 'pry'

zoos = {
    "Bronx Zoo" => {
        location: "Bronx",
        price: 25,
        weekend: true,
        animals: [
            {
                species: "Penguin",
                count: 2
            },
            {
                species: "Butterfly",
                count: 12
            },
            {
                species: "Tiger",
                count: 3
            }
        ]
    },
    "Central Park Zoo" =>  {
        location: "Manhattan",
        price: 18,
        weekend: true,
        animals: [
            {
                species: "Tiger",
                count: 1
            },
            {
                species: "Monkey",
                count: 7
            }
        ]
    },
    "Staten Island Zoo" => {
        location: "Staten Island",
        price: 10,
        weekend: false,
        animals: [
            {
                species: "Gorilla",
                count: 3
            },
            {
                species: "Monkey",
                count: 4
            },
            {
                species: "Elephant",
                count: 2
            },
            {
                species: "Bird",
                count: 6
            }
        ]
    }
}

# Central Park Zoo has just received 4 wolves. Alter the `zoos` information to reflect this new change:
# Put this hash: { species: "Wolf", count: 4 } in the array under the `:animals` key in Central Park Zoo

new_species_wolf = { species: "Wolf", count: 4 }
zoos["Central Park Zoo"][:animals] << new_species_wolf
# pp zoos

# The 2 penguins in the Bronx Zoo just had a baby. Alter the `zoos` information to reflect this new change:
# Increment the number for the `:count` key in the "Penguin" hash in the Bronx Zoo array by 1. 
# You can assume that the animal at index 0 will always be the "Penguin" hash.

 zoos["Bronx Zoo"][:animals][0][:count] += 1 
# p zoos["Bronx Zoo"][:animals][0]


# Each of the zoos in the city just received 2 pandas. Alter the `zoos` information to reflect this new change:
# In the array of animals under each Zoo, shovel this hash: { species: "Panda", count: 2 }

panda = { species: "Panda", count: 2 }
zoos.each do |key, value|
     value[:animals] << panda
#  binding.pry
end

#  pp zoos

# Return the number of Tigers at the Bronx Zoo.
# Rather than assuming that the animal at index 2 will always be the "Tiger" hash:
# First find the "Tiger" hash from the array of Animals at the Bronx Zoo and then, access the value under the ":count" key

tiger_hash = zoos["Bronx Zoo"][:animals].find {|element| element[:species] == "Tiger"}
# p tiger_hash[:count]

# Generalize the process to find the ticket price of a specific zoo.
# In other words, you're given a `name_of_zoo` variable that is a string.
# Return the price associated with the `name_of_zoo` variable.

# No matter which 1 of the 3 variable assignment you choose, your code should work:
# name_of_zoo = "Bronx Zoo" # => returns 25
# name_of_zoo = "Central Park Zoo" # => returns 18
# name_of_zoo = "Staten Island Zoo" # => returns 10

# find_the_ticket = zoos[name_of_zoo][:price]
  
# p find_the_ticket

# Return the sum of all the zoos' price. 
# The return value should be: 53 
total_value = 0
zoos.each do |key, value|
    price = value[:price]
    total_value += price
    total_value
end

# Return an array of all the locations where the zoos are located.
# The return value should be an array of strings: ["Bronx", "Manhattan", "Staten Island"]
# Consider which higher-level enumerable method(s) you'd use here.

location_array = zoos.map do |key, value|
    value[:location]
end

# p location_array

# Find all the zoos that are open on the weekend. 
# The return value should be a hash with two keys: ["Bronx Zoo", "Central Park Zoo"]
# Consider which higher-level enumerable method(s) you'd use here.

weekend_zoo = []
zoos.select do |key, value|
    if value[:weekend] == true
        weekend_zoo << key
    end
end
#  p weekend_zoo

# Find the first zoo that are open on the weekend AND has the price under 20 dollars.
# The return value should be an array with two elements: ["Central Park Zoo", { location: "Manhattan", ... }]
# Consider which higher-level enumerable method(s) you'd use here.

array1 = []
zoos.select do |key, value|
    if value[:weekend] == true && value[:price] < 20
        array1 << key
        array1 << value
    end
    # binding.pry
end
# pp array1


# Find all the zoos where there are monkeys.
# The return value should be a hash with two keys: ["Central Park Zoo", "Staten Island Zoo"]
# Consider which higher-level enumerable method(s) you'd use here.
have_monkey = []
zoos.map do |key, value| 
    value[:animals].each do |inner_key, inner_value|
        if inner_key[:species] == "Monkey"
        have_monkey << key
        end
        # binding.pry
    end 
end
# p have_monkey

# Return an array of 3 numbers, each describing the total sum of the number of animals in a zoo.
# The return value should be an array of 3 numbers: [20, 14, 17]
# Consider which higher-level enumerable method(s) you'd use here.
array_of_3nums = []
bronx_total = 0
central_total = 0
si_total = 0

zoos.each do |key, value|
    if key == "Bronx Zoo"
        value[:animals].count do |animal|
           bronx_total += animal[:count]
        end
    end
    if key == "Central Park Zoo"
        value[:animals].count do |animal|
           central_total += animal[:count]
        end
    end
    if key == "Staten island Zoo"
        value[:animals].count do |animal|
           si_total += animal[:count]
        end
    end
    array_of_3nums = bronx_total, central_total, si_total
end
# p array_of_3nums

# Find the zoo with the highest count of any species in it. (Butterflies with the 12 count is the highest)
# The return value should be an array with two elements: ["Bronx Zoo", { location: "Bronx", ... }]
# Consider which higher-level enumerable method(s) you'd use here.

array_zoo_butterfly = []
highest_value = 0
zoos.select do |key, value|
    value[:animals].select do |animal|
        if highest_value < animal[:count]
            highest_value = animal[:count]
            array_zoo_butterfly << key
            array_zoo_butterfly << value
        end
        if array_zoo_butterfly.size > 1
            break
        end
    end
end
# pp array_zoo_butterfly



