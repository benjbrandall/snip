#!/usr/bin/env ruby

require 'clipboard'

PATH = '/home/benjamin/Documents/Snippets/'
EXTENSION = '.txt'

def read_file_contents(filename)
    full_path = "#{PATH}#{filename}#{EXTENSION}"
    file = File.open(full_path, 'r')
    file.read
end

def list_snippets
    puts `ls #{PATH}`
end

if ARGV[0] == "-l"
    list_snippets
    exit
elsif ARGV[0] == "-n"
    system "vim #{PATH}#{ARGV[1]}#{EXTENSION}"
else
    snippet = read_file_contents(ARGV[0])
end

unless snippet.nil?
    Clipboard.copy(snippet.chomp)
    exit
else
    puts "Snippet not found."
end
