#import diktyonphi as dp
from diktyonphi import Graph, GraphType, Node

# Create a directed graph
g = Graph(GraphType.UNDIRECTED)

# Add nodes with attributes
g.add_node("A", {"label": "Start", "color": "green"})
g.add_node("B", {"label": "Middle", "color": "yellow"})
g.add_node("C", {"label": "End", "color": "red"})
g.add_node("D", {"label": "Optional", "color": "blue"})
g.add_node("E", {"label": "Optional", "color": "blue"})
g.add_node("F", {"label": "Optional", "color": "blue"})
g.add_node("G", {"label": "Optional", "color": "blue"})
g.add_node("H", {"label": "Optional", "color": "blue"})

# Add edges with attributes
g.add_edge("A", "B", {"weight": 1.0, "type": "normal"})
g.add_edge("B", "C", {"weight": 2.5, "type": "critical"})
g.add_edge("A", "D", {"weight": 0.8, "type": "optional"})
g.add_edge("D", "C", {"weight": 1.7, "type": "fallback"})
g.add_edge("D", "E", {"weight": 1.7, "type": "fallback"})
g.add_edge("E", "C", {"weight": 1.7, "type": "fallback"})
g.add_edge("F", "C", {"weight": 1.7, "type": "fallback"})
g.add_edge("F", "G", {"weight": 1.7, "type": "fallback"})
g.add_edge("F", "B", {"weight": 1.7, "type": "fallback"})
g.add_edge("F", "H", {"weight": 1.7, "type": "fallback"})
g.add_edge("E", "H", {"weight": 1.7, "type": "fallback"})

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
        if g.type == GraphType.UNDIRECTED and node.out_degree == 0:
            continue
        # print(i, " ", node_id)
        for j, dest_id in enumerate(g.node_ids()):
            dest = g.node(dest_id)
            if dest.is_edge_to(node_id):
                matrix[i][j] = -1
            if node.is_edge_to(dest_id):
                matrix[i][j] = 1
                # matrix[i][j] = "matrix[i][j] + 1"
    for row in matrix:
        print(row, "\n")
    
def dfs(g: Graph, node_id, dest_id, visited: set = None, cost: int = 0) -> set:
    if visited == None:
        visited = set()

    if node_id in visited:
        return []

    visited.add(node_id)   
    path = [node_id]

    if node_id == dest_id:
        return path
    
    node = g.node(node_id)
    for neigh_id in node.neighbor_ids:
        if neigh_id not in visited:
            neigh_dfs = dfs(g, neigh_id, dest_id, visited)
            if neigh_dfs and dest_id in neigh_dfs:
                return path + ["->"] + neigh_dfs 
    return []
        

def bfs(g: Graph, node_id, dest_id):
    queue = [node_id]
    visited = {node_id}
    parent = {node_id: None}
    cost = 0

    while queue:
        current_id = queue.pop(0)

        if current_id == dest_id:
            path = []
            while current_id is not None:
                path.append(current_id)
                #path.append("->")
                if parent[current_id] is not None:
                    current_node = g.node(current_id)
                    edge = current_node.to(parent[current_id])
                    cost += edge["weight"]
                current_id = parent[current_id]
            path.reverse()
            return (path, cost)
        
        current_node = g.node(current_id)
        for neigh_id in current_node.neighbor_ids:
            if neigh_id not in visited:
                visited.add(neigh_id)
                parent[neigh_id] = current_id
                queue.append(neigh_id)

    return []

print("-----------------")
nodes_and_neighours(g)
print("-----------------")
nodes_and_neighours(g, True)
print("-----------------")
adjacency_matrix(g)
print("-----------------")
print(g.to_dot())
print(dfs(g, "A", "D"))
print(bfs(g, "A", "H"))