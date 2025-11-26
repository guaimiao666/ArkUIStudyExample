/**
 * 组件布局
 */
//初始入口
@Entry
@Component
struct Start {
  build() {
    Column() {
      CacheTabsContentExample()
    }
  }
}

@Component
struct Parent {
  @State isShowChild: boolean = true;
  @State btnColor: string = '#FF007DFF';

  // 组件生命周期
  aboutToAppear() {
    console.info('Parent aboutToAppear');
  }

  // 组件生命周期
  onDidBuild() {
    console.info('Parent onDidBuild');
  }

  // 组件生命周期
  aboutToDisappear() {
    console.info('Parent aboutToDisappear');
  }

  build() {
    Column() {
      if (this.isShowChild) {
        Child()
      }

      Button('delete child')
        .margin(20)
        .backgroundColor(this.btnColor)
        .onClick(() => {
          //改变是否显示Child组件状态
          this.isShowChild = !this.isShowChild;
        })

      ShowRow()
      ShowColumn()
    }
  }
}

@Component
struct Child {
  @State title: string = 'Hello World';

  aboutToAppear() {
    console.info('Child aboutToAppear');
  }

  // 组件生命周期
  onDidBuild() {
    console.info('Child onDidBuild');
  }

  // 组件生命周期
  aboutToDisappear() {
    console.info('Child aboutToDisappear');
  }

  build() {
    Text(this.title)
      .fontColor(Color.Black)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .onClick(() => {
        this.title = 'Welcome';
      })
  }
}

/**
 * 线性布局Row/Column
 */
//justifyContent设置主轴上的位置 alignItems设置交叉轴上的位置
@Component
struct ShowRow {
  build() {
    Row({ space: 20 }) {
      Text('space:20').fontSize(20)
      Column().height('90%').width(50).backgroundColor(Color.Blue)
      Column().height('90%').width(50).background(Color.Black)
      Column().height('90%').width(50).background(Color.Green).alignSelf(ItemAlign.Start)
    }.height(200).width('100%').justifyContent(FlexAlign.Start).alignItems(VerticalAlign.Bottom)
  }
}

@Component
struct ShowColumn {
  build() {
    Column({ space: 20 }) {
      Text('space:20').width('90%').fontSize(20)
      Row().width('90%').height(50).backgroundColor(Color.Blue)
      Row().width('90%').height(50).backgroundColor(Color.Black)
      Row().width('90%').height(50).backgroundColor(Color.Green)
    }.width('100%').height(200).justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.End)
  }
}

//自适应伸缩
@Component
struct WidthExample {
  build() {
    Row() {
      Column() {
        Text('weight3')
      }.background(Color.Orange).layoutWeight(3).height('100%')

      Column() {
        Text('weight2')
      }.background(Color.Blue).layoutWeight(2).height('100%')

      Column() {
        Text('weight1')
      }.background(Color.Green).layoutWeight(1).height('100%')
    }.width('100%').height(200)
  }
}

//自适应延申
@Component
struct ScrollExample {
  scroller: Scroller = new Scroller();
  arr: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Scroll(this.scroller) {
      Column() {
        ForEach(this.arr, (item: number) => {
          Text(item.toString())
            .fontSize(15)
            .width('100%')
            .height(150)
            .borderRadius(15)
            .margin({ top: 20 })
            .textAlign(TextAlign.Center)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(Color.White)
        })
      }.backgroundColor(Color.Grey).padding(10)
    }
  }
}

/**
 * 层叠布局Stack
 */
@Component
struct StackExample {
  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Column().backgroundColor(Color.Red).width('100%').height('100%');
        Column().backgroundColor(Color.Orange).width('60%').height('40%');
        Column().backgroundColor(Color.Green).width('40%').height('20%');
      }.width('100%').height(150).align(Alignment.BottomEnd)
    }
  }
}

//z序控制 ZIndex值大的覆盖值小的
@Component
struct StackZIndexExample {
  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Column() {
        Text('item1').fontSize(20)
      }.backgroundColor(Color.Blue).width(100).height(100).zIndex(2)

      Column() {
        Text('item2').fontSize(20)
      }.backgroundColor(Color.Orange).width(150).height(150).zIndex(1)

