require 'stringio'
module Ruboty
  module IntercalGenerator
    module Actions
      class Generate < Ruboty::Actions::Base
        def call
ret=StringIO.new
last=0
siz=message[:text].bytes.to_a.size
please=(siz+3)/4-2
ret.puts "DO ,1 <- ##{siz}"
message[:text].each_byte.with_index{|e,i|
	c = e
	c = (c & 0x55) << 1 | (c & 0xaa) >> 1
	c = (c & 0x33) << 2 | (c & 0xcc) >> 2
	c = (c & 0x0f) << 4 | (c & 0xf0) >> 4
	last2 = c
	c = (last-c)&0xff
	last = last2
	ret.print 'PLEASE ' if i<=please
	ret.puts "DO ,1 SUB ##{i+1} <- ##{c&0xff}"
}
ret.puts 'PLEASE READ OUT ,1'
ret.print 'PLEASE GIVE UP'

          message.reply(ret.string)
        end
      end
    end
  end
end
