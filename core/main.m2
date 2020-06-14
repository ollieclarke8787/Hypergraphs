-- main classes and functionality for hypergraph ideals

export {
    "Hypergraph",
    "hypergraph"
    }

Hypergraph = new Type of HashTable

-- constructor
hypergraph = method()
hypergraph (List, List) := (E, V) -> (
    new Hypergraph from {
    	"Edges" => E,
    	"Vertices" => V,
    	cache => new CacheTable from {} 
    	}
    )

    