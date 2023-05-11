using System;

namespace School_Work_Proper_Summer
{
    class Program
    {
        static void Main(string[] args)
        {
            int age;
            do
            {
                Console.WriteLine("How old are you?");
                age = Console.ReadLine();
            } while(age < 0);
            
            int member_time;
            do
            {
                Console.WriteLine("How long have you been a member for?");
                member_time = Console.ReadLine();
            } while(member_time < 0);
            
            
        
        }
    }
}