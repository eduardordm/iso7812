
##
#
# The ISO/IEC 7812 specifies a numbering system for the identification of issuers of cards 
# that require an issuer identification number (IIN) to operate in international, 
# interindustry and/or intra-industry interchange.
#
module Iso7812
  
  module CardNumber
  	##
  	# The Structure of a card
  	#
  	#  POS    | DESCRIPTION
  	#  --------------------
  	# 	0 		| MII
  	#   0..5 	| IIN
  	#   6..n  | IAI (max length = 12)
  	#   n+1 	| Check digit
  	#  

  	# Generates a valid card number based on the parameters given
  	# IIN - Issuer Identification Number
  	# IAI - Individual Account Identificaation
  	def generate(iin, iai) 
  		p = "#{iin}#{iai}" 
  		"#{p}#{checkdigit(p).to_s}"
  	end

  	# Returns true if card number is valid
  	# PAN - Primary Account Number (card number)
  	#
  	# This code is written to convey clarity.
  	def valid?(pan)
			# must be numbers
			return false unless pan =~ /^[0-9]+$/

			# 8 is the minimum size 
			return false unless pan.length > 7 

			# 19 is maximum size
			return false unless pan.length < 20

			# check digit
			return pan[pan.length-1] == checkdigit(pan.chop).to_s
  	end

  	# Returns the IIN of this PAN
  	# IIN - Issuer Identification Number
		# PAN - Primary Account Number (card number)
  	def iin(pan)
  		pan[0..5]
  	end

  	# Returns the MII of this PAN or IIN
  	# IIN - Issuer Identification Number
		# PAN - Primary Account Number (card number)
		# MII - Major Industry Identifier
		#
		# There are ten single-digit MIIs:
		# 0 for assignment by ISO/TC 68 and for other future industry assignments
		# 1 airlines
		# 2 airlines and other future industry assignments
		# 3 travel and entertainment and banking/financial
		# 4 banking/financial
		# 5 banking/financial
		# 6 merchandising and banking/financial
		# 7 petroleum and other future industry assignments
		# 8 healthcare, telecommunications and other future industry assignments
		# 9 for assignment by national standards bodies
		# New industry assignments shall be approved by the RMG.
		# The MII does not in any way reflect or limit the application in which the card is usable. 
		# Single-digit MIIs are assigned using the applicant’s description of their main area of business 
		# on the application form (see Annex A of ISO/IEC 7812-2:2000).
  	def mii(pan_or_iin)
  		pan_or_iin[0]
  	end

		# The individual account identification shall be followed by a check digit. 
		# This digit shall be calculated on all the preceding digits of the PAN 
		# and shall be computed according to the Luhn formula for modulus-10 check digit.
  	def checkdigit(number)
			digits = number.to_s.reverse.scan(/\d/).map { |x| x.to_i }
			digits = digits.each_with_index.map { |d, i|
			  d *= 2 if i.even?
			  d > 9 ? d - 9 : d
			}
			sum = digits.inject(0) { |m, x| m + x }
			mod = 10 - sum % 10
			mod==10 ? 0 : mod
  	end


  end

end
