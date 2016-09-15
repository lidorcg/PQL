# use_grammar.rb
require 'rubygems'
require 'treetop'
Treetop.load 'my_grammar'
# or just:
# require 'my_grammar'
# This works because Polyglot hooks "require" to find and load Treetop files

parser = MyGrammarParser.new
puts parser.parse('asd123') # => Treetop::Runtime::SyntaxNode
puts parser.parse('abc123').text_value # => Treetop::Runtime::SyntaxNode
