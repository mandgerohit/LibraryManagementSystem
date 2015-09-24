class Book < ActiveRecord::Base
serialize :checkout_history 

def self.search(query)
  where("title like ? or isbn like ? or author like ? or description like ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%" ) 
end

end
