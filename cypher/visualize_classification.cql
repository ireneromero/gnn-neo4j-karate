UNWIND ['0', '1'] AS label
MATCH (n:Person {label: label})
CALL apoc.create.vNode([label], {id: n.id}) YIELD node AS vPerson
RETURN vPerson
