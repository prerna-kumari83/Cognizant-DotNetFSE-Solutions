using System;
using System.Collections.Generic;

class Product
{
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public string Category { get; set; }

    public Product(int id, string name, string category)
    {
        ProductId = id;
        ProductName = name;
        Category = category;
    }
}

class Program
{
    // Linear Search (works on unsorted array)
    static Product LinearSearch(Product[] products, int targetId)
    {
        for (int i = 0; i < products.Length; i++)
        {
            if (products[i].ProductId == targetId)
                return products[i];
        }
        return null;
    }

    // Binary Search (requires sorted array by ProductId)
    static Product BinarySearch(Product[] products, int targetId)
    {
        int left = 0;
        int right = products.Length - 1;

        while (left <= right)
        {
            int mid = (left + right) / 2;

            if (products[mid].ProductId == targetId)
                return products[mid];

            else if (products[mid].ProductId < targetId)
                left = mid + 1;

            else
                right = mid - 1;
        }

        return null;
    }

    static void Main()
    {
        // Unsorted array (for linear search)
        Product[] products = {
            new Product(3, "Shoes", "Fashion"),
            new Product(1, "Laptop", "Electronics"),
            new Product(5, "Watch", "Accessories"),
            new Product(2, "Phone", "Electronics"),
            new Product(4, "Bag", "Fashion")
        };

        Console.WriteLine("=== LINEAR SEARCH ===");
        Product result1 = LinearSearch(products, 2);
        Console.WriteLine(result1 != null
            ? $"Found: {result1.ProductName}"
            : "Not Found");

        // Sorted array (for binary search)
        Product[] sortedProducts = {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Phone", "Electronics"),
            new Product(3, "Shoes", "Fashion"),
            new Product(4, "Bag", "Fashion"),
            new Product(5, "Watch", "Accessories")
        };

        Console.WriteLine("\n=== BINARY SEARCH ===");
        Product result2 = BinarySearch(sortedProducts, 4);
        Console.WriteLine(result2 != null
            ? $"Found: {result2.ProductName}"
            : "Not Found");
    }
}