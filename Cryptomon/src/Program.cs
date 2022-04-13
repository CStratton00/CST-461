using System;
using Nethereum.Web3;

namespace Cryptomon
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}

/* example code
namespace NethereumSample
{ 
    class Program
    { 
        static void Main(string[] args)
        {
            GetAccountBalance().Wait();
            Console.ReadLine();
        }

        static async Task GetAccountBalance()
        {
            var web3 = new Web3("http://localhost:7545");
            var balance = await web3.Eth.GetBalance.SendRequestAsync("0x627306090abaB3A6e1400e9345bC60c78a8BEf57");
            Console.WriteLine(balance);

            var etherAmount = Web3.Convert.FromWei(balance.Value);
            Console.WriteLine(etherAmount);
        }
    }
}
 */
