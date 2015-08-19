#!/usr/bin/env ruby

require 'CSV'
require 'time'
require 'table_print'
require 'methadone'
require 'paint'
require 'paint/pa'

include Methadone::Main
include Methadone::CLILogging

calls = []

main do |dir_path|
  files = []
  Dir.foreach(dir_path) do |item|
    next if item == '.' or item =='..' or item=='.DS_Store'
    files.push("#{dir_path}/#{item}")
  end

  puts "#{Paint['Processing', :bright, "orange"]} #{Paint[files.count, "snow"]} #{Paint['files in', :bright, "orange"]} #{Paint[dir_path, "snow"]} #{Paint['directory.', :bright, "orange"]}"
  puts

  files.each do |f|
    puts "#{Paint['Working on: ', "snow"]} #{Paint[f, :blue]}"
    CSV.foreach(f, :headers => false) do |row|
        next if row[9].nil? || row[10].nil?
      date = Time.parse(row[0])
      connect_time = Time.parse(row[9]).strftime("%l:%M:%S %p")
      disconnect_time = Time.parse(row[10]).strftime("%l:%M:%S %p")
      seconds = row[30]/1000
      voice_tx_duration = Time.at(seconds).strftime("%H:%M:%S")
      calls << {:user => if row[122].empty?; "UNKNOWN" else row[122] end, :date => date.strftime("%A %e, %B %Y"), :call => row[13], :start_time => connect_time, :end_time => disconnect_time, :call_duration => voice_tx_duration}
    end
    puts "Data for: #{calls.each { |h| h[:date]}.uniq}"

    tp calls
    calls = []
  end

end

version     '0.0.1'
description 'Parse Cisco UC540 CDR files, and display meaningful data in table format'
arg         :dir_path, :required


go!
