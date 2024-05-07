import { OperationType, SubHeader } from '@ohos.arkui.advanced.SubHeader';
import promptAction from '@ohos.promptAction';
import { $$this } from '../../entity/component/other';

@Preview
@Component
export struct HomeView {
  @State currentTabIndex: number = 0;
  @State isRefreshing: boolean = false
  @State groups: Array<string> = [
    '全部',
    '最近',
    '喜欢',
    '小说',
    '漫画',
    '百合',
  ];
  @State items: Array<string> = [
    '防静电',
    '防静电开始今日份科技风数据额空间f',
    '防静电开',
    '防静电开',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电',
  ];
  private controller: TabsController = new TabsController()
  private _primary: ResourceColor = $r('app.color.primary')
  private _background: ResourceColor = $r('app.color.background')
  private _on_background: ResourceColor = $r('app.color.on_background')
  private _font_color: ResourceColor = $r('app.color.font_color')
  private _on_font_color: ResourceColor = $r('app.color.on_font_color')
  private imageWidth: number = 110;

  build() {
    Column() {
      SubHeader({
        primaryTitle: '书架',
        operationType: OperationType.ICON_GROUP,
        operationItem: [
          {
            value: $r('app.media.search'),
            action: () => {
              promptAction.showToast({ message: '搜索' })
            }
          },
          {
            value: $r('app.media.history'),
            action: () => {
              promptAction.showToast({ message: '历史记录' })
            }
          },
          {
            value: $r('app.media.more'),
            action: () => {
              promptAction.showToast({ message: '更多' })
            }
          }
        ]
      })
        .backgroundColor(this._background)
        .shadow({ radius: 20, color: this._on_background, offsetY: 5 })
        .zIndex(2)
      Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.controller }) {
        ForEach(this.groups, (item: string, index: number) => {
          TabContent() {
            Refresh({ refreshing: $$this.isRefreshing }) {
              this.gridBuild()
            }
            .onRefreshing(() => {
              promptAction.showToast({ message: '正在刷新' })
              // TODO: 刷新操作
              setTimeout(() => this.isRefreshing = false, 1000)
            })
          }
          .tabBar(this.tabBuilder(item, index))
        })
      }
      .vertical(false)
      .scrollable(true)
      .fadingEdge(false)
      .barGridAlign({ sm: 10, })
      .barMode(BarMode.Scrollable, { margin: 10, nonScrollableLayoutStyle: LayoutStyle.ALWAYS_AVERAGE_SPLIT })
      .flexShrink(1)
      .backgroundColor(this._background)
    }
    .height('100%')
    .backgroundColor(this._on_background)
  }

  @Builder
  tabBuilder(name: string, index: number) {
    Column() {
      Button({ type: ButtonType.Normal, stateEffect: true, buttonStyle: ButtonStyleMode.NORMAL }) {
        Text(name)
          .fontSize(14)
          .fontColor(this.currentTabIndex === index ? this._background : this._on_font_color)
      }
      .width(60)
      .height(32)
      .backgroundColor(this.currentTabIndex === index ? this._primary : this._background)
      .borderRadius('50%')
      .padding(0)
      .margin({ right: 5, left: 5 })
      .onClick(() => {
        this.currentTabIndex = index;
      })
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  gridBuild() {
    Grid() {
      ForEach(this.items, (item: string) => {
        GridItem() {
          Button({ type: ButtonType.Normal, stateEffect: true, buttonStyle: ButtonStyleMode.NORMAL }) {
            Column() {
              Image($r('app.media.splash'))
                .width('100%')
                .height(this.imageWidth * 1.16)
                .objectFit(ImageFit.Cover)
              Text(item)
                .margin({ top: 5 })
                .fontSize(14)
                .fontColor(this._font_color)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .justifyContent(FlexAlign.Start)
          }
          .padding(10)
          .width(this.imageWidth)
          .height(this.imageWidth * 1.16 + 50)
          .backgroundColor(Color.Transparent)
          .onClick(() => {
            promptAction.showToast({ message: '进入正文页' })
          })
          .gesture( // 绑定手势
            LongPressGesture().onAction(() => {
              promptAction.showToast({ message: '长按查看详情' })
            })
          )
        }
      })
    }
    .columnsTemplate(`repeat(auto-fit, ${ this.imageWidth }vp)`)
    .columnsGap(0)
    .rowsGap(0)
    .minCount(3) // 当layoutDirection是Row/RowReverse时，表示可显示的最小列数
    .edgeEffect(EdgeEffect.Fade) // 设置组件的边缘滑动效果
    .enableScrollInteraction(true) // 设置是否支持滚动手势
    .scrollBarWidth(2)
  }
}