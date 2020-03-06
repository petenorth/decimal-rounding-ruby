#require 'bundler/setup'
#require 'active_record'

#class Thing < ActiveRecord::Base
#end

#ActiveRecord::Base.establish_connection

#ActiveRecord::Base.connection.execute <<-SQL
#  CREATE TABLE IF NOT EXISTS things (
#    fee DECIMAL(6, 2)
#  )
#SQL

#thing = Thing.new(fee: 444.44)
expected = BigDecimal.new('444.44')
#actual = thing.fee
#delta = actual - expected

puts 'Expected    %s' % expected.inspect
#puts 'But got     %s' % actual.inspect
#puts 'Difference  %s' % delta.inspect

