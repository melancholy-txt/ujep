// Observer Pattern Demo - Knihkupectví (Bookstore Sales)
Console.WriteLine("=== Observer Pattern Demo ===\n");

// Vytvoření publishera (knihkupectví)
Publisher bookstore = new Publisher();

// Vytvoření subscriberů
CommonSubscriber allBooksSubscriber = new CommonSubscriber();
SpecificSubscriber sciFiSubscriber = new SpecificSubscriber(new[] { "Duna", "Neuromancer", "Solaris" });
SpecificSubscriber fantasySubscriber = new SpecificSubscriber(new[] { "Hobit", "Zaklínač", "Harry Potter" });

// Přihlášení subscriberů k odběru
Console.WriteLine("📚 Přihlašuji odběratele...\n");
bookstore.Subscribe(allBooksSubscriber);
bookstore.Subscribe(sciFiSubscriber);
bookstore.Subscribe(fantasySubscriber);

// První aktualizace slev
Console.WriteLine("--- Nová sleva přidána: Duna ---");
bookstore.UpdateSales("Duna");
Console.WriteLine();

// Další aktualizace
Console.WriteLine("--- Nová sleva přidána: Hobit ---");
bookstore.UpdateSales("Hobit");
Console.WriteLine();

// Další aktualizace
Console.WriteLine("--- Nová sleva přidána: 1984 ---");
bookstore.UpdateSales("1984");
Console.WriteLine();

// Odhlášení jednoho subscribera
Console.WriteLine("\n📭 Odhlašuji fantasy odběratele...\n");
bookstore.Unsubscribe(fantasySubscriber);

// Aktualizace po odhlášení
Console.WriteLine("--- Nová sleva přidána: Zaklínač ---");
bookstore.UpdateSales("Zaklínač");
Console.WriteLine();

Console.WriteLine("\n=== Konec Demo ===");
