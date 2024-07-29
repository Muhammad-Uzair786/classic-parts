import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);
    List<FAQItem> faqData=getfaqData(context);
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,

      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        automaticallyImplyLeading: false,
        // Set the background color of the AppBar
        elevation: 0,
        // Set the elevation to 0 to remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColor.TextFieldColor,
                    gradient: CustomColor.GradientColor
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.white, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              '${tr.faq}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
          SizedBox()
          ],
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: faqData.length,
          itemBuilder: (context, index) {
            return Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: CustomColor.BlackColor,
                title: Text(faqData[index].question,style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold),),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(faqData[index].answer,style: TextStyle(color: CustomColor.BlackColor),),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

 List<FAQItem> getfaqData (BuildContext context) {
   var tr= AppLocalizations.of(context);

   return [
     FAQItem(
       question: '${tr.how_can_i_place_an_order}',
       answer: '${tr.how_can_i_place_an_order_ans}',
     ),
     FAQItem(
       question: '${tr.what_payment_methods_do_you_accept}',
       answer: '${tr.what_payment_methods_do_you_accept_ans}',
     ),
     FAQItem(
       question: '${tr.can_we_have_to_pay_through_app}',
       answer: '${tr.can_we_have_to_pay_through_app_ans}',
     ),
     FAQItem(
       question: '${tr.how_can_i_track_my_order}',
       answer: "${tr.how_can_i_track_my_order_ans}",
     ),
     FAQItem(
       question: '${tr.is_it_possible_to_modify_or_cancel_my_order}',
       answer: "${tr.is_it_possible_to_modify_or_cancel_my_order_ans}",
     ),
     FAQItem(
       question: '${tr.how_can_i_earn_wallet_cash_and_loyalty_points}',
       answer: "${tr.how_can_i_earn_wallet_cash_and_loyalty_points_ans}",
     ),
     FAQItem(
       question: '${tr.what_is_the_purpose_of_cash}',
       answer: "${tr.what_is_the_purpose_of_cash_ans}",
     ),
     FAQItem(
       question: '${tr.what_is_the_purpose_of_loyality_points}',
       answer: "${tr.what_is_the_purpose_of_loyality_points_ans}",
     ),
     FAQItem(
       question: '${tr.how_can_i_contact_customer_support}',
       answer: "${tr.how_can_i_contact_customer_support_ans}",
     ),

     // Add more FAQ items as needed
   ];
 }