      Column() {
        Text('item3').fontSize(20)
      }.backgroundColor(Color.Red).width(50).height(50).zIndex(3)
    }.width(350).height(350).backgroundColor(Color.Grey)
  }
}

/**
 * 弹性布局Flex
 */
//direction设置主轴方向，justifyContent设置主轴对齐方式，wrap设置单行/多行排列Wrap表示换行，NoWrap表示不换行，超出宽/高度自动压缩宽高. alignItems设置交叉轴对齐方式
@Component
struct FlexExample {
  build() {
    Column() {
      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.Start,
        wrap: FlexWrap.Wrap,
        alignItems: ItemAlign.Start
      }) {
        Column().backgroundColor(Color.Orange).width('33%').height(50)
        Column().backgroundColor(Color.Red).width('33%').height(50)
        Column().backgroundColor(Color.Blue).width('33%').height(50)
      }.width('100%')

      Flex({ direction: FlexDirection.Column }) {
        Column().backgroundColor(Color.Orange).height('33%').width(50)
        Column().backgroundColor(Color.Red).height('33%').width(50)
        Column().backgroundColor(Color.Blue).height('33%').width(50)
      }.height('100%')
    }.backgroundColor(Color.Grey).width('100%').height('100%').padding(10)
  }
}

//自适应拉伸
@Component
struct FlexBasisExample {
  build() {
    Column() {
      //flexBasis：设置子元素在父容器主轴方向上的基准尺寸。如果设置了该属性，则子项占用的空间为该属性所设置的值；如果没设置该属性，那子项的空间为width/height的值。
      Flex() {
        Text('flexBasis("auto")')
          .flexBasis('auto') // 未设置width以及flexBasis值为auto，内容自身宽度
          .height(100)
          .backgroundColor('#F5DEB3')
        Text('flexBasis("auto")' + ' width("40%")')
          .width('40%')
          .flexBasis('auto') //设置width以及flexBasis值auto，使用width的值
          .height(100)
          .backgroundColor('#D2B48C')

        Text('flexBasis(100)')  // 未设置width以及flexBasis值为100，宽度为100vp
          .flexBasis(100)
          .height(100)
          .backgroundColor('#F5DEB3')

        Text('flexBasis(100)')
          .flexBasis(100)
          .width(200) // flexBasis值为100，覆盖width的设置值，宽度为100vp
          .height(100)
          .backgroundColor('#D2B48C')
      }.width('90%').height(120).padding(10).backgroundColor('#AFEEEE')

      //flexGrow：设置父容器的剩余空间分配给此属性所在组件的比例。用于分配父组件的剩余空间。
      //父容器宽度420vp，三个子元素原始宽度为100vp，左右padding为20vp，总和320vp，剩余空间100vp根据flexGrow值的占比分配给子元素，未设置flexGrow的子元素不参与“瓜分”。
      // 第一个元素以及第二个元素以2:3分配剩下的100vp。第一个元素为100vp+100vp * 2/5=140vp，第二个元素为100vp+100vp * 3/5=160vp。
      Flex() {
        Text('flexGrow(2)')
          .flexGrow(2)
          .width(100)
          .height(100)
          .backgroundColor('#F5DEB3')
        Text('flexGrow(3)')
          .flexGrow(3)
          .width(100)
          .height(100)
          .backgroundColor('#D2B48C')

        Text('no flexGrow')
          .width(100)
          .height(100)
          .backgroundColor('#F5DEB3')
      }.width(420).height(120).padding(10).backgroundColor('#AFEEEE')

      //flexShrink: 当父容器空间不足时，子元素的压缩比例。
      //父容器宽度400vp，三个子元素原始宽度为200vp，左右padding为20vp，父容器给子元素的布局空间为380vp，超出父容器空间220vp。
      // 将第一个元素和第三个元素以3:2的压缩比例进行压缩，
      // 直至不再超出父容器提供的布局空间。第一个元素为200vp - (220vp / 5) * 3=68vp，第三个元素为200vp - (220vp / 5) * 2=112vp。
      Flex({ direction: FlexDirection.Row }) {
        Text('flexShrink(3)')
          .flexShrink(3)
          .width(200)
          .height(100)
          .backgroundColor('#F5DEB3')

        Text('no flexShrink')
          .flexShrink(0)
          .width(200)
          .height(100)
          .backgroundColor('#D2B48C')

        Text('flexShrink(2)')
          .flexShrink(2)
          .width(200)
          .height(100)
          .backgroundColor('#F5DEB3')
      }.width(400).height(120).padding(10).backgroundColor('#AFEEEE')
    }.width('100%').height('100%').backgroundColor(Color.Grey)
  }
}

/**
 * 相对布局RelativeContainer
 */

let AlignRus: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
}

let AlignRue: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
}

//以父容器为锚点
@Component
struct RelativeContainerExample {
  build() {
    RelativeContainer() {
      Row() {
        Text('row1')
      }
      .width(100)
      .height(100)
      .backgroundColor(Color.Orange)
      .id('row1')
      .justifyContent(FlexAlign.Center)
      .alignRules(AlignRus)

      Row() {
        Text('row2')
      }
      .width(100)
      .height(100)
      .backgroundColor(Color.Blue)
      .justifyContent(FlexAlign.Center)
      .id('row2')
      .alignRules(AlignRue)
    }
  }
}

//以兄弟元素位锚点
let AlignBro: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': 'row1', 'align': VerticalAlign.Bottom },
  'left': { 'anchor': 'row1', 'align': HorizontalAlign.Start }
}

@Component
struct RelativeContainerExample1 {
  build() {
    RelativeContainer() {
      Row() {
        Text('row1')
      }
      .width(100)
      .height(100)
      .id('row1')
      .backgroundColor(Color.Orange)
      .justifyContent(FlexAlign.Center)
      .alignRules(AlignRus)

      Row() {
        Text('row2')
      }
      .width(100)
      .height(100)
      .id('row2')
      .backgroundColor(Color.Blue)
      .justifyContent(FlexAlign.Center)
      .alignRules(AlignBro)
      .offset({ y: 20 }) //使用offset进行相对位置对齐之后的额外偏移
    }
  }
}

/**
 * 选项卡 TabBar + TabContent
 */
@Component
struct TabsExample {
  build() {
    Tabs({ barPosition: BarPosition.End }) { //底部导航栏，Start为顶部导航栏
      TabContent() { //导航内容展示
        Text('首页内容').fontSize(30)
      }.tabBar('首页') //页签内容
      TabContent() {
        Text('推荐内容').fontSize(30)
      }.tabBar('推荐')

      TabContent() {
        Text('关注内容').fontSize(30)
      }.tabBar('关注')

      TabContent() {
        Text('收藏内容').fontSize(30)
      }.tabBar('收藏')
    }
    .vertical(true) //实现侧边栏需要将此属性置为true，默认为false
    .scrollable(true) //限制导航栏的滑动切换 true为可滑动切换，false为限制滑动切换
    .barMode(BarMode.Fixed) //设置导航栏是否可以滚动，如果导航栏条目数量过多可设置为scrollable可滚动
    .width('100%')
    .height(400)
  }
}

//自定义导航栏
@Component
struct CustomTabsExample {
  @State selectIndex: number = 0;

  @Builder
  tabBuilder(title: string, targetIndex: number) {
    Column() {
      Text(title)
        .fontColor(this.selectIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
  }

  build() {
    Tabs() {
      TabContent() {
        Text('首页内容展示').fontSize(30)
      }.tabBar(this.tabBuilder('首页', 0))

      TabContent() {
        Text('推荐内容展示').fontSize(30)
      }.tabBar(this.tabBuilder('推荐', 1))

      TabContent() {
        Text('关注内容展示').fontSize(30)
      }.tabBar(this.tabBuilder('关注', 2))

      TabContent() {
        Text('收藏内容展示').fontSize(30)
      }.tabBar(this.tabBuilder('收藏', 3))
    }.onSelected((index: number) => {
      this.selectIndex = index;
    })
  }
}

//切换到指定标签页
//使用index属性或者controller来切换指定标签页
@Component
struct SwitchTabsExample {
  marginTop : Record<string, number> = {
    'top' : 10
  }
  @State currentIndex : number = 2;
  @State currentAnimationMode : AnimationMode = AnimationMode.CONTENT_FIRST;
  controller : TabsController = new TabsController();
  build() {
    Column() {
      Tabs({barPosition : BarPosition.End, index : this.currentIndex, controller : this.controller}) {
        TabContent() {
          Text('首页内容展示').fontSize(30)
        }.tabBar('首页')

        TabContent() {
          Text('推荐内容展示').fontSize(30)
        }.tabBar('推荐')

        TabContent() {
          Text('关注内容展示').fontSize(30)
        }.tabBar('关注')

        TabContent() {
          Text('收藏内容展示').fontSize(30)
        }.tabBar('收藏')
      }
      .width('100%')
      .height(500)
      .animationMode(this.currentAnimationMode)
      .onChange((index : number) => {
        this.currentIndex = index;
      })
      /** 设置自定义拦截回调函数 在下一个页面即将展示时回调 返回true则展示下一页面，false则不会展示下一页面*/
      .onContentWillChange((_currentIndex, comingIndex) => {

        return true;
      })

      Button('动态切换AnimationMode').onClick((event: ClickEvent) => {
        if (this.currentAnimationMode === AnimationMode.CONTENT_FIRST) {
          this.currentAnimationMode = AnimationMode.ACTION_FIRST;
        } else if (this.currentAnimationMode === AnimationMode.ACTION_FIRST) {
          this.currentAnimationMode = AnimationMode.NO_ANIMATION;
        } else if (this.currentAnimationMode === AnimationMode.NO_ANIMATION) {
          this.currentAnimationMode = AnimationMode.CONTENT_FIRST_WITH_JUMP;
        } else if (this.currentAnimationMode === AnimationMode.CONTENT_FIRST_WITH_JUMP) {
          this.currentAnimationMode = AnimationMode.ACTION_FIRST_WITH_JUMP;
        } else if (this.currentAnimationMode === AnimationMode.ACTION_FIRST_WITH_JUMP) {
          this.currentAnimationMode = AnimationMode.CONTENT_FIRST;
        }
      })
        .width('50%')
        .margin(this.marginTop)

      Button('index change page').onClick((event: ClickEvent) => {
        this.currentIndex = (this.currentIndex + 1) % 4;
      })
        .width('50%')
        .margin(this.marginTop)
      
      Button('controller change page').onClick((event: ClickEvent) => {
        let index = (this.currentIndex + 1) % 4
        this.controller.changeIndex(index);
      })
        .margin(this.marginTop)
        .width('50%')
    }
    .width('100%')
    .height('100%')
  }
}

//控制页面缓存数
//可以通过cachedMaxCount接口，设置子组件的最大缓存个数和缓存模式
//默认情况下Tabs创建时会一次性预加载所有TabContent，而且已加载的页面不会释放
/**
 * TabsCacheMode枚举值为CACHE_BOTH_SIDE时，缓存当前显示的子组件和其两侧的子组件。
 * TabsCacheMode枚举值为CACHE_LATEST_SWITCHED时，缓存当前显示的子组件和最近切换过的子组件。
 * 存在翻页动画时，从页面1直接切换到页面3，翻页动画会包含页面2，页面2也会被加载，如果此时页面2不在缓存范围内，页面切换完成后会立马释放。
 */
@Component
struct CacheTabsContentExample {
  build() {
    Tabs() {
      TabContent() {
        MyComponent({colorText : 'blue', color : Color.Blue})
      }.tabBar('blue')

      TabContent() {
        MyComponent({colorText : 'yellow', color : Color.Yellow})
      }.tabBar('yellow')

      TabContent() {
        MyComponent({colorText : 'pink', color : Color.Pink})
      }.tabBar('pink')

      TabContent() {
        MyComponent({colorText : 'red', color : Color.Red })
      }.tabBar('red')
    }
    .width('100%')
    .height(500)
    .cachedMaxCount(1, TabsCacheMode.CACHE_BOTH_SIDE)
  }
}

@Component
struct MyComponent {
  private colorText : string = '';
  private color : Color = Color.White;

  aboutToAppear(): void {
    console.info("aboutToAppear color:" + this.colorText);
  }

  aboutToDisappear(): void {
    console.info("aboutToDisappear color:" + this.colorText);
  }

  build() {
    Column() {
      Text(this.colorText).fontSize(30)
    }
    .backgroundColor(this.color)
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}