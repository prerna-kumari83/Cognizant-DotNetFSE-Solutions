using System;

namespace Exercise_2
{
    public class ExcelDocument : IDocument
    {
        public void Open()
        {
            Console.WriteLine("Opening Excel Document");
        }
    }
}