class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	validates :image, presence: true
 	validates :title_of_piece, presence: true
 	validates :brand, presence: true
	validates :comment, presence: true

	
	validates :title_of_piece, length: { minimum: 1 }
 	validates :title_of_piece, length: { maximum: 255 }
	validates :brand, length: { minimum: 1 }
  	validates :brand, length: { maximum: 255 }
  	validates :comment, length: { minimum: 1 }
  	validates :comment, length: { maximum: 255 }

  	#validates :password, length: { in: 6..40 }


	def self.search(search)
		
	  if search	
      	where('comment ilike ? OR brand ilike ? OR title_of_piece ilike ?', "%#{search}%", "%#{search}%", "%#{search}%")
	  else
	    scoped
	  end

	end
	has_attached_file :image, :styles => { :medium => "700x700>", :thumb => "100x100>" }
end
