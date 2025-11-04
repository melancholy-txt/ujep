namespace ProxyMethod;

interface IDocument
{
    void Display();
}

class Document : IDocument
{
    private string _file;
    public Document(string file)
    {
        _file = file;   
    }
    public void Display()
    {
        Console.WriteLine($"tajna data z {_file}");
    }
}

class DocumentProxy : IDocument
{
    private Document _document;
    private string _password;

    public DocumentProxy(string file, string password)
    {
        _document = new Document(file);
        _password = password;
    }

    public void Display()
    {
        if (_password == "admin")
        {
            _document?.Display();
        }
        else
        {
            Console.WriteLine("špatné heslo troubo!");
        }
    }
}


    class Program
    {
        static void Main(string[] args)
        {
            IDocument adminDoc = new DocumentProxy("tajny_soubor.txt", "admin");
            IDocument userDoc = new DocumentProxy("tajny_soubor.txt", "user");

            adminDoc.Display();
            userDoc.Display();
        }
    }
