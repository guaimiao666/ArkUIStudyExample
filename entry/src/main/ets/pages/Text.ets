@Entry
@Component
struct Start {
  build() {
    Column() {
      TextInputExample()
    }
  }
}

/**
 * 文本显示（Text/Span）
 */
//添加组组件Span Span中的内容将覆盖Text中的内容
@Component
struct AddSpan {
  build() {
    Text("123") {
      Span('我是Span1，')
        .fontSize(16)
        .decoration({ type: TextDecorationType.LineThrough, color: Color.Pink })
      Span('我是Span2，')
        .fontSize(16)
        .decoration({ type: TextDecorationType.Underline, color: Color.Green })
      Span('我是Span3，')
        .fontSize(16)
        .decoration({ type: TextDecorationType.Overline, color: Color.Black }) //设置装饰线和颜色
      Span("harmony os")
        .fontSize(16)
        .textCase(TextCase.UpperCase) //设置保持大小写
        .onClick(() => { //设置点击事件

        })
        .onHover(() => { //设置悬浮事件

        })
    }
  }
}

//自定义文本样式
@Component
struct CustomTextStyle {
  @State linearGradientOptions: LinearGradientOptions =
    {
      direction: GradientDirection.LeftTop,
      colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
      repeating: true,
    };

  build() {
    Scroll() {
      Column({ space: 10 }) {
        //textAlign 设置对齐方式
        Text('左对齐')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .width('100%')
          .border({ width: 1 })
        Text('居中')
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .width('100%')
          .border({ width: 1 })
        Text('右对齐')
          .fontSize(16)
          .textAlign(TextAlign.End)
          .width('100%')
          .border({ width: 1 })

        //textOverflow 文本超长处理
        Text('1234567890QWERTYUIOPASDFGHJKLZXCVBNM')
          .width('200')
          .fontSize(20)
          .textOverflow({ overflow: TextOverflow.None })
          .maxLines(1)
          .border({ width: 1 })
        Text('1234567890QWERTYUIOPASDFGHJKLZXCVBNM')
          .width('200')
          .fontSize(20)
          .textOverflow({ overflow: TextOverflow.MARQUEE }) //文字滚动
          .maxLines(1)
          .border({ width: 1 })
        Text('1234567890QWERTYUIOPASDFGHJKLZXCVBNM')
          .width('200')
          .fontSize(20)
          .textOverflow({ overflow: TextOverflow.Ellipsis }) //超出的部分用省略号表示
          .maxLines(1)
          .border({ width: 1 })

        //lineHeight 设置文本行高
        Text('行高20')
          .width('100%')
          .fontSize(20)
          .border({ width: 1 })
          .lineHeight(20)
          .textAlign(TextAlign.Center)
        Text('行高40')
          .width('100%')
          .fontSize(20)
          .border({ width: 1 })
          .lineHeight(40)
          .textAlign(TextAlign.Center)

        //decoration 设置装饰线
        Text('设置装饰线')
          .border({ width: 1 })
          .fontSize(20)
          .decoration({
            color: Color.Red,
            type: TextDecorationType.LineThrough,
            style: TextDecorationStyle.SOLID
          })
        Text('设置装饰线')
          .border({ width: 1 })
          .fontSize(20)
          .decoration({
            color: Color.Red,
            type: TextDecorationType.LineThrough,
            style: TextDecorationStyle.DOUBLE
          })
        Text('设置装饰线')
          .border({ width: 1 })
          .fontSize(20)
          .decoration({
            color: Color.Red,
            type: TextDecorationType.LineThrough,
            style: TextDecorationStyle.DOTTED
          })
        Text('设置装饰线')
          .border({ width: 1 })
          .fontSize(20)
          .decoration({
            color: Color.Red,
            type: TextDecorationType.LineThrough,
            style: TextDecorationStyle.DASHED
          })
        Text('设置装饰线')
          .border({ width: 1 })
          .fontSize(20)
          .decoration({
            color: Color.Red,
            type: TextDecorationType.LineThrough,
            style: TextDecorationStyle.WAVY
          })

        //baselineOffset 设置文本基线偏移量
        Text('text base line offset: 0')
          .fontSize(20)
          .border({ width: 1 })
          .padding(5)
          .baselineOffset(0)
        Text('text base line offset: 30')
          .fontSize(20)
          .border({ width: 1 })
          .padding(5)
          .baselineOffset(30)
        Text('text base line offset: -20')
          .fontSize(20)
          .border({ width: 1 })
          .padding(5)
          .baselineOffset(-20)

        Text('This is a test text')
          .width('100%')
          .border({ width: 1 })
          .fontSize(16)
          .letterSpacing(10) //设置文本字符间距
          .textCase(TextCase.LowerCase) //设置文本大小写
          .copyOption(CopyOptions.InApp) //设置文本复制粘贴
          .fontFamily('HarmonyOS Sans') //设置字体列表
          .optimizeTrailingSpace(true) //version20+ 解决每行末尾空格导致的对齐问题
          .enableAutoSpacing(true) //version20+是否开启中文西文自动间距
          .shaderStyle(this.linearGradientOptions) //支持设置渐变色
          .onClick(() => {
            //设置点击事件
          })
          .textVerticalAlign(TextVerticalAlign.CENTER) //设置垂直居中
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)
    }
  }
}

/**
 * 文本输入（TextInput/TextArea/Search）
 */
@Component
struct TextInputExample {
  build() {
    Scroll() {
      Column({ space: 10 }) {
        //type 设置输入类型
        TextInput().type(InputType.Normal).backgroundColor(Color.Grey) //基本模式
        TextInput().type(InputType.Password).backgroundColor(Color.Grey) //密码模式
        TextInput().type(InputType.Email).backgroundColor(Color.Grey) //邮箱地址模式
        TextInput().type(InputType.Number).backgroundColor(Color.Grey) //纯数字模式
        TextInput().type(InputType.PhoneNumber).backgroundColor(Color.Grey) //电话号码模式
        TextInput().type(InputType.NUMBER_DECIMAL).backgroundColor(Color.Grey) //带小数点数字模式
        TextInput().type(InputType.URL).backgroundColor(Color.Grey) //URL模式

        //设置输入框多态样式（TextInput和TextArea支持）
        TextInput().style(TextContentStyle.INLINE).backgroundColor(Color.Pink) //内联风格

        //自定义样式
        TextInput({ placeholder: '我是提示文本', text: '我是当前文本' }).backgroundColor(Color.Orange)

        //添加事件
        TextInput({ placeholder: 'input your text...' })
          .backgroundColor(Color.Yellow)
          .onChange((value : string) => {
            //文本内容发生改变时触发回调
            console.info('文本发生变化:' + value)
          })
          .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => {
            // 按下输入法回车键时触发该回调
            console.info('按下输入法回车: ', enterKey, event.text);
          })
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }
  }
}