import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

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
              '${tr?.privacy}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox(),
          ],
        ),
      ),

      body: SingleChildScrollView( 
        child: SafeArea(
          child: Container( 
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("${tr?.privacy_policy}",style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
                ),
                Text("${tr?.privacy_policy_tag}",style: TextStyle(color: CustomColor.BlackColor)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('${tr?.info_collection}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
              ),
             Text("${tr?.info_collection_tag}",style: TextStyle(color: CustomColor.BlackColor)),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: Text('${tr?.google_services}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
               ),

                    Text(
                    '${tr?.google_services_tag}',style: TextStyle(color: CustomColor.BlackColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('${tr?.cookies}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
                      ),

                Text(
                '${tr?.cookies_tag}',style: TextStyle(color: CustomColor.BlackColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('${tr?.service_providers}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
                  ),

                Text(
                '${tr?.service_providers_tag}',style: TextStyle(color: CustomColor.BlackColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('${tr?.security}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
                  ),
Text(
                '${tr?.security_tag}',style: TextStyle(color: CustomColor.BlackColor)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('${tr?.site_links}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
            ),
                Text(
                '${tr?.site_links_tag}',style: TextStyle(color: CustomColor.BlackColor)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('${tr?.children_privacy}'
              ,style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold),),
          ),
         Text(
                '${tr?.children_privacy_tag}',style: TextStyle(color: CustomColor.BlackColor)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('${tr?.policy_changes}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
        ),
Text(

                '${tr?.policy_changes_tag}',style: TextStyle(color: CustomColor.BlackColor)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('${tr?.contact_us}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
            ),
          Text(
                '${tr?.contact_us_tag}',style: TextStyle(color: CustomColor.BlackColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
