require 'bundler/setup'
require 'active_record'

class Thing < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection

ActiveRecord::Base.connection.execute <<-SQL
  CREATE TABLE IF NOT EXISTS things (
    fee DECIMAL(6, 2)
  )
SQL

thing = Thing.new(fee: 1.250473853637869)
expected = BigDecimal.new('1.25')
actual = thing.fee
delta = actual - expected
epsilon = BigDecimal.new('0.0001')

if delta.abs > epsilon
  puts 'Expected    %s' % expected.inspect
  puts 'But got     %s' % actual.inspect
  puts 'Difference  %s' % delta.inspect
  exit 1
else
  puts 'OK'
end
