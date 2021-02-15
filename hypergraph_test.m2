needsPackage "Hypergraphs"

H = hypergraph({{1,2,3},{1,4,5}, {2,4,6},{3,5,6}}, 1 .. 6)
R = QQ[x_(1,1) .. x_(3,6)]
I = detIdeal(H,R)

J = (ass I)#1

--projection generator
(gens J)_(0,4)
