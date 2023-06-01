import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hyah_karima/data/external/cart_database.dart';

import '../controller/order_controller.dart';
import '../extensions/governrates.dart';
import '../model/order_model.dart';
import '../widget/reusable_text_field.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var ctrl = OrderController.put;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ctrl,
      builder: (_) {
        return Scaffold(
          body: Form(
            key: ctrl.formKey,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: const Text(
                    "Confirm Order",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: InkWell(
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
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ReusableTextField(
                          controller: ctrl.firstNameController,
                          hintText: "First Name",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.lastNameController,
                          hintText: "Last Name",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.emailController,
                          hintText: "E-mail",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.phoneController,
                          hintText: "Phone Number",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.companyNameController,
                          hintText: "Company Name",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15, top: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 1),
                          decoration: BoxDecoration(
                            color: const Color(0xffEDECF2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: 370,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: DropdownButton<int>(
                              underline: const SizedBox.shrink(),
                              isExpanded: true,
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * .65,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                              value: ctrl.governorateValue,
                              iconSize: 35,
                              hint: const Text(
                                'Choose your Governorate',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              items: governrateList
                                  .map<DropdownMenuItem<int>>(
                                    (e) => DropdownMenuItem<int>(
                                      value: e.number!,
                                      child: Text(
                                        e.englishName!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: ctrl.changeGovernorateValue,
                            ),
                          ),
                        ),
                        ReusableTextField(
                          controller: ctrl.postCodeController,
                          hintText: "Postal Code",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.addressController,
                          hintText: "Address",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.cityController,
                          hintText: "City",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.countryStateController,
                          hintText: "Country State",
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        ReusableTextField(
                          controller: ctrl.notesController,
                          hintText: "Write some notes here",
                          isNote: true,
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Empty Text",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            ctrl.submitOrder(Navigator.of(context));
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
