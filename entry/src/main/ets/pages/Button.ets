/**
 * 表单选择
 */
@Entry
@Component
struct Start {
  build() {
    Column() {
      ToggleExample()
    }
  }
}

/**
 * 按钮 (Button)
 */
@Component
struct ButtonExample {
  build() {
    Column({ space: 5 }) {
      //设置按钮类型
      Button('普通按钮', { type: ButtonType.Normal, stateEffect: true })//普通类型
        .width(90)
        .height(40)
        .borderRadius(15)
      Button('胶囊按钮', { type: ButtonType.Capsule, stateEffect: true }) //胶囊类型（默认类型） 不支持设置borderRadius
        .backgroundColor(Color.Pink)
        .width(90)
        .height(40)
      Button('圆形按钮', { type: ButtonType.Circle, stateEffect: true }) //圆形类型 不支持设置borderRadius
        .backgroundColor(Color.Red)
        .width(90)
        .height(90)
      Button('圆角矩形按钮', { type: ButtonType.ROUNDED_RECTANGLE, stateEffect: true }) //圆角矩形类型
        .backgroundColor(Color.Blue)
        .width(90)
        .height(40)

      //设置文本样式
      Button('text style').fontSize(13).fontColor(Color.Black).fontWeight(800)

      //创建功能性按钮
      Button({ type: ButtonType.Circle, stateEffect: true }) {
        Image($r('app.media.ic_delete')).width(30).height(30)
      }
      .width(55)
      .height(55)
      .backgroundColor(Color.Pink)

      //按键事件
      Button('按键事件').onClick((event: ClickEvent) => {
        console.info('The button click')
      })


    }
    .padding(5)
  }
}

/**
 * 单选框 (Radio)
 */
@Component
struct RadioExample {
  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        //value：单选框的名称 group：单选框所属群组名称
        Radio({ value: 'radio1', group: 'radioGroup' })
          .checked(false)
          .onChange((isChecked: boolean) => { //设置状态改变监听
            if (isChecked) {

            } else {

            }
          })
        Radio({ value: 'radio2', group: 'radioGroup' })
          .checked(true)
      }
    }
    .padding(5)
  }
}

/**
 * 切换按钮 (Toggle)
 */
@Component
struct ToggleExample {
  build() {
    Column({ space: 5 }) {
      //Checkbox Swich类型 用于创建不包含子组件的Toggle
      Row({ space: 5 }) {
        //Checkbox类型 复选框
        Toggle({ type: ToggleType.Checkbox, isOn: false })
          .selectedColor(Color.Orange) //通过selectedColor设置选中后的背景颜色
          .onChange((isOn: boolean) => { //添加事件
            if (isOn) {

            }
          })
        Toggle({ type: ToggleType.Checkbox, isOn: true })
          .selectedColor(Color.Orange)
        //Switch类型 开关
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor(Color.Orange)
          .switchPointColor(Color.Blue) //switchPointColor设置Switch圆形滑块颜色
      }

      //Button类型 用于创建包含子组件的Toggle
      Row({ space: 5 }) {
        Toggle({ type: ToggleType.Button, isOn: false }) {
          Text('button type toggle')
            .fontColor(Color.Black)
            .fontSize(14)
            .fontWeight(600)
        }
        .selectedColor(Color.Orange)
      }
    }
    .padding(5)
  }
}
