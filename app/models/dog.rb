class Dog < ApplicationRecord
    has_many :employees
end

# pets.max_by {|i| pets.count(i)}
# Dog.all.sort_by {|dog| dog.employees.count}.reverse