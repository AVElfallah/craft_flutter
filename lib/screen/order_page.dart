import 'package:flutter/material.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late TextEditingController nameController;

  late TextEditingController lastController;

  late TextEditingController emailController;

  late TextEditingController phoneController;

  late TextEditingController idController;

  late TextEditingController visaController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();

    lastController = TextEditingController();

    emailController = TextEditingController();

    phoneController = TextEditingController();

    idController = TextEditingController();

    visaController = TextEditingController();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color.fromARGB(255, 12, 88, 118),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Confirm Order",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDECF2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 370,
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: " First Name"),
                    validator: (value) =>
                        value!.isNotEmpty ? null : "Empty Text",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDECF2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 370,
                  child: TextFormField(
                    controller: lastController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: "  Last Name"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDECF2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 370,
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: "  E-mail"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDECF2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 370,
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: "  phoneNumber"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDECF2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 370,
                  child: TextFormField(
                    controller: idController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: "  national Id"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDECF2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 370,
                  child: TextFormField(
                    controller: idController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: "  Visa Card"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final message = Message()
                        ..from = const Address(
                            'wahbamariam812@gmail.com', 'hyah karima')
                        ..recipients.add(emailController.text)
                        ..subject = 'Herftna Project In egypt  '
                        ..text = """ 
    
Thank you for your shopping from our store
   Mr /${nameController.text} 

Dear customer, we hope to be your trust in us
You have purchased the number 1233459
The value of the purchase is 300 pounds, 
and payment is made upon receiving the order
(Receipt date within seven days)


We hope the purchase will be repeated """;

                      // Create the SMTP server.
                      final smtpServer =
                          gmail('wahbamariam812@gmail.com', 'zkhqrpoviewejwfs');

                      try {
                        // Send the email.
                        final sendReport = await send(message, smtpServer);
                        debugPrint('Message sent: ${sendReport.toString()}');
                      } on MailerException catch (e) {
                        debugPrint('Message not sent.');
                        debugPrint(e.message);
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 7, 75, 109),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Order Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
