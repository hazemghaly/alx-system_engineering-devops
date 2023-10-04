#!/usr/bin/env ruby
puts ARGV[0].scan(/[(\+1)?(^\d{11}$)?(\w)],[(\+1)?(^\d{11}$)],[]/).join
