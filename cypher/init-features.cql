LOAD CSV FROM "https://raw.githubusercontent.com/ireneromero/gnn-neo4j-karate/v0.1/data/karate-properties-init.csv" AS line
MATCH (p:Person {id: toInteger(line[0])}) SET p.features = line[1]
