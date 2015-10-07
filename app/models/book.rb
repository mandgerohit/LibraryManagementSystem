class Book < ActiveRecord::Base
    serialize :checkout_history
    validates(:isbn, presence: true, uniqueness: { case_sensitive: false },length: {minimum: 0,maximum: 13})
    validates(:title, presence: true, uniqueness: { case_sensitive: false })
    validates(:author, presence: true, uniqueness: { case_sensitive: false })
    validates(:description, presence: true, uniqueness: { case_sensitive: false })
    
    def self.search(query)
    where("title like ? or isbn like ? or author like ? or description like ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%" )
end

end
