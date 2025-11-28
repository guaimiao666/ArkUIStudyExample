/**
 * 进度条 (Progress)
 */
@Entry
@Component
struct Start {
  build() {
    Column() {
      ProgressExample()
    }
  }
}

@Component
struct ProgressExample {
  @State currentValue: number = 0;

  build() {
    Column({ space: 5 }) {
      //设置进度条样式
      Progress({ value: 24, total: 100, type: ProgressType.Linear }) //线性

      //环形无刻度
      Row({ space: 5 }) {
        // 从左往右，1号环形进度条，默认前景色为蓝色渐变，默认strokeWidth进度条宽度为2.0vp
        Progress({ value: 40, total: 150, type: ProgressType.Ring }).width(100).height(100)
        // 从左往右，2号环形进度条
        Progress({ value: 40, total: 150, type: ProgressType.Ring }).width(100).height(100)
          .color(Color.Grey)    // 进度条前景色为灰色
          .style({ strokeWidth: 15 }) // 设置strokeWidth进度条宽度为15.0vp
      }

      //环形有刻度
      Row({ space: 5 }) {
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing }).width(100).height(100)
          .backgroundColor(Color.Black)
          .style({ scaleCount: 20, scaleWidth: 5 }) // 设置环形有刻度进度条总刻度数为20，刻度宽度为5vp
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing }).width(100).height(100)
          .backgroundColor(Color.Black)
          .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 5 }) // 设置环形有刻度进度条宽度15，总刻度数为20，刻度宽度为5vp
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing }).width(100).height(100)
          .backgroundColor(Color.Black)
          .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 3 }) // 设置环形有刻度进度条宽度15，总刻度数为20，刻度宽度为3vp
      }

      //圆形样式
      Row({ space: 5 }) {
        // 从左往右，1号圆形进度条，默认前景色为蓝色
        Progress({ value: 10, total: 150, type: ProgressType.Eclipse }).width(100).height(100)
        // 从左往右，2号圆形进度条，指定前景色为灰色
        Progress({ value: 20, total: 150, type: ProgressType.Eclipse }).color(Color.Grey).width(100).height(100)
      }

      //胶囊样式
      Row({ space: 5 }) {
        /*说明
        头尾两端圆弧处的进度展示效果与ProgressType.Eclipse样式一致。
        中段处的进度展示效果为矩形状长条，与ProgressType.Linear线性样式相似。
        组件高度大于宽度时，自适应垂直显示。*/
        Progress({ value: 10, total: 150, type: ProgressType.Capsule }).width(100).height(50)
        Progress({ value: 20, total: 150, type: ProgressType.Capsule }).width(50).height(100).color(Color.Grey)
        Progress({ value: 50, total: 150, type: ProgressType.Capsule })
          .width(50)
          .height(100)
          .color(Color.Blue)
          .backgroundColor(Color.Black)
      }

      Progress({ value: this.currentValue, total: 100, type: ProgressType.Capsule })
        .width('90%')
        .height(40)
        .backgroundColor(Color.White)
        .color(Color.Grey)
      Button('add progress').onClick((event: ClickEvent) => {
        this.currentValue = (this.currentValue + 5) % 100;
      })
    }
    .padding(10)
  }
}