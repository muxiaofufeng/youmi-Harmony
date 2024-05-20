import { ExploreView } from '../view/Explore';
import { HomeView } from '../view/Home';
import { SettingView } from '../view/Setting';


@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  private tabBarIcons: Resource[] = [
    $r('app.media.bookshelf'),
    $r('app.media.explore'),
    $r('app.media.user'),
  ]
  private icon_lg: Resource = $r('app.float.icon_lg')

  aboutToAppear(): void {
  }

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
          .width(this.icon_lg)
          .height(this.icon_lg)
          .fillColor(this.currentIndex === index ? $r('app.color.primary') : $r('app.color.on_font_color'))
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor($r('app.color.background'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}