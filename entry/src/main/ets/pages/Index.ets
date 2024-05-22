import mediaQuery from '@ohos.mediaquery';
import { ExploreView } from '../component/view/Explore';
import { ShelfView } from '../component/view/Shelf';
import { SettingView } from '../component/view/Setting';


@Entry
@Component({ freezeWhenInactive: true })
struct Index {
  /** Tabs 的当前索引 */
  @State currentIndex: number = 0
  /** 是否显示气泡弹窗 */
  @State handlePopup: boolean = false
  /** 需要进行弹窗的 Tabs 索引 */
  @State currentPopupIndex: number = 0
  /** 设备是否是水平的 */
  @State horizontal: boolean = false
  /** Tabs 控制器 */
  private controller: TabsController = new TabsController()
  /** 底部导航的图标 */
  private barIcons: Resource[] = [
    $r('app.media.bookshelf'),
    $r('app.media.explore'),
    $r('app.media.user'),
  ]
  /** 底部导航长按时的提示 */
  private barPopup: Resource[] = [
    $r('app.string.bookshelf'),
    $r('app.string.explore'),
    $r('app.string.user'),
  ]
  /** 媒体查询的监听 */
  private listener: mediaQuery.MediaQueryListener = mediaQuery.matchMediaSync('(orientation: landscape)')
  private iconLg: Resource = $r('app.float.icon_lg')
  private primary: Resource = $r('app.color.primary')
  private secondFontColor: Resource = $r("app.color.secondFontColor")

  /**
   * 函数在创建自定义组件的新实例后，在执行其build()函数之前执行
   */
  aboutToAppear(): void {
    // 监听横屏事件, 设备方向改变时调用
    this.listener.on('change', (result) => {
      this.horizontal = result.matches
    })
  }

  /**
   * 函数在自定义组件析构销毁之前执行。不允许在aboutToDisappear函数中改变状态变量
   */
  aboutToDisappear(): void {
    // 取消 listener 下的所有 change 事件回调
    this.listener.off('change')
  }

  build() {
    Tabs({ controller: this.controller }) {
      TabContent() {
        ShelfView()
      }
      .tabBar(this.tabBuilder(0))

      TabContent() {
        ExploreView()
      }
      .tabBar(this.tabBuilder(1))

      TabContent() {
        SettingView()
      }
      .tabBar(this.tabBuilder(2))
    }
    .width('100%')
    .height('100%')
    .vertical(this.horizontal)
    .scrollable(false)
    .barPosition(this.horizontal ? BarPosition.Start : BarPosition.End)
    .barMode(BarMode.Fixed)
    .onAnimationStart((_, targetIndex) => {
      this.currentIndex = targetIndex
    })
    .backgroundColor($r('app.color.background'))
    .barBackgroundColor($r('app.color.bottomBar'))
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }

  /**
   * 底部导航条
   * @param index 索引
   */
  @Builder
  tabBuilder(index: number) {
    Column() {
      Button({ type: ButtonType.Normal, buttonStyle: ButtonStyleMode.TEXTUAL }) {
        Image(this.barIcons[index])
          .width(this.iconLg)
          .height(this.iconLg)
          .fillColor(this.currentIndex === index ? this.primary : this.secondFontColor)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .gesture(
      LongPressGesture()
        .onAction(() => {
          this.currentPopupIndex = index
          this.handlePopup = true
        })
        .onActionEnd(() => {
          setTimeout(() => this.handlePopup = false, 500)
        })
    )
    .bindPopup(this.handlePopup && this.currentPopupIndex == index, {
      builder: (): void => this.popupBuild(),
      placement: this.horizontal ? Placement.Right : Placement.Bottom, // 气泡的弹出位置
      backgroundBlurStyle: BlurStyle.Thin,
      popupColor: this.secondFontColor
    })
  }

  /**
   * 气泡弹窗
   */
  @Builder
  popupBuild() {
    Row() {
      Text(this.barPopup[this.currentPopupIndex])
        .fontColor($r('app.color.onFontColor'))
    }
    .padding(20)
  }
}