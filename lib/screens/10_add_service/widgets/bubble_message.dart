import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/models/category_model.dart';
import 'package:ibiza/core/widgets/bubble_message.dart';
import 'package:ibiza/screens/10_add_service/provider/service_provider.dart';
import 'package:provider/provider.dart';

class BubbleMessage extends StatelessWidget {
  final List<SubCategory> subCategories;
  final String? selectedOption;
  final ValueChanged<List<String>> onOptionSelected;
  final bool istrue;

  const BubbleMessage(
      {super.key,
      required this.selectedOption,
      required this.onOptionSelected,
      required this.istrue,
      required this.subCategories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.dg),
      child: CustomPaint(
        painter: MessageBubblePainter(
          clipper:
              MessageBubbleClipper(tailOffset: istrue == true ? 250.0 : 100),
          borderColor: const Color(0xffD6D6D6),
          borderWidth: 1.0,
        ),
        child: ClipPath(
          clipper: MessageBubbleClipper(tailOffset: istrue ? 250.0 : 100),
          child: Consumer<ServiceProvider>(
            builder: (context, value, child) => Padding(
              padding: EdgeInsets.only(right: 10.0.dg, left: 10.0.dg),
              child: SizedBox(
                height: 70.h,
                width: double.infinity,
                child: buildOption(),

                // child: ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: subCategories.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return buildOption(subCategories[index].name);
                //   },

                // ),(
                //   child: Row(
                //     children: [
                //       const SizedBox(width: 20),
                //       buildOption("Walking"),
                //       buildOption("With Boat"),
                //       buildOption("With Vehicle"),
                //     ],
                //   ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOption() {
    return ListView.builder(
      itemCount: subCategories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final title = subCategories[index].name;
        final isSelected = selectedOption == title;
        return Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.0.dg),
              child: SizedBox(
                height: 30.0.h,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xffD6D6D6)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor:
                        isSelected ? Colors.grey.shade200 : Colors.white,
                  ),
                  onPressed: () =>
                      onOptionSelected([title, subCategories[index].id]),
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
