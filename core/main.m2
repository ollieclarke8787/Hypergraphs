-- main classes and functionality for hypergraph ideals

export {
    "Hypergraph",
    "hypergraph",
    "edges",
    "vertices",
    "hypergraphIdeal"
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
components Hypergraph := H -> (
    if H.cache#?"Components" then (
	return cache#"Components"
	);
    M := new MutableHashTable;
    scan(vertices H, v -> M#v = v);
    for e in edges H do (
	minIndex := min apply(e, v -> M#v);
	for v in e do (
	    M#v = minIndex;
	    );
	);
    connectedComponents := {};
    for i in unique values M do(
	currentComponent := {}; 
	for v in vertices H list (
	    if M#v == i then (
		currentComponent = flatten {currentComponent, v}
		);
	    );
	connectedComponents = flatten {connectedComponents, {currentComponent}};
	);
    H.cache#"Components" = connectedComponents;
    connectedComponents
    )


hypergraphIdeal = method()

hypergraphIdeal(Hypergraph, ZZ, Ring) := (H, d, R) -> ( --Hypergraph ideal in with d rows
    X := transpose genericMatrix(R, #(vertices H), d);
    sum for e in edges H list (
	cols := apply(e, v -> position(vertices H, x -> x == v)); -- indices of vertices of an edge
	minors(#e, X_cols)
	)
    )

hypergraphIdeal(Hypergraph, ZZ) := (H, d) -> (
    x := symbol x;
    V := #(vertices H);
    R := QQ[x_(0,0) .. x_(d-1,V-1), MonomialOrder => Lex];
    hypergraphIdeal(H, d, R)
    )

hypergraphIdeal Hypergraph := H -> (
    d := max for e in edges H list #e;
    hypergraphIdeal(H, d)
    )