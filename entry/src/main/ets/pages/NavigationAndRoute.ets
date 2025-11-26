/**
 * 组件导航 页面路由
 */
//https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-navigation-navigation
@Entry
@Component
struct Start {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  private arr: number[] = [1, 2, 3];

  @Builder
  PageMap(name: string) {
    if (name === 'page1') {
      PageOne()
    } else if (name === 'page2') {
      PageTwo()
    } else if (name === 'page3') {
      PageThree()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({ space: 10 }) {
        ForEach(this.arr, (item: number) => {
          Button('page' + item)
            .onClick(() => {
              this.pageInfos.pushPathByName('page' + item, '')
            })
        })
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .navDestination(this.PageMap)
    .mode(NavigationMode.Auto) //页面显示模式 自适应 单栏 双栏
  }
}

//page1
@Component
struct PageOne {
  pageInfos: NavPathStack = new NavPathStack()
  pageParam : string = ''

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('jump page two').onClick((event: ClickEvent) => {
          this.pageInfos.pushPathByName('page2', '')
        })
        Button('back').onClick((event: ClickEvent) => {
          this.pageInfos.pop()
        })
      }
    }
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack //获取导航控制器
      this.pageParam = context.pathInfo.param as string //获取参数
    })
    .mode(NavDestinationMode.STANDARD) //页面显示类型
  }
}

//page2
@Component
struct PageTwo {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('jump page three').onClick((event: ClickEvent) => {
          this.pageInfos.pushPathByName('page3', '')
        })
        Button('back').onClick((event: ClickEvent) => {
          this.pageInfos.pop()
        })
      }
    }
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })
  }
}

//page3
@Component
struct PageThree {
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('jump page one').onClick((event: ClickEvent) => {
          this.pageInfos.pushPathByName('page1', '')
        })
        Button('back').onClick((event: ClickEvent) => {
          this.pageInfos.pop()
        })
      }
    }
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })
  }
}
