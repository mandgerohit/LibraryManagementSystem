class Book < ActiveRecord::Base
serialize :checkout_history 
end
