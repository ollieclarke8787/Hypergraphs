     newPackage(
             "Hypergraphs",
             Version => "0.1", 
             Date => "",
             Authors => {{Name => "Oliver Clarke", 
                       Email => "oliver.clarke@bristol.ac.uk", 
                       HomePage => ""},
		   {Name => "Harshit J. Motwani",
		       Email => "harshitmotwani2015@gmail.com",
		       HomePage => ""}},
             Headline => "Package for working with hypergraphs",
             DebuggingMode => true
             )

needs "./core/main.m2"
needs "./tests/tests.m2"

beginDocumentation()

needs "./core/documentation.m2"

