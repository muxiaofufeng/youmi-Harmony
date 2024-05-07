@Preview
@Component
export struct HomeView {
  @State currentTabIndex: number = 0;
  @State groups: Array<string> = [
    '全部',
    '最近',
  ];
  private controller: TabsController = new TabsController()

  build() {
    Column() {
      Text('Home')
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)

    /*Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.controller }) {
        ForEach(this.groups, (item: string, index: number) => {
          TabContent() {
            Column() {
              Text(item).fontSize(30).margin({ left: 20 })
            }
          }
          .tabBar(this.tabBuilder(item, index))
        })
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Fixed)*/
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
    }.width(80)
    .onClick(() => {
      this.currentTabIndex = index;
    })
  }
}