import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_2/task1_view/w2task1_controller.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/alert_dialog_delete.dart';
import 'package:internship_pakistan/ui/views/week_2/task1_view/w2task1_widget/container_item.dart';
import 'package:internship_pakistan/ui/views/week_2/task1_view/w2task1_widget/dialog_add_item.dart';

class W2Task1View extends StatelessWidget {
  const W2Task1View({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    W2task1Controller controller = Get.put(W2task1Controller());
    return CustomScaffoldTask(
        floatingActionButton: GestureDetector(
          onTap: () {
            showDialogAddItem(controller: controller);
          },
          child: Container(
              height: 80.w,
              width: 80.w,
              decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50.r)),
              child: Icon(
                Icons.add_outlined,
                size: 40.w,
              )),
        ),
        taskNumber: '1',
        title: title,
        children: [
          (20.h).ph,
          GetBuilder<W2task1Controller>(builder: (c) {
            return controller.items.isEmpty
                ? Center(
                    child: CustomText(
                        topPadding: 0.34.sh,
                        text: 'No Data To Show',
                        textType: TextStyleType.subtitle),
                  )
                : Scrollbar(
                    thickness: 5,
                    child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemExtent: 0.145.sh,
                        children:
                            List.generate(controller.items.length, (index) {
                          return SwipeActionCell(
                            closeWhenScrolling: true,
                            controller: controller.swipeActionController,
                            backgroundColor: AppColors.whiteColor,
                            key: ObjectKey(controller.items[index]),
                            fullSwipeFactor: 0.4,
                            trailingActions: <SwipeAction>[
                              SwipeAction(
                                  backgroundRadius: 15.r,
                                  title: "Delete",
                                  widthSpace: 120.w,
                                  performsFirstActionWithFullSwipe: true,
                                  onTap: (CompletionHandler handler) async {
                                    // if(Get.isSnackbarOpen==true){
                                    //   Get.back();
                                    // }
                                    controller.swipeActionController
                                        .closeAllOpenCell();
                                    showAlertDelete(
                                        text: 'Are you sure delete this item',
                                        onTap: () {
                                          Get.closeAllSnackbars();
                                          controller.items.removeAt(index);
                                          Get.back();
                                          showSnackBar(
                                              title:
                                                  'Item has been successfully deleted');
                                          controller.update();
                                          if (Get.isDialogOpen == true) {
                                            Get.back();
                                          }
                                        });
                                  },
                                  color: AppColors.redColor),
                            ],
                            child: ContainerItem(
                              title: controller.items[index].title,
                              body: controller.items[index].body,
                            ),
                          );
                        })),
                  );
          }),
          (20.h).ph,
        ]);
  }
}
