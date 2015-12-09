class Couch < ActiveRecord::Base       		            		

	validates_exclusion_of :capacidad, in:-100000...1

	validates :nombre,
    			        presence:true,
            			format: { with: /\A[a-zA-Z ]+\z/}
  	validates :descripcion,
            			presence:true
    validates :provincia,
    			        presence:true, 
            			format: { with: /\A[a-zA-Z ]+\z/}
	validates :ciudad,
    			        presence:true, 
            			format: { with: /\A[a-zA-Z ]+\z/}    


	belongs_to :user
	belongs_to :category
    has_many :reservations, dependent: :destroy
    has_many :valorations, dependent: :destroy
    has_many :images, dependent: :destroy

    scope :por_fecha,->{order ("created_at desc")}

    scope :por_ciudad,->{order ("ciudad asc")}

end
