#!/usr/bin/env ruby
puts ARGV[0].scan(/((?<=[fro]m:)(\+1)?(\d{10,11})|(Google))+((?<=[t]o:)(\+1)(\d{10,11}))+((?<=[fla]gs:)-1:0:-1:0:-1)/).join(",")
