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
      edges of the hypergraph $H$
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


doc ///
  Key
    vertices
    (vertices, Hypergraph)
  Headline
    vertices of a Hypergraph
  Usage
    V = vertices H
  Inputs
    H: Hypergraph
  Outputs
    V: List
      vertices of the hypergraph $H$
  Description
    Example
      H1 = hypergraph {{1,2}, {4,5,6}};
      vertices H1
      H2 = hypergraph({{1,2},{4,5,6}}, 8);
      vertices H2
  SeeAlso
    (hypergraph, List)
    (edges, Hypergraph)
    (inducedSubgraph, Hypergraph, List)
    (detIdeal, Hypergraph)
///


doc ///
  Key
    inducedSubgraph
    (inducedSubgraph, Hypergraph, List)
  Headline
    induced subgraph of a Hypergraph
  Usage
    H = inducedSubgraph(G, V)
  Inputs
    G: Hypergraph
    V: List
      vertices of the induced subgraph
  Outputs
    H: Hypergraph
      hypergraph on the same vertex set as $G$ with edges that are subsets of $V$
  Description
    Text
      The hypergraph ${\tt inducedSubgraph}(G, V)$ is the hypergraph on the same
      vertex set as $G$ with and whose edges are the edges of $G$ which are
      contained in $V$.
    Example
      G = hypergraph {{0,1},{0,2},{0,3},{1,2},{1,3,4},{1,4,5}};
      V = {0,1,2,4,5};
      H = inducedSubgraph(G, V);
      vertices H == vertices G
      edges H
    Text
      Note that by default the detIdeal of $G$ and $H$ live in different rings.
      To define these ideals in the same ring, one can pass the desired ring into
      the function ${\tt detIdeal}$.
    Example
      IG = detIdeal G;
      R = ring IG;
      IH = detIdeal(H, R);
  SeeAlso
    (hypergraph, List)
    (edges, Hypergraph)
    (vertices, Hypergraph)
    (detIdeal, Hypergraph)
///




