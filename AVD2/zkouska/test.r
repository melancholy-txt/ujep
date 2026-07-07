nodes <- c("A", "B", "C", "D", "E")

P <- matrix(c(
  0,   0.5, 0.5, 0,   0,
  0.5, 0,   0,   0.5, 0,
  0,   0,   0,   0.5, 0.5,
  0,   0,   0,   0,   1,
  0.5, 0,   0.5, 0,   0
), nrow = 5, byrow = TRUE)

rownames(P) <- nodes
colnames(P) <- nodes

# simulace a
set.seed(42)
n_steps <- 1000000 # 1 000 000 kroku
current_state <- "A" # nehraje to roli
visits <- numeric(5)
names(visits) <- nodes

for (i in 1:n_steps) {
  visits[current_state] <- visits[current_state] + 1 # inkrementace pocitadla navstev aktualniho uzlu
  
  current_state <- sample(nodes, size = 1, prob = P[current_state, ]) # vyberu dalsi
}

score_A <- visits / n_steps # vydelim celkovym poctem kroku 

# simulace b
Pnew <- P
tolerance <- 1e-6 
difference <- 1
iterations <- 1

while (difference > tolerance) {
  Pnext <- Pnew %*% P # násobení matic
  
  difference <- max(abs(Pnext - Pnew)) # maximalni rozdil
  
  Pnew <- Pnext
  iterations <- iterations + 1 # inkrementace pocitadla iteraci
}

# Výsledný ustálený vektor
score_B <- Pnew[1, ] #beru prvni radek

# Samotný výpočet přes solver
score_C <- c(8/41, 4/41, 10/41, 7/41, 12/41) # analyticky, viz papir :D
names(score_C) <- nodes

# vysledna tabulka
results <- data.frame(
  Uzel = nodes,
  Simulace_A = score_A,
  Simulace_B = score_B,
  Analyticky_C = score_C
)
# Seřazení podle nejdůležitější stránky (od největšího skóre po nejmenší)
results <- results[order(-results$Analyticky_C), ]
rownames(results) <- NULL

results_percent <- results
# results_percent[, 2:4] <- format(results_percent[, 2:4] * 100, digits = 4) 
rownames(results_percent) <- NULL


print(paste("Simulace B se ustálila po", iterations, "iteracích."))
print("Porovnání výsledků:")
print(results)
print("Porovnání výsledků (v %):")
print(results_percent)

