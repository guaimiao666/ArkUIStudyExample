import { LengthMetrics } from '@kit.ArkUI'

/**
 * 使用弹窗
 */
@Entry
@Component
struct Start {
  build() {
    Column() {
      CustomDialogUser()
    }
  }
}

/**
 * 基础自定义弹出框 (CustomDialog)
 */
@CustomDialog
struct CustomDialogExample {
  cancel: () => void = () => {
    console.info('cancel')
  }
  confirm: () => void = () => {
    console.info('confirm')
  }
  dialogController: CustomDialogController;

  build() {
    Column() {
      Text('我是一个基础自定义弹窗框')
        .fontSize(20)
        .margin(10)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel').onClick((event: ClickEvent) => {
          this.dialogController.close();
          if (this.cancel) {
            this.cancel()
          }
        })
        Button('confirm').onClick((event: ClickEvent) => {
          this.dialogController.close();
          if (this.confirm) {
            this.confirm()
          }
        })
        Button('query state').onClick((event: ClickEvent) => {
          console.info('dialog state:' + this.dialogController.getState());
        })
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct CustomDialogUser {
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
    onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
      //实现弹出框的物理返回拦截
      console.info('dialog onWillDismiss reason: ' + dismissDialogAction.reason);
      // 1、PRESS_BACK    点击三键back、侧滑（左滑/右滑）、键盘ESC。
      // 2、TOUCH_OUTSIDE    点击遮障层时
      // 3、CLOSE_BUTTON    点击关闭按钮
      if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
        // 处理业务逻辑后通过dismiss主动关闭对话框
        // dismissDialogAction.dismiss();
      }
      if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
        // dismissDialogAction.dismiss();
      }
    },
    //动画
    openAnimation: {
      duration: 1200,
      curve: Curve.Friction,
      delay: 500,
      playMode: PlayMode.Alternate,
      onFinish: () => {
        console.info('play end')
      }
    },
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    backgroundColor: 0xd9ffffff,
    cornerRadius: 10,
    //自定义样式
    width: '80%',
    height: '40%',
    borderWidth: 1,
    borderStyle: BorderStyle.Dashed,//使用borderStyle属性，需要和borderWidth属性一起使用
    borderColor: Color.Blue,//使用borderColor属性，需要和borderWidth属性一起使用
    shadow: ({ radius: 20, color: Color.Grey, offsetX: 50, offsetY: 0}),
    //软键盘避让
    keyboardAvoidMode: KeyboardAvoidMode.DEFAULT, // 软键盘弹出时，弹出框自动避让
    keyboardAvoidDistance: LengthMetrics.vp(0) // 软键盘弹出时与弹出框的距离为0vp
  })

  build() {
    Column() {
      Button('弹出').onClick((event: ClickEvent) => {
        this.controller.open()
      })
    }
  }
}