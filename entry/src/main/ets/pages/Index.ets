@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  @State currentTabIndex: number = 0;
  @State bars: Array<ToolbarItem> = [
    {
      value: $r('app.media.bookshelf'),
      icon: $r('app.media.bookshelf'),
      activeIcon: $r("app.media.bookshelf_fill"),
    },
    {
      value: $r('app.media.explore'),
      icon: $r('app.media.explore'),
      activeIcon: $r("app.media.explore_fill"),
    },
    {
      value: $r('app.media.user'),
      icon: $r('app.media.user'),
      activeIcon: $r("app.media.user_fill"),
    },
  ];
  @State menus: Array<NavigationMenuItem> = [
    {
      value: 'search',
      icon: 'app.media.search',
    },
    {
      value: 'search',
      icon: 'app.media.search',
    }
  ];
  @State groups: Array<string> = [
    '全部',
    '最近',
  ];
  private controller: TabsController = new TabsController()

  build() {
    Navigation() {
      Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.controller }) {
        ForEach(this.groups, (item: string, index: number) => {
          TabContent() {
            Column() {
              Text(item).fontSize(30).margin({ left: 20 })
            }
          } //.tabBar(this.tabBuilder(item, index))
          .tabBar(item)
        })
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Scrollable)
    }
    .title('书架')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .menus(this.navigationMenus)
    .toolbarConfiguration(this.navigationToolbar)
    .hideToolBar(false)
    .width('100%')
    .height('100%')
  }

  @Builder
  navigationMenus() {
    Row() {
      ForEach(this.menus, (item: NavigationMenuItem) => {
        Image($r(item.icon))
          .width(28)
          .height(28)
          .margin(10)
      })
    }
  }

  @Builder
  navigationToolbar() {
    Row() {
      ForEach(this.bars, (item: ToolbarItem, index: number) => {
        Column() {
          Image(this.currentIndex === index ? item.activeIcon : item.value)
            .width(28)
            .height(28)
        }
        .height('100%')
        .flexGrow(1)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.currentIndex = index;
        })
      })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  tabBuilder(name: string, index: number) {
    Column() {
      Text(name)
        .fontColor(this.currentTabIndex === index ? '#007DFF' : '#182431')
        .fontSize(16)
        .fontWeight(this.currentTabIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentTabIndex === index ? 1 : 0)
    }.flexGrow(1) //.width('100%')
  }
}