import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/screen/attendance/calander_page.dart';
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 288,
    height: 303,
  );
}

TextField reusableTextField(String text, IconData icon,bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.grey.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0.5, style: BorderStyle.none,),
        )
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
  // TextField reusableMultiLineTextField(String text, IconData icon,bool isPasswordType,
  //     TextEditingController controller, int maxLines){
  //   return TextField(
  //     maxLines: maxLines,
  //     controller: controller,
  //     obscureText: isPasswordType,
  //     enableSuggestions: !isPasswordType,
  //     autocorrect: !isPasswordType,
  //     cursorColor: Colors.black,
  //     style: TextStyle(color:Colors.grey.withOpacity(0.9)),
  //     decoration: InputDecoration(
  //         prefixIcon: Icon(
  //           icon,
  //           color: Colors.grey,
  //         ),
  //         labelText: text,
  //         labelStyle: TextStyle(color:Colors.grey.withOpacity(0.9)),
  //         filled: true,
  //         floatingLabelBehavior: FloatingLabelBehavior.never,
  //         fillColor: Colors.white.withOpacity(0.3),
  //         border:OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(20.0),
  //           borderSide: const BorderSide(width:0.5,style: BorderStyle.none,),
  //         )
  //     ),
  //     keyboardType: isPasswordType
  //         ? TextInputType.visiblePassword
  //         : TextInputType.emailAddress,
  //   );
//}

TextField resusableMultilineTextField(String text, bool isPassword, int maxLines, TextEditingController controller, Icon prefixIcon ){
  return TextField(
maxLines: maxLines,
textAlignVertical: TextAlignVertical.top,
controller: controller,
obscureText: isPassword,
enableSuggestions: !isPassword,
autocorrect: !isPassword,
cursorColor: Colors.black,
style: TextStyle(color:Colors.grey.withOpacity(0.9)),
decoration: InputDecoration(
prefixIcon: prefixIcon,
//prefixIconConstraints: BoxConstraints.tight(const Size(24,24)),
//contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
labelText: text,
labelStyle: TextStyle(color:Colors.grey.withOpacity(0.9)),
filled: !isPassword,
floatingLabelBehavior: FloatingLabelBehavior.never,
fillColor: Colors.white.withOpacity(0.3),
border:OutlineInputBorder(
borderRadius: BorderRadius.circular(20.0),
borderSide: const BorderSide(width:0.5,style: BorderStyle.none,),
)
),
keyboardType: isPassword
? TextInputType.visiblePassword
    : TextInputType.emailAddress,
);
}

Container loginSignupButton(
  BuildContext context, bool isLogin, Function onTap){
  return Container(
      padding: const EdgeInsets.fromLTRB(30,5,30,0),
    width: MediaQuery.of(context).size.width,
    height: 60,
    margin: const EdgeInsets.fromLTRB(0,10,0,20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: Text(
        isLogin? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
          color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if(states.contains(MaterialState.pressed)){
            return Colors.blueAccent;
          }
          return Colors.blue;
        }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      )
      ),
    )
  );
}

Drawer appDrawer(BuildContext context){
  return Drawer(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ListTile(
              leading: CircleAvatar(
                minRadius: 10,
                maxRadius: 20,
              ),
              title: Text(
                'User Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('My Profile'),
            ),

            //Academic Calender
            ListTile(
              leading: Icon(Icons.calendar_month_sharp),
              title: Text('Academic Calender'),
            ),

            //Attendance

            ListTile(
              leading: Icon(Icons.bookmark_border),
              title: Text('Attendance'),
              onTap:(){ Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> CalendarPage())
              );},
            ),

            //Fee Recipt
            ListTile(
              leading: Icon(Icons.money_outlined),
              title: Text('Fee Recipt'),
            ),

            //My Profile
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('My Profile'),
            ),

            //Help
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help'),
            ),

            //Logout
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
    ),
  );
}






