-- documentation
doc ///
  Key
    Hypergraphs
  Headline
    Package for hypergraph ideals
  Description
    Text
      A hypergraph is a generalisation of a graph whose edges are subsets of vertices of arbitrary size.
///


doc ///
  Key
    hypergraph
    (hypergraph, List, List)
    (hypergraph, List, Sequence)
    (hypergraph, List, ZZ)
    (hypergraph, List)
  Headline
    produce a Hypergraph
  Usage
    H = hypergraph(E, V)
    H = hypergraph(E, n)
    H = hypergraph(E)
  Inputs
    E: List
      edges of the hypergraph which may be any subsets of vertices 
    V: List
      list of vertices, optional
    n: ZZ
      maximum value of vertex, optional
  Outputs
    H: Hypergraph
  Description
    Text
      If no vertices $V$ is supplied then the vertex set is taken to be
      $0 \dots n$ where $n$ is the largest vertex appearing in an edge 
    Example
      H1 = hypergraph {{1,2}, {4,5,6}}
      vertices H1
      H2 = hypergraph({{1,2}, {4,5,6}}, 7)
      H3 = hypergraph({{1,2}, {4,5,6}}, 1 .. 8)
  SeeAlso
    (edges, Hypergraph)
    (vertices, Hypergraph)
    (inducedSubgraph, Hypergraph, List)
    (detIdeal, Hypergraph)
///


doc ///
  Key
    edges
    (edges, Hypergraph)
  Headline
    edges of a Hypergraph
  Usage
    E = edges H
  Inputs
    H: Hypergraph
  Outputs
    E: List
      edges of the hypergraph
  Description
    Example
      H = hypergraph {{1,2}, {4,5,6}};
      edges H
  SeeAlso
    (hypergraph, List)
    (vertices, Hypergraph)
    (inducedSubgraph, Hypergraph, List)
    (detIdeal, Hypergraph)
///