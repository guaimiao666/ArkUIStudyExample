import { LengthMetrics } from '@kit.ArkUI'

/**
 * 文本使用
 */
@Entry
@Component
struct Start {
  build() {
    Column() {
      SymbolGlyphExample()
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
          .onChange((value: string) => {
            //文本内容发生改变时触发回调
            console.info('文本发生变化:' + value)
          })
          .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => {
            // 按下输入法回车键时触发该回调
            console.info('按下输入法回车: ', enterKey, event.text);
          })
          .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
            // 文本选择的位置发生变化或编辑状态下光标位置发生变化时，触发该回调
            console.info('onTextSelectionChange is triggering: ', selectionStart, selectionEnd);
          })
          .onSecurityStateChange((isShowPassword: boolean) => {
            // 密码显隐状态切换时，触发该回调
            console.info('onSecurityStateChange is triggering: ', isShowPassword);
          })
          .onWillInsert((info: InsertValue) => {
            // 在将要输入时，触发该回调
            console.info('onWillInsert is triggering: ', info.insertValue, info.insertOffset);
            return true;
          })
          .onDidInsert((info: InsertValue) => {
            // 在输入完成时，触发该回调
            console.info('onDidInsert is triggering: ', info.insertValue, info.insertOffset);
          })
          .onWillDelete((info: DeleteValue) => {
            // 在将要删除时，触发该回调
            console.info('onWillDelete is triggering: ', info.deleteValue, info.deleteOffset);
            return true;
          })
          .onDidDelete((info: DeleteValue) => {
            // 在删除完成时，触发该回调
            console.info('onDidDelete is triggering: ', info.deleteValue, info.deleteOffset);
          })
          .onFocus(() => {
            // 绑定通用事件，输入框获焦时触发该回调
            console.info('onFocus is triggering')
          })

        //contentType 自动填充
        //输入框可以通过contentType属性设置自动填充类型。
        TextInput({ placeholder: '自动填充类型 输入你的邮箱...' })
          .width('95%')
          .height(40)
          .margin(20)
          .contentType(ContentType.EMAIL_ADDRESS)

        //设置属性
        TextArea({ placeholder: '设置属性', text: '测试描边文字' })
          .width('100%')
          .margin(10)
          .backgroundColor(Color.Pink)
          .strokeWidth(LengthMetrics.px(3.0)) //设置文字描边宽度
          .strokeColor(Color.Red) //设置文字描边颜色
          .lineSpacing(LengthMetrics.px(20), { onlyBetweenLines: true }) //设置文本行间距
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }
  }
}

/**
 * 富文本编辑（RichEditor）
 */
//查看此文档https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-richeditor

/**
 * 图标小符号 (SymbolGlyph/SymbolSpan)
 */
//SymbolSpan可作为Text的子组件用于显示图标小符号。可以在一个Text组件内添加多个SymbolSpan，从而展示一串连续的图标。
//查看此文档https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-symbol
@Component
struct SymbolSpanExample {
  build() {
    Scroll() {
      Row() {
        Column() {
          Text('48')
          Text() {
            SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
              .fontSize(48)
              .renderingStrategy(SymbolRenderingStrategy.SINGLE) //设置组件渲染策略 单色 多色 分层
              .fontColor([Color.Black, Color.Green, Color.White]) //设置组件颜色
              .fontWeight(FontWeight.Bold) //设置组件粗细
          }
        }

        Column() {
          Text('96')
          Text() {
            SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
              .fontSize(96)
              .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR) //多色
              .fontColor([Color.Black, Color.Green, Color.White])
              .fontWeight(FontWeight.Normal)
          }
        }

        Column() {
          Text('128')
          Text() {
            SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
              .fontSize(128)
              .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_OPACITY) //分层
              .fontColor([Color.Black, Color.Green, Color.White])
              .fontWeight(FontWeight.Lighter)
          }
        }

        //设置动效策略 只在启动时触发动效
        Column() {
          Text('缩放动效')
          Text() {
            SymbolSpan($r('sys.symbol.ohos_wifi'))
              .fontSize(128)
              .renderingStrategy(SymbolRenderingStrategy.SINGLE)
              .fontColor([Color.Black, Color.Green, Color.White])
              .fontWeight(FontWeight.Normal)
              .effectStrategy(SymbolEffectStrategy.SCALE)
          }
        }

        Column() {
          Text('层级动效')
          Text() {
            SymbolSpan($r('sys.symbol.ohos_wifi'))
              .fontSize(128)
              .renderingStrategy(SymbolRenderingStrategy.SINGLE)
              .fontColor([Color.Black, Color.Green, Color.White])
              .fontWeight(FontWeight.Normal)
              .effectStrategy(SymbolEffectStrategy.HIERARCHICAL)
          }
        }

        //SymbolSpan不支持通用事件
      }
    }
    .scrollable(ScrollDirection.Horizontal)
  }
}

@Component
struct SymbolGlyphExample {
  @State isActive: boolean = true;
  @State triggerValueReplace: number = 0;
  @State renderMode: number = 1;
  replaceFlag: boolean = true;

  build() {
    Scroll() {
      Column({ space: '5' }) {
        Column() {
          Text("可变颜色动效")
          SymbolGlyph($r('sys.symbol.ohos_wifi'))
            .fontSize(96)
            .symbolEffect(new HierarchicalSymbolEffect(EffectFillStyle.ITERATIVE), this.isActive)
          Button(this.isActive ? '关闭' : '播放').onClick(() => {
            this.isActive = !this.isActive;
          })
        }

        Column() {
          Text("弹跳动效")
          SymbolGlyph($r('sys.symbol.ellipsis_message_1'))
            .fontSize(96)
            .fontColor([Color.Gray])
            .symbolEffect(new BounceSymbolEffect(EffectScope.WHOLE, EffectDirection.UP), this.triggerValueReplace)
          Button('trigger').onClick(() => {
            this.triggerValueReplace = this.triggerValueReplace + 1;
          })
        }

        Column() {
          Text("禁用动效")
          SymbolGlyph(this.replaceFlag ? $r('sys.symbol.eye_slash') : $r('sys.symbol.eye'))
            .fontSize(96)
            .renderingStrategy(this.renderMode)
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.LAYER, ReplaceEffectType.SLASH_OVERLAY), this.triggerValueReplace)
          Button('trigger').onClick(() => {
            this.replaceFlag = !this.replaceFlag;
            this.triggerValueReplace = this.triggerValueReplace + 1;
          })
        }

        Column() {
          Text("快速替换动效")
          SymbolGlyph(this.replaceFlag ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
            .fontSize(96)
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.CROSS_FADE), this.triggerValueReplace)
            .onClick(() => {
              //添加点击事件
            })
          Button('trigger').onClick(() => {
            this.replaceFlag = !this.replaceFlag;
            this.triggerValueReplace = this.triggerValueReplace + 1;
          })
        }
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
  }
}

/**
 * 属性字符串
 */
//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-styled-string

/**
 * 图文混排
 */
@Component
struct ImageAndTextSpanExample {
  build() {
    Column() {
      Text() {
        ImageSpan('')
          .width(50)
          .height(30)
          .borderRadius(5)
          .verticalAlign(ImageSpanAlignment.FOLLOW_PARAGRAPH)
        Span('惊喜价 ￥1299')
          .fontSize(25)
          .fontColor(Color.Red)
        Span('1599')
          .decoration({
            type: TextDecorationType.LineThrough,
            color: Color.Grey,
            style: TextDecorationStyle.SOLID
          })
          .fontSize(16)
      }.textVerticalAlign(TextVerticalAlign.CENTER)
    }
  }
}