import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Stack(
          children: [
            Container(
              child: Image.asset(
                'assets/images/about.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170, left: 8, right: 8),
              child: Container(
                padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: ColorsApp().primarycolor, width: 1.5),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dear readers,',
                      style: GoogleFonts.openSans(
                          fontSize: 15,

                          color: ColorsApp().lightprimarycolor,
                          letterSpacing: 2,
                          height: 1.5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'We offer tremendous gathering of books in various classification of Fiction, Non-fiction, Biographies, History, Religions, Self – Help, Children. We likewise move in immense accumulation of Investments and Management, Computers, Engineering, Medical, College and School content references books proposed by various foundations as schedule the nation over. Other than to this, we likewise offer an expansive gathering of E-Books at reasonable valuing. ',
                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp().lightprimarycolor,
                          letterSpacing: 1.5,
                          height: 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
