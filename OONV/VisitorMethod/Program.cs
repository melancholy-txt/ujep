// Visitor Pattern Demo - Zoo Animals
Console.WriteLine("=== VISITOR PATTERN DEMO ===\n");

// Create animals
Opiček opička = new Opiček();
Koček kočka = new Koček();

List<IAnimal> zvířata = new List<IAnimal> { opička, kočka };

Console.WriteLine("--- 1. DOKTOR VISITOR - Zdravotní prohlídka ---");
DoktorVisitor doktor = new DoktorVisitor();
foreach (var zvíře in zvířata)
{
    zvíře.accept(doktor);
    Console.WriteLine();
}

Console.WriteLine("\n--- 2. KRMÍCÍ VISITOR - Krmení zvířat ---");
KrmícíVisitor krmič = new KrmícíVisitor();
krmič.JítNakupovat();
Console.WriteLine();
foreach (var zvíře in zvířata)
{
    zvíře.accept(krmič);
}

Console.WriteLine("\nZvířata mají jídlo, nechme je jíst:");
Console.WriteLine("\nOpička jí:");
opička.Eat();
Console.WriteLine("\nKočička jí:");
kočka.Eat();

Console.WriteLine("\n\n--- 3. SOUND RECORDER VISITOR - Nahrávání zvuků ---");
SoundRecorderVisitor recorder = new SoundRecorderVisitor();
foreach (var zvíře in zvířata)
{
    zvíře.accept(recorder);
    Console.WriteLine();
}

Console.WriteLine("\n--- 4. KOMBINOVANÝ SCÉNÁŘ - Další den v zoo ---");
Console.WriteLine("Nový den začíná...\n");

// Reset animals
Opiček opička2 = new Opiček();
Koček kočka2 = new Koček();

// Morning checkup
Console.WriteLine("RÁNO - Zdravotní kontrola:");
opička2.accept(doktor);
Console.WriteLine();
kočka2.accept(doktor);

// Feeding time
Console.WriteLine("\nPOLEDNE - Krmení:");
KrmícíVisitor krmič2 = new KrmícíVisitor();
krmič2.JítNakupovat();
opička2.accept(krmič2);
kočka2.accept(krmič2);

// Recording sounds after feeding
Console.WriteLine("\nODPOLEDNE - Nahrávání pro dokumentaci:");
SoundRecorderVisitor recorder2 = new SoundRecorderVisitor();
opička2.accept(recorder2);

Console.WriteLine("\n=== DEMO DOKONČENO ===");
