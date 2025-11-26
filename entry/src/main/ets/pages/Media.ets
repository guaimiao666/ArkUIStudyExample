/**
 * 媒体展示
 */
@Entry
@Component
struct Start {
  build() {
    Column() {
      SwiperExample()
    }
  }
}

/**
 * 显示图片 (Image)
 */
@Component
struct ImageExample {
  build() {
    Scroll() {
      Column() {
        Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
          Image($r('app.media.img'))
            .width(200)
            .height(150)
            .margin(15)
            // 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。
            .objectFit(ImageFit.Contain)
            // 对图片进行插值
            .interpolation(ImageInterpolation.None)
            // 设置图片渲染模式： 原色和黑白
            .renderMode(ImageRenderMode.Template) //黑白
            //图片同步加载
            .syncLoad(true)
            //设置图片解码尺寸，降低图片分辨率
            .sourceSize({ width: 40, height: 40 })
            //设置事件
            //图片加载成功
            .onComplete(msg => {
              if (msg) {
                console.info('width:' + msg.width + " height:" + msg.height + " componentWidth:" + msg.componentWidth +
                  " componentHeight:" + msg.componentHeight)
              }
            })
            // 图片获取失败，打印结果
            .onError(() => {
              console.info('load image fail')
            })
            .border({ width: 1 })
            .overlay('Fit:Contain-interpolation:None', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          Image($r('app.media.img'))
            .width(200)
            .height(150)
            .border({ width: 1 })
            // 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。
            .objectFit(ImageFit.Cover)
            // 对图片进行插值
            .interpolation(ImageInterpolation.Low)
            .margin(15)
            .overlay('Fit:Cover-interpolation:Low', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          Image($r('app.media.img'))
            .width(200)
            .height(150)
            .border({ width: 1 })
            // 自适应显示。
            .objectFit(ImageFit.Auto)
            // 对图片进行插值
            .interpolation(ImageInterpolation.Medium)
            .margin(15)
            .overlay('Fit:Auto-interpolation:Medium', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        }

        Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
          Image($r('app.media.img'))
            .width(200)
            .height(150)
            .border({ width: 1 })
            // 不保持宽高比进行放大缩小，使得图片充满显示边界。
            .objectFit(ImageFit.Fill)
            .margin(15)
            .overlay('Fill', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          Image($r('app.media.img'))
            .width(200)
            .height(150)
            .border({ width: 1 })
            // 保持宽高比显示，图片缩小或者保持不变。
            .objectFit(ImageFit.ScaleDown)
            .margin(15)
            .overlay('ScaleDown', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          Image($r('app.media.img'))
            .width(200)
            .height(150)
            .border({ width: 1 })
            // 保持原有尺寸显示。
            .objectFit(ImageFit.None)
            .margin(15)
            .overlay('None', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        }
      }
    }
  }
}

/**
 * 视频播放 (Video)
 */
@Component
struct VideoExample {
  videoSrc: string = "https://www.pexels.com/zh-cn/download/video/34908578/"
  previewSrc: Resource = $r('app.media.img')
  controller: VideoController = new VideoController();

  build() {
    Column() {
      Video({
        src: this.videoSrc, //视频源
        previewUri: this.previewSrc, //预览图
        controller: this.controller //控制器
      })
        .muted(false) // 设置是否静音
        .controls(true) // 设置是否显示默认控制条
        .autoPlay(true) // 设置是否自动播放
        .loop(false) // 设置是否循环播放
        .objectFit(ImageFit.Contain) // 设置视频填充模式
        .onUpdate((event) => { // 更新事件回调
          console.info("Video update.");
        })
        .onPrepared((event) => { // 准备事件回调
          console.info("Video prepared.");
        })
        .onError(() => { // 失败事件回调
          console.error("Video error.");
        })
        .onStop(() => { // 停止事件回调
          console.info("Video stopped.");
        })
    }
  }
}

//自定义控制器
@Component
struct CustomVideoControllerExample {
  @State videoSrc: string = "https://www.pexels.com/zh-cn/download/video/34908578/"
  @State previewUri: string = 'common/videoIcon.png'
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State currentTime: number = 0
  @State durationTime: number = 0
  controller: VideoController = new VideoController()

  build() {
    Row() {
      Column() {
        Video({
          src: this.videoSrc,
          previewUri: this.previewUri,
          currentProgressRate: this.curRate,
          controller: this.controller
        })
          .controls(false)
          .autoPlay(true)
          .onPrepared((event) => {
            if (event) {
              this.durationTime = event.duration
            }
          })
          .onUpdate((event) => {
            if (event) {
              this.currentTime = event.time
            }
          })
        Row() {
          Text(JSON.stringify(this.currentTime) + 's')
          Slider({
            value: this.currentTime,
            min: 0,
            max: this.durationTime
          })
            .onChange((value: number, mode: SliderChangeMode) => {
              this.controller.setCurrentTime(value); // 设置视频播放的进度跳转到value处
            })
            .width("90%")
          Text(JSON.stringify(this.durationTime) + 's')
        }
        .opacity(0.8)
        .width("100%")
      }
      .width('100%')
    }
    .height('40%')
  }
}

/**
 * 创建轮播 (Swiper)
 */
@Component
struct SwiperExample {
  build() {
    Swiper() {
      Text('1')
        .width('100%')
        .height('100%')
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Pink)
      Text('2')
        .width('100%')
        .height('100%')
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Green)
      Text('3')
        .width('100%')
        .height('100%')
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Red)
      Text('4')
        .width('100%')
        .height('100%')
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
    }
    .loop(true) //是否循环
    .autoPlay(true) //是否自动轮播
    .interval(1000) //轮播间隔 毫秒
    .vertical(false) //轮播方向 true为竖直方向 false为横向
    .displayCount(2) //每页2个子项
    .maintainVisibleContentPosition(true) //可在使用LazyForEach懒加载数据时（如通过onDataAdd新增数据），保持当前可见内容位置不变，避免因数据增删导致的视图跳动。该属性默认值为false。
    // .displayArrow(true, false) //导航箭头使用默认样式
    //自定义导航点样式
    .indicator(
      Indicator.dot()
        .left(20)
        .itemWidth(15)
        .itemHeight(15)
        .selectedItemWidth(30)
        .selectedItemHeight(15)
        .color(Color.Red)
        .selectedColor(Color.Blue)
    )
    //自定义导航箭头
    .displayArrow({
      showBackground: true,
      isSidebarMiddle: true,
      backgroundSize: 24,
      backgroundColor: Color.White,
      arrowSize: 18,
      arrowColor: Color.Blue
    })
  }
}

//通过控制器切换页面
@Component
struct SwiperControllerExample {
  @State currentIndex: number = 0;
  private controller: SwiperController = new SwiperController();

  build() {
    Column({ space: 5 }) {
      Swiper(this.controller) {
        Text('1')
          .width('100%')
          .height('50%')
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .fontSize(30)
        Text('2')
          .width('100%')
          .height('50%')
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .fontSize(30)
        Text('3')
          .width('100%')
          .height('50%')
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .fontSize(30)
      }
      .loop(true)
      .autoPlay(false)

      Button('next page').onClick((event: ClickEvent) => {
        this.currentIndex = (this.currentIndex + 1) % 3
        this.controller.changeIndex(this.currentIndex, true)
      })

      Button('previous page').onClick((event: ClickEvent) => {
        this.currentIndex--
        if (this.currentIndex < 0) {
          this.currentIndex = 2;
        }
        this.controller.changeIndex(this.currentIndex, true)
      })

      Button('next').onClick((event: ClickEvent) => {
        this.controller.showNext()
      })

      Button('previous').onClick((event: ClickEvent) => {
        this.controller.showPrevious()
      })
    }
  }
}
