# MIT License

# Copyright (c) 2016 Josep Boluda

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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




