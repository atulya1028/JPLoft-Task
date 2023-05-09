import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jploft_task_atulya/colors.dart';
import 'package:jploft_task_atulya/controllers/dashboard_controller.dart';
import 'package:jploft_task_atulya/modals/BookingModal.dart';
import 'package:jploft_task_atulya/services/api_service.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  
  final controller = Get.put(DashboardController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPick.bgColor  ,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPick.bgColor,
        iconTheme: IconThemeData(
          color: ColorPick.black,
        ),
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: Text('Bookings Details',style: TextStyle(color: ColorPick.black),),
      ),
      body:FutureBuilder<BookingModal>(
        future:controller.bookingApi(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/40),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Booking
                      const SizedBox(height: 20,),
                      Text('Booking # ${snapshot.data!.data.bookingId}',style: TextStyle(color: ColorPick.black2,
                      fontSize: 20
                      ),),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(snapshot.data!.data.bookingDate.toString(),style: TextStyle(color: ColorPick.grey),),
                          const SizedBox(width: 5,),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: ColorPick.grey2,
                          ),
                          const SizedBox(width: 5,),
                          Text(snapshot.data!.data.bookingTime.toString(),style: TextStyle(color: ColorPick.grey),),
                        ],
                      ),
                      const SizedBox(height: 45,),
                      Divider(
                        color: ColorPick.grey3,
                        thickness: 2,
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          Image.asset('images/room_pic.jpeg',width: 100,),
                          const SizedBox(width: 5,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Room',style: TextStyle(color: ColorPick.black3,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 5,),
                              Text('Room Size: ${snapshot.data!.data.getRoom[0].roomSize} sqft'),
                              const SizedBox(height: 5,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                color: ColorPick.purplePink,
                                child: const Text('Classic',style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(height: 45,),
                      Divider(
                        color: ColorPick.grey3,
                        thickness: 2,
                      ),
                      const SizedBox(height: 35,),
                      //Guest Details
                      Text('Guest Details',style: TextStyle(color: ColorPick.grey4,fontSize: 20),),
                      const SizedBox(height: 25,),
                      Text(snapshot.data!.data.guestName.toString().toUpperCase(),style: TextStyle(fontSize: 18,
                        color: ColorPick.black3,fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 25,),
                      Row(
                        children: [
                          Text(snapshot.data!.data.phone.toString(),style: TextStyle(fontSize: 13,
                              color: ColorPick.black4,
                            fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(width: 5,),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: ColorPick.black2,
                          ),
                          const SizedBox(width: 5,),
                          Flexible(
                            child: Text(snapshot.data!.data.email.toString(),style: TextStyle(fontSize: 13,
                            color: ColorPick.black2,
                                fontWeight: FontWeight.bold
                            ),),
                          )],
                      ),
                      const SizedBox(height: 35,),
                      //Booking Details
                      Text('Booking Details',style: TextStyle(fontSize: 20,color: ColorPick.grey4),),
                      const SizedBox(height: 25,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: ColorPick.creme2,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorPick.creme)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Dates'),
                                SizedBox(width: 50,),
                                Text(snapshot.data!.data.bookingDate.toString(),style: TextStyle(color: ColorPick.red),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Divider(
                              color: ColorPick.creme,
                              thickness: 2,
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Guest'),
                                SizedBox(width: 50,),
                                Text(snapshot.data!.data.guestQty.toString(),style: TextStyle(color: ColorPick.red),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Divider(
                              color: ColorPick.creme,
                              thickness: 2,
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Room'),
                                SizedBox(width: 50,),
                                Text(snapshot.data!.data.roomQty.toString(),style: TextStyle(color: ColorPick.red),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text('Meals Details',style: TextStyle(fontSize: 20,
                      color: ColorPick.grey4
                      ),),
                      SizedBox(height: 20,),
                      //Meals Details
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorPick.whiteGrey)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset('images/breakfast_pic.jpeg',width: 80,),
                                SizedBox(width: 5,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Breakfast'),
                                    SizedBox(height: 10,),
                                    Text('Indian Menu'),
                                  ],
                                ),
                              ],
                            ),
                            Text('₹ ${snapshot.data!.data.mealAmount}')
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      //Payment Details
                      Text('Payment Details',style: TextStyle(fontSize: 20,
                          color: ColorPick.grey4
                      ),),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: ColorPick.creme2,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorPick.creme)
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text('1 Night X ${snapshot.data!.data.guestQty} Guest'),
                                Text(snapshot.data!.data.bookingDate.toString(),
                                  style: TextStyle(color: ColorPick.black),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Divider(
                              color: ColorPick.creme,
                              thickness: 2,
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Meal'),
                                Text('₹ ${snapshot.data!.data.mealAmount.toStringAsFixed(2)}',
                                  style: TextStyle(color: ColorPick.black),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Divider(
                              color: ColorPick.creme,
                              thickness: 2,
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text('Total Amount',style: TextStyle(color: ColorPick.red),),
                                Text('₹ ${int.parse(snapshot.data!.data.roomAmount.toString()).toStringAsFixed(2)}'
                                  ,style: TextStyle(color: ColorPick.red),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
            );
          } else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          } else {
            return const Center(child: Text('No data found!'),);
          }
        },
      ),
    );
  }
}
