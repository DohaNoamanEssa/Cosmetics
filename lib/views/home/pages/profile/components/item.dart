part of '../view.dart';

class _Item extends StatelessWidget {
  // final image=title.toLowerCase().replaceAll(" ", "_")+".svg";
  final String icon,title;
  final bool withSuffixIcon;
  final Widget? destinationPage;

  const _Item({
    required this.icon,
    required this.title,
    this.withSuffixIcon = true,
    this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {

    final isLogout=title.toLowerCase()=="logout";
    final image="${title.toLowerCase().replaceAll(" ", "_")}.svg";

    return Padding (
      padding:  EdgeInsets.only(top: 34.h),
      child: GestureDetector(
        onTap: destinationPage==null? null:()async{

          if(isLogout)
            {
             final resp=await DioHelper.sendData(path: "api/Auth/logout");
             if(resp!.isSuccess)
               {
                 //clear cache
                 CacheHelper.logout();
                 goTo(destinationPage!);

               }

             // send logout api
              // clear cache
            }
          else{
            goTo(destinationPage!);

          }
        },
        child: Row(
          children: [
            AppImage(
              image: icon,
              bottomSpace: 0,
              color:  Color(withSuffixIcon ?0xff434C6D:0XFFCD0F0F),
            ),
            SizedBox(width: 8.w),


            Text(
                title,
                style: TextStyle(
                  color: Color( withSuffixIcon ?0xff434C6D:0XFFCD0F0F),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),


            Spacer(),
            if (withSuffixIcon)
              AppImage(image: "arrow_right.svg", color: Color(0xff434C6D)),
          ],
        ),
      ),
    );
  }
}
