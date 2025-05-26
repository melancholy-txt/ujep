#import diktyonphi as dp
from diktyonphi import Graph, GraphType

# Create a directed graph
g = Graph(GraphType.UNDIRECTED)

# Add nodes with attributes
g.add_node("A", {"label": "Start", "color": "green"})
g.add_node("B", {"label": "Middle", "color": "yellow"})
g.add_node("C", {"label": "End", "color": "red"})
g.add_node("D", {"label": "Optional", "color": "blue"})

# Add edges with attributes
g.add_edge("A", "B", {"weight": 1.0, "type": "normal"})
g.add_edge("B", "C", {"weight": 2.5, "type": "critical"})
g.add_edge("A", "D", {"weight": 0.8, "type": "optional"})
g.add_edge("D", "C", {"weight": 1.7, "type": "fallback"})

def nodes_and_neighours(g: Graph, weights: bool = False ):   
    for node_id in g.node_ids():
        node = g.node(node_id)
        print(f"Node {node.id}:")
        for neighbor_id in node.neighbor_ids:
            edge = node.to(neighbor_id)
            print(f"  → {neighbor_id} (váha = {edge['weight']})") if weights else print(f"  → {neighbor_id}")

def generate_matrix(l: int):
    matrix = []
    for i in range(l):   
        row = []
        for j in range(l):
            row.append(0)    # user input for rows
        matrix.append(row)  # adding rows to the matrix
    return matrix

def adjacency_matrix(g: Graph):
    matrix = generate_matrix(g.__len__())
    for i, node_id in enumerate(g.node_ids()):
        # print(i, " ", node_id)
        node = g.node(node_id)
        if node.out_degree == 0:
            continue
        # print(i, " ", node_id)
        for j, dest_id in enumerate(g.node_ids()):
            if node.is_edge_to(dest_id):
                
                matrix[i][j] = matrix[i][j] + 1
                # matrix[i][j] = "matrix[i][j] + 1"
    for row in matrix:
        print(row, "\n")
    ...

print("-----------------")
nodes_and_neighours(g)
print("-----------------")
nodes_and_neighours(g, True)
print("-----------------")
adjacency_matrix(g)
