#import diktyonphi as dp
from diktyonphi import Graph, GraphType

# Create a directed graph
g = Graph(GraphType.DIRECTED)

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

# Access and update node attribute
print("Node A color:", g.node("A")["color"])
g.node("A")["color"] = "darkgreen"

# Access edge and modify its weight
edge = g.node("A").to("B")
print("Edge A→B weight:", edge["weight"])
edge["weight"] = 1.1

# Iterate through the graph
print("\nGraph structure:")
for node_id in g.node_ids():
    node = g.node(node_id)
    print(f"Node {node.id}: label={node['label']}, out_degree={node.out_degree}")
    for neighbor_id in node.neighbor_ids:
        edge = node.to(neighbor_id)
        print(f"  → {neighbor_id} (weight={edge['weight']}, type={edge['type']})")

print("-----------------")
print(g.to_image())