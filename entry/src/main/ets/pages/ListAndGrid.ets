/**
 * 列表与网格
 */
@Entry
@Component
struct Start {
  build() {
    Column() {
      GridExample()
    }
  }
}

/**
 * 列表
 */
@Component
struct CityListExample {
  build() {
    List({ 'space': 20 }) {
      ListItem() {
        Text('北京').fontSize(30)
      }.backgroundColor(Color.Grey)

      ListItem() {
        Text('上海').fontSize(30)
      }.backgroundColor(Color.Grey)

      ListItem() {
        Text('广州').fontSize(30)
      }.backgroundColor(Color.Grey)
    }
    .alignListItem(ListItemAlign.Center) //设置交叉轴对齐方式
    .lanes(1) //设置交叉轴列数
    .listDirection(Axis.Vertical) //设置主轴方向
  }
}

//迭代列表内容
@Component
struct iterateListExample {
  arr: Array<string> = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']

  build() {
    List() {
      ForEach(this.arr, (item: string) => {
        ListItem() {
          Text(item).fontSize(30).textAlign(TextAlign.Center)
        }.width('100%').height(150)
      })
    }
    .divider({
      strokeWidth: 2,
      color: Color.Grey,
      startMargin: 10,
      endMargin: 10
    }) //设置分隔线
    //startMargin和endMargin属性分别用于设置分隔线距离列表侧边起始端的距离和距离列表侧边结束端的距离。
    .scrollBar(BarState.Auto) //添加滚动条 默认Auto On显示， Off关闭
  }
}

//分组列表
@Component
struct ListItemGroupExample {
  //分组列表头部组件
  @Builder
  itemHead(title: string) {
    Text(title)
      .width('100%')
      .fontSize(30)
      .textAlign(TextAlign.Start)
      .padding(5)
      .background(Color.Pink)
  }

  build() {
    List() {
      ListItemGroup({ header: this.itemHead('A') }) {
        ListItem() {
          Text('1').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('2').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('3').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('4').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('5').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }
      }

      ListItemGroup({ header: this.itemHead('B') }) {
        ListItem() {
          Text('1').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('2').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('3').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('4').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }

        ListItem() {
          Text('5').width('100%').textAlign(TextAlign.Start).fontSize(20).height(150)
        }
      }
    }
    .sticky(StickyStyle.Header) //设置粘性标题吸顶效果
  }
}

//控制滚动位置
@Component
struct ControlScrollPositionExample {
  private listScroller: Scroller = new Scroller()

  @Builder itemEnd(index : number) {
    Button(index.toString()).onClick((event: ClickEvent) => {

    })
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      List({ scroller: this.listScroller }) { //设置滚动控制器
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
          ListItem() {
            Text(item.toString()).fontSize(20).width('100%').height(150).textAlign(TextAlign.Center)
          }
          //响应列表项侧滑
          //swipeAction属性可用于实现列表项的左右滑动功能
          //start参数表示设置列表项右滑时起始端滑出的组件，end参数表示设置列表项左滑时尾端滑出的组件。
          .swipeAction({end : {builder : () => this.itemEnd(item)}})
        }, (item : number) => JSON.stringify(item))
      }
      .divider({strokeWidth : 2, color : Color.Grey, startMargin : 10, endMargin : 10})
      .onScrollIndex((firstIndex : number) => { //设置滚动位置监听
        console.info("scroll index:" + firstIndex)
      })
      .cachedCount(2) //设置缓存 显示区域外上下各会预加载并布局cachedCount行ListItem

      Button('返回顶部').onClick((event: ClickEvent) => {
        this.listScroller.scrollToIndex(0)
      })
    }
  }
}

/**
 * 网格
 */
@Component
struct GridExample {
  private services : Array<string> = ['1', '2', '3', '4']

  build() {
    Grid() {
      ForEach(this.services, (item : string) => {
        GridItem() {
          Column() {
            Text(item).fontSize(20)
          }
          .backgroundColor(Color.Grey)
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
        }
      })
    }
    .rowsTemplate('1fr 1fr') //设置子组件行数以及行占比
    .columnsTemplate('1fr 1fr') //设置子组件列数以及列占比
    .rowsGap(10) //行间距
    .columnsGap(10) //列间距
  }
}

@Component
struct GridExample1 {
  build() {
    Grid() {

    }
    .layoutDirection(GridDirection.Row) //设置主轴方向
    .maxCount(3) //主轴最大子组件数量
  }
}

/**
 * 瀑布流 WaterFlow
 */
