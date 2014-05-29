class CoilLengthController < ApplicationController
  
	def  lengthCalc

	end

	def lengthCalcResult
		
		# if params[:outerDiamFrac].split('/').length != 0
        # outerDiamDecIn =  params[:outerDiamFrac].split('/')
        # outerDiamDec   = outerDiamDecIn[0].to_f / outerDiamDecIn[1].to_f
		# @outerDiam     = params[:outerDiamIn].to_f + outerDiamDec.to_f
	    # elsif params[:outerDiamFrac].split('/').length = 0
		# @outerDiam     = params[:outerDiamIn].to_f
        #end

        #if params[:innerDiamFrac].split('/').length != 0
        #innerDiamDecIn =  params[:innerDiamFrac].split('/')
        #innerDiamDec   = innerDiamDecIn[0].to_f / innerDiamDecIn[1].to_f
		#@innerDiam     = params[:innerDiamIn].to_f + innerDiamDec.to_f
        #elsif params[:innerDiamFrac].split('/').length = 0
        #@innerDiam     = params[:innerDiamIn].to_f
        #end
        
        #if params[:widthFrac].split('/').length != 0
		#widthDecIn =  params[:widthFrac].split('/')
        #widthDec   = widthDecIn[0].to_f / widthDecIn[1].to_f   
		#@width     = params[:widthIn].to_f + widthDec.to_f
		#elsif params[:innerDiamFrac].split('/').length = 0
		#@width     = params[:widthIn].to_f
		#end 

		@outerDiam = params[:outerDiamIn].split.map {|r| Rational(r) }.inject(:+).to_f
        @innerDiam = params[:innerDiamIn].split.map {|r| Rational(r) }.inject(:+).to_f
        @width     = params[:widthIn].split.map {|r| Rational(r) }.inject(:+).to_f
        
  		# calc the area of the coil in square inches
    	@area = Math::PI * ((@outerDiam.to_f**2) - (@innerDiam.to_f**2)) / 4
    
		# calc the length of the coil in inches using the area calc'd above
		@length = @area / params[:thickness].to_f
		    
		# convert the length to feet
		@feet = (@length.to_f / 12)
		    
		# calc the squarae footage from the length
		@sqfootage = (@feet.to_f) * (@width.to_f / 12)
		#(divided input by 12 to get feet)
		    
		# calc the weight of a sqft
		@weight = (40.8 * params[:thickness].to_f)
		    
		# calc thex total weight
		@totalWeight = @weight.to_f * @sqfootage.to_f
		    
		# weightx = ((feet / 12) * (widthx / 12) * (thicknessx / 0.0239)
		    
		# sqfootagex = (((feet / 12) * (widthx / 12))

		# @length.text   = [[NSString alloc] initWithFormat:@"%1.2f", feetx];
		# @weight.text   = [[NSString alloc] initWithFormat:@"%1.2f", totalWeightx];
		# @sqft     = [[NSString alloc] initWithFormat:@"%1.2f", sqfootagex];

		redirect_to(:action => 'showLengthResult', :results => [params[:thickness], @width , @innerDiam, @outerDiam, 
			                                                   @feet, @weight, @totalWeight, @sqfootage])
  	end

  	def showLengthResult
  		render('coil_length/lengthResultPage')
  	end

end
