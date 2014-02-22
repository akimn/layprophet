class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	validates :image, presence: true
 	validates :title_Of_Piece, presence: true
 	validates :brand, presence: true
	validates :comment, presence: true

	
	validates :title_of_piece, length: { minimum: 1 }
 	validates :title_of_piece, length: { maximum: 255 }
	validates :brand length: { minimum: 1 }
  	validates :brand length: { maximum: 255 }
  	validates :comment, length: { minimum: 1 }
  	validates :comment, length: { maximum: 255 }

  	validates :password, length: { in: 6..40 }
end



	def self.search(search)
		
	  if search	
      	where('comment ILIKE ? OR "church_name" ILIKE ? OR "pastor_or_worship_leader_name" ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
	  else
	    scoped
	  end

	end
	has_attached_file :image, :styles => { :medium => "700x700>", :thumb => "100x100>" }
end
