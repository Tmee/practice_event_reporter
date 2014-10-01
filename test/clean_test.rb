# gem 'minitest', '~> 5.2'
# require 'minitest/autorun'
# require 'minitest/pride'
# require_relative '../lib/clean.rb'

# class CleanTest < Minitest::Test
# 	def test_it_cleans_first_name
# 		Clean.clean_first_name("Billy")
# 		assert_equal "billy"
# 	end

# 	def test_it_cleans_last_name
# 		Clean.clean_last_name("Smith")
# 		assert_equal "smith"
# 	end

# 	def test_it_cleans_phone
# 		Clean.clean_phone("876-3913")
# 		assert_equal "000-000-0000"
# 	end

# 	def test_it_cleans_zipcode
# 		Clean.clean_zipcode("896")
# 		assert_equal "00896"
# 	end

# 	def test_it_cleans_city
# 		Clean.clean_city("philAdelphia")
# 		assert_equal "philadelphia"
# 	end

# 	def test_it_cleans_state
# 		Clean.clean_state("PA")
# 		assert_equal "pa"
# 	end
# end