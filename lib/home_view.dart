import 'package:flutter/material.dart';

const List<Company> companiesUnshuffled = [
  Company(
    companyName: "Interswitch",
    description:
        "This is ranked as the biggest and best fintech company in Nigeria. It provides payment solutions for businesses and individuals.",
  ),
  Company(
    companyName: "Paystacks",
    description:
        "This is another highly rated fintech company in Nigeria with not less than 17,000 business clients such as Betway, MTN, IrokoTV, Domino and Taxify. It provides payment solutions for businesses.",
  ),
  Company(
    companyName: "Flutterwave",
    description:
        "This is a leading fintech firm in Nigeria founded in 2014 by Olugbenga Agboola. It provides payment solutions for businesses.",
  ),
  Company(
    companyName: "eTransact",
    description:
        "This is one of Nigerian’s premier payment processing service provider in Nigeria. It provides payment solutions for businesses.",
  ),
  Company(
    companyName: "Remita",
    description:
        "This is a payment platform that helps individuals and businesses receive and make payments easily.",
  ),
  Company(
    companyName: "Paga",
    description:
        "This is a mobile payment platform that allows users to transfer money and make payments through their mobile devices.",
  ),
  Company(
    companyName: "VoguePay",
    description:
        "This is a secure payment gateway that allows businesses to receive payments from customers all over the world.",
  ),
  Company(
    companyName: "OPay",
    description:
        "This is a mobile wallet and payment platform that allows users to send and receive money, pay bills, and buy airtime.",
  ),
  Company(
    companyName: "Carbon",
    description:
        "This is a digital financial services platform that provides quick loans to individuals and small businesses.",
  ),
  Company(
      companyName: "Kuda Bank",
      description:
          "This is a digital bank that provides banking services through its mobile app,"),
  Company(
    companyName: "PiggyVest",
    description:
        "This is an online savings platform that helps individuals save money easily.",
  ),
  Company(
    companyName: "LazarPay",
    description:
        "This is a digital financial services platform that provides quick loans to individuals and small businesses.",
  ),
  Company(
      companyName: "Paytm Bank",
      description:
          "This is a digital bank that provides banking services through its mobile app,"),
  Company(
    companyName: "Cash App",
    description:
        "This is an online savings platform that helps individuals save money easily.",
  ),
  Company(
    companyName: "Moneta",
    description: "A digital money processing company, similar to paystack",
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Company> companies = List.from(companiesUnshuffled);
    companies.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Text(
              "Top Fintech Companies in Nigeria",
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: companies.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      companies[index].companyName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(companies[index].description),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Company {
  final String companyName;
  final String description;

  const Company({required this.companyName, required this.description});
}
