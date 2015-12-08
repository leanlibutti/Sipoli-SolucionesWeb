class Earn < ActiveRecord::Base

		def validate_fech
  		if (fech_ing == fech_egr) || (fech_egr < fech_ing)
  			if (fech_ing == fech_egr)
    		  errors.add(:fech_ing, 'La fecha de ingreso es igual a la fecha de egreso')
    		else
    			errors.add(:fech_ing, 'La fecha de ingreso es menor que la fecha de egreso')
    		end
  		end
  	end

	def validate_fech_actual_ing
    	if (fech_ing != nil)
      		if (DateTime.now.to_date > fech_ing )
        		errors.add(:fech_ing, "La fecha de ingreso debe ser mayor a la actual.")
      		end
    	end
	end
end
