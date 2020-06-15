-- main classes and functionality for hypergraph ideals

export {
    "Hypergraph",
    "hypergraph",
    "edges",
    "vertices",
    "detIdeal",
    "inducedSubgraph"
    }

Hypergraph = new Type of HashTable

-- constructor
hypergraph = method()
hypergraph (List, List) := (E, V) -> ( -- edge + vertex list
    new Hypergraph from {
    	"Edges" => E,
    	"Vertices" => V,
    	cache => new CacheTable from {} 
    	}
    )
hypergraph (List, Sequence) := (E, V) -> (
    hypergraph(E, toList V)
    )
hypergraph (List, ZZ) := (E, n) -> ( -- edge on vertices 0 .. n
    maxVal := max flatten E;
    hypergraph(E, 0 .. n)
    )
hypergraph List := E -> ( -- edge on vertices 0 .. n where n is the max val of edges
    maxVal := max flatten E;
    hypergraph(E, 0 .. maxVal)
    )


-- Properties --
edges = method()
edges Hypergraph := H -> H#"Edges"

vertices = method()
vertices Hypergraph := H -> H#"Vertices"


-- overload components method

-- algorithm works as follows
-- H hypergraph with vertex set 0 .. n and edges E
-- make a hash table M with i => i for each i in 0 .. n
-- we 'collapse' this table as follows:
--   for each edge e in E, we make M#i = min(M#j : j in e)
-- as a result two vertices v, w are in the same connected comonent iff
--  M#v == M#w

components Hypergraph := H -> (
    if H.cache#?"Components" then (
	return cache#"Components"
	);
    M := new MutableHashTable; --vertices by component
    scan(vertices H, v -> M#v = v); -- init M, assume vertices have an ordering
    for e in edges H do (
	minIndex := min apply(e, v -> M#v);
	for v in e do (
	    M#v = minIndex;
	    );
	);
    connectedComponents := {}; -- get connected components from M
    for i in unique values M do(
	currentComponent := {}; 
	for v in vertices H list (
	    if M#v == i then (
		currentComponent = flatten {currentComponent, v}
		);
	    );
	connectedComponents = flatten {connectedComponents, {currentComponent}};
	);
    H.cache#"Components" = connectedComponents; --Add to cache
    connectedComponents
    )


-- induced subgraph
-- returns a hypergraph with the same vertex set and altered edges
inducedSubgraph = method()
inducedSubgraph (Hypergraph, List) := (H, V) -> ( -- V new vertex set
    E := new MutableHashTable;
    scan(edges H, e -> E#e = true);
    for e in edges H do (
	for v in e  do (
	    if not member(v, V) then (
		E#e = false;
		);
	    );
	);
    newEdges := flatten for e in edges H list (if E#e then {e} else {});
    hypergraph(newEdges, vertices H)
    )


detIdeal = method()
detIdeal(Hypergraph, ZZ, Ring) := (H, d, R) -> ( --Hypergraph ideal in with d rows
    assert(numgens R >= d*(#vertices H));
    X := transpose genericMatrix(R, #(vertices H), d);
    sum for e in edges H list (
	cols := apply(e, v -> position(vertices H, x -> x == v)); -- indices of vertices of an edge
	minors(#e, X_cols)
	)
    )

detIdeal(Hypergraph, ZZ) := (H, d) -> (
    x := symbol x;
    V := #(vertices H);
    R := QQ[x_(0,0) .. x_(d-1,V-1), MonomialOrder => Lex];
    detIdeal(H, d, R)
    )

detIdeal Hypergraph := H -> (
    d := max for e in edges H list #e;
    detIdeal(H, d)
    )

