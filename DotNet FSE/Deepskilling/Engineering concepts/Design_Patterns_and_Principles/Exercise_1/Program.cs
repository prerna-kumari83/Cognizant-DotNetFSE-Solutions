using System;

namespace Exercise_1
{
    class Program
    {
        static void Main(string[] args)
        {
            Logger logger1 = Logger.GetInstance();
            logger1.Log("Application Started");

            Logger logger2 = Logger.GetInstance();
            logger2.Log("User Logged In");

            Console.WriteLine();

            if (logger1 == logger2)
            {
                Console.WriteLine("Only one Logger instance exists.");
            }
            else
            {
                Console.WriteLine("Multiple Logger instances exist.");
            }

            Console.WriteLine($"Logger1 HashCode : {logger1.GetHashCode()}");
            Console.WriteLine($"Logger2 HashCode : {logger2.GetHashCode()}");
        }
    }
}