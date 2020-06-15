uninstallPackage "Hypergraphs"
restart
needs "Hypergraphs.m2"


end --


H1 = hypergraph {{3,4},{1,2,3},{1,2,4},{3,5,6},{4,5,6}};
H2 = hypergraph {{1,2},{1,3},{4,5},{7,8}};
H3 = hypergraph(edges H1, 1 .. 6)

components H1
components H2
components H3

I = hypergraphIdeal H3
R = ring hypergraphIdeal H3
describe R

