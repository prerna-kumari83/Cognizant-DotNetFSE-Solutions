using System;

namespace Exercise_1
{
    public class Logger
    {
        // Static variable to hold the single instance
        private static Logger instance;

        // Private constructor prevents object creation from outside
        private Logger()
        {
            Console.WriteLine("Logger instance created.");
        }

        // Public method to access the single instance
        public static Logger GetInstance()
        {
            if (instance == null)
            {
                instance = new Logger();
            }

            return instance;
        }

        // Logging method
        public void Log(string message)
        {
            Console.WriteLine("LOG: " + message);
        }
    }
}