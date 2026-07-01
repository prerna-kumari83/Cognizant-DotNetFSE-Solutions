using System;

class Program
{
    // Recursive method to calculate future value
    static double ForecastValue(double initialValue, double growthRate, int years)
    {
        // Base case: 0 years means initial value
        if (years == 0)
            return initialValue;

        // Recursive case
        return ForecastValue(initialValue, growthRate, years - 1) * (1 + growthRate);
    }

    static void Main()
    {
        Console.WriteLine("=== Financial Forecasting Tool (Recursion) ===");

        double initialValue = 1000;   // starting investment
        double growthRate = 0.10;     // 10% growth
        int years = 5;

        double result = ForecastValue(initialValue, growthRate, years);

        Console.WriteLine($"Initial Value: {initialValue}");
        Console.WriteLine($"Growth Rate: {growthRate * 100}%");
        Console.WriteLine($"Years: {years}");
        Console.WriteLine($"Future Value: {result:F2}");
    }
}