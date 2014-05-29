class CalcCoilLength < ActiveRecord::Base

	attr_accessor :thickness, :width, :innerDiam, :outerDiam, 
	              :feet, :totalweight, :weight, :sqftPerFootage
	              
	validates_numericality_of :thickness
	
end
