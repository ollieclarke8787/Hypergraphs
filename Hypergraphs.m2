     newPackage(
             "Hypergraphs",
             Version => "0.1", 
             Date => "",
             Authors => {{Name => "Oliver Clarke", 
                       Email => "oliver.clarke@bristol.ac.uk", 
                       HomePage => ""},
		   {Name => "Harshit J. Motwani",
		       Email => "",
		       HomePage => ""}},
             Headline => "Package for working with hypergraphs",
             DebuggingMode => true
             )

needs "./core/main.m2"
needs "./tests/tests.m2"

beginDocumentation()

doc ///
     Key
       Hypergraphs
     Headline
       Package for hypergraph ideals
     Description
       Text
         A hypergraph is a generalisation of a graph whose edges are subsets of vertices of arbitrary size.
///
