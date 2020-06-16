uninstallPackage "Hypergraphs"
restart

pathToPackage = "./Hypergraphs.m2"
installPackage(
    "Hypergraphs",
    FileName=>pathToPackage,
    RemakeAllDocumentation => not instance(newDoc, Symbol),
    RerunExamples => true
    )
check "Hypergraphs"

end --

help hypergraph

-- testing
H1 = hypergraph {{3,4},{1,2,3},{1,2,4},{3,5,6},{4,5,6}};
H2 = hypergraph {{1,2},{1,3},{4,5},{7,8}};
-- these hypergraphs have vertices including 0
H3 = hypergraph(edges H1, 1 .. 6) 

components H1
components H2
components H3

d = 3;


I = detIdeal(H3, d);
R = ring I;
describe R
describe I

H4 = inducedSubgraph(H3, {1,2,3,4})
J = detIdeal(H4, d, R)

-- NB ideals are automatically initialised with LEX term order 
f = R_1 + R_6 -- = x_(0,1) + x_(1,0)
leadTerm f -- = x_(0,1)

-- check the generators form a gb 
gens gb I
gens I


