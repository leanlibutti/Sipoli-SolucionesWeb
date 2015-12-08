class Valorationuser < ActiveRecord::Base
	belongs_to :user
	validates_inclusion_of :valor, in: 1..5
end