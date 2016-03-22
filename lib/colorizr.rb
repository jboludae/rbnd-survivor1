
class String

	@@color_mapping = {
	red: "31m",
	green: "32m",
	yellow: "33m",
	blue: "34m",
	pink: "35m",
	light_blue: "94m",
	white: "97m",
	light_grey: "92m",
	black: "30m"
	}
	# TO REVIEWER: IS THERE ANY WAY I COULD
	# HAVE USED A BLOCK INSTEAD OF A STRING
	# INTERPOLATION
	def self.create_colors
		@@color_mapping.each do |color, code|
			self.class_eval(%Q{
				def #{color}
					'\e[#{code}'+self+'\e[0m'
				end
			})
		end
	end

	def self.colors
		@@color_mapping.keys
	end
	# TO REVIEWER: IS THERE ANY ALTERNATIVE WAY
	# I COULD HAVE SOLVED THIS?
	def self.sample
		@@color_mapping.each do |color, code|
			puts "This is \e[#{code}"+color.to_s+"\e[0m"
		end
	end
end

# TO REVIEWER: IS IT GOOD PRACTICE TO RUN THIS
# HERE OR SHOULD I RUN IT IN THE FILE I "REQUIRE"
# THIS GEM?
String.create_colors




