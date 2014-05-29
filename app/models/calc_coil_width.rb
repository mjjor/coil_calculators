class CalcCoilWidth < ActiveRecord::Base
	
	attr_accessor :thickness, :web, :leg, :flange, :studCoilWidth, :trackCoilWidth,
	              :studSqftPerFoot, :trackSqFtPerFoot, :studSqftWeight, :trackSqFtWieght         

	validates_numericality_of :thickness
	validates_numericality_of :web
    validates_numericality_of :leg
	validates_numericality_of :flange

end
