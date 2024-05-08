import { BarItem } from '../../common/Types';
import { ExploreView } from '../view/Explore';
import { HomeView } from '../view/Home';
import { SettingView } from '../view/Setting';


@Entry
@Component
struct Index {
  @State toolBarId: string = 'bookshelf';
  @State toolBars: Array<BarItem> = [
    {
      id: 'bookshelf',
      icon: $r('app.media.bookshelf'),
      activeIcon: $r("app.media.bookshelf_fill"),
    },
    {
      id: 'explore',
      icon: $r('app.media.explore'),
      activeIcon: $r("app.media.explore_fill"),
    },
    {
      id: 'setting',
      icon: $r('app.media.user'),
      activeIcon: $r("app.media.user_fill"),
    },
  ];
  // 动画转场时间
  private duration: number = 300;

  build() {
    Navigation() {
      if (this.toolBarId === 'bookshelf') {
        HomeView()
          .geometryTransition('home')
          .transition(TransitionEffect.OPACITY.animation({ duration: this.duration }))
      } else if (this.toolBarId === 'explore') {
        ExploreView()
          .geometryTransition('home')
          .transition(TransitionEffect.OPACITY.animation({ duration: this.duration }))
      } else if (this.toolBarId === 'setting') {
        SettingView()
          .geometryTransition('home')
          .transition(TransitionEffect.OPACITY.animation({ duration: this.duration }))
      }
    }
    .mode(NavigationMode.Auto)
    .hideTitleBar(true)
    .toolbarConfiguration(this.navigationToolbar)
    .hideToolBar(false)
    .width('100%')
    .height('100%')
  }

  // 底部导航条
  @Builder
  navigationToolbar() {
    Row() {
      ForEach(this.toolBars, (item: BarItem) => {
        Column() {
          Button({ type: ButtonType.Normal, stateEffect: true, buttonStyle: ButtonStyleMode.NORMAL }) {
            Image(this.toolBarId === item.id ? item.activeIcon : item.icon)
              .width(28)
              .height(28)
          }
          .width('100%')
          .height('100%')
          .borderRadius(10)
          .backgroundColor($r('app.color.background'))
          .onClick(() => {
            this.toolBarId = item.id!;
          })
        }
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .flexShrink(1)
      })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .shadow({ radius: 15, color: $r('app.color.on_background') })
  }
}