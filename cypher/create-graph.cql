// Creating nodes for the graph

UNWIND range(1, 34) AS id_node
CREATE (:Person {id: id_node})

// Adding relationships from csv to the graph created
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/ireneromero/gnn-neo4j-karate/v0.1/data/karate-relationships.csv" AS line
MATCH (p_src:Person {id: toInteger(line.src)}), (p_dst:Person {id: toInteger(line.dst)})
MERGE (p_src)-[:KNOWS]-(p_dst)

// Deleting self loops present in the graph
MATCH (p:Person)-[rel]-(p)
DELETE rel
