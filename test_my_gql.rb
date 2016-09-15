require 'rubygems'
require './tokens'
require 'treetop'
Treetop.load 'my_gql_grammar'

parser = MyGqlGrammarParser.new
# positive tests
# exp
puts parser.parse('{key:{?key,?key:"value"}}'.gsub(/\s+/, ''))
puts parser.parse('
{
  user: {
    ?id,
    ?phone,
    name: "=gal",
    age: ">20"
  }
}'.gsub(/\s+/, '')).token.gen

# puts parser.parse('
# {
#   favorite: {
#     user: {
#       id: "1"
#     },
#     content: {
#       page: {
#         number: "1",
#         ?pageContent
#       }
#     }
#   }
# }'.gsub(/\s+/, '')).token

# negative tests
puts parser.parse('{}')
puts parser.parse('{,}')
puts parser.parse('{field,}')
puts parser.parse('silly generativists!')
# no tables
puts parser.parse('{key: "value"}'.gsub(/\s+/, ''))
# no tables
puts parser.parse('
{
  key: "value",
  ?key: "value",
  !key: "value"
}
'.gsub(/\s+/, ''))
