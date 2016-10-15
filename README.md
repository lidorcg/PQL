#### WORK IN PROGRESS
---

# PQL

PQL (Patterns Query Language) is a query language inspired by [GraphQL](http://graphql.org/).
For now the main idea is to compile the language into simple SQL although I'm also trying to design drivers-based architecture to ease extensibility into other data bases in the future.

### Implementation

I started implementing the engine in ruby because I love the language and it's very easy getting right to the point with it.
Currently I'm using:
* [treetop](http://treetop.rubyforge.org/) for parsing

I plan on moving to haskell in the future after I feel most of the features in my mind have stabilized and the design has taken shape.
