import { ExploreView } from '../view/Explore';
import { HomeView } from '../view/Home';
import { SettingView } from '../view/Setting';


@Entry
@Component
struct Index {
  /** Tabs 的当前索引 */
  @State currentIndex: number = 0
  /** 是否显示气泡弹窗 */
  @State handlePopup: boolean = false
  /** 需要进行弹窗的 Tabs 索引 */
  @State currentPopupIndex: number = 0
  /** Tabs 控制器 */
  private controller: TabsController = new TabsController()
  /** 图标 */
  private tabBarIcons: Resource[] = [
    $r('app.media.bookshelf'),
    $r('app.media.explore'),
    $r('app.media.user'),
  ]
  /** 长按时的提示 */
  private tabBarPopup: Resource[] = [
    $r('app.string.bookshelf'),
    $r('app.string.explore'),
    $r('app.string.user'),
  ]
  private iconLg: Resource = $r('app.float.icon_lg')
  private primary: Resource = $r('app.color.primary')
  private bgColor: Resource = $r('app.color.background')
  private onFontColor: Resource = $r('app.color.on_font_color')

  build() {
    Tabs({ controller: this.controller }) {
      TabContent() {
        HomeView()
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
    .vertical(false)
    .barPosition(BarPosition.End)
    .barMode(BarMode.Fixed)
    .onAnimationStart((_, targetIndex) => {
      this.currentIndex = targetIndex
    })
  }

  /**
   * 底部导航条
   * @param index 索引
   */
  @Builder
  tabBuilder(index: number) {
    Column() {
      Button({ type: ButtonType.Normal, buttonStyle: ButtonStyleMode.NORMAL }) {
        Image(this.tabBarIcons[index])
          .width(this.iconLg)
          .height(this.iconLg)
          .fillColor(this.currentIndex === index ? this.primary : this.onFontColor)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor(this.bgColor)
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
      placement: Placement.Bottom, // 气泡的弹出位置
      backgroundBlurStyle: BlurStyle.Thin,
      popupColor: this.onFontColor
    })
  }

  /**
   * 气泡弹窗
   */
  @Builder
  popupBuild() {
    Row() {
      Text(this.tabBarPopup[this.currentPopupIndex])
        .fontColor(this.bgColor)
    }
    .padding(20)
  }
}