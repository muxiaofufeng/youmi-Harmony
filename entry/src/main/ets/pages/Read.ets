import webview from '@ohos.web.webview';
import display from '@ohos.display';

/**
 * 翻页动画分类
 */
enum FlipType {
  /** 覆盖 */
  Cover,
  /** 滑动 */
  Slide,
  /** 仿真 */
  Simulation,
  /** 滚动 */
  Roll,
  /** 无动画 */
  None,
}

export const CONFIGURATION: Record<string, number> = {
  'TABBAR_TEXT_CURRENTINDEX_FONTWEIGHT': 500,
  'PAGEFLIPTWO': 2,
  'PAGEFLIPTHREE': 3,
  'PAGEFLIPFOUR': 4,
  'PAGEFLIPFIVE': 5,
  'PAGEFLIPTWELVE': 12,
  'PAGEFLIPTHIRTEEN': 13,
  'FLIPPAGEZINDEX': 2,
  'PAGEFLIPBOTTOMBLANKBEIGHT': 0.3,
  'PAGEFLIPBORDERWIDTH': 2,
  'PAGEFLIPTOASTDURATION': 300,
  'WINDOWWIDTH': 600,
  'PAGEFLIPPAGESTART': 1,
  'PAGEFLIPPAGEEND': 14,
  'PAGEFLIPRIGHTFLIPOFFSETX': 10,
  'PAGEFLIPLEFTFLIPOFFSETX': -10,
  'PAGEFLIPCACHECOUNT': 3,
  'LETTERSPACING': 3,
}

export const STRINGCONFIGURATION: Record<string, string> = {
  'PAGEFLIPRESOURCE': 'app.string.pageflip_content',
  'PAGEFLIPVIEWLIST': 'flippage_view_list',
  'PAGEFLIPFREE': 'flippage_free',
  'PAGEFLIPDISCOVER': 'flippage_discover',
  'PAGEFLIPBRIGHTNESS': 'flippage_brightness',
  'PAGEFLIPSETTINGS': 'flippage_settings',
  'LEFTRIGHTFLIPPAGENAME': '左右翻页',
  'UPDOWNFLIPPAGENAME': '上下翻页',
  'COVERFLIPPAGENAME': '覆盖翻页',
  'FLIPPAGECLOUDUPLOAD': 'app.media.flippage_cloud_upload',
  'FLIPPAGECONTACTS': 'app.media.flippage_contacts',
  'FLIPPAGESHAREFILLED': 'app.media.flippage_share_filled',
  'FLIPPAGEMOREFILLED': 'app.media.flippage_more_filled',
}

class BasicDataSource implements IDataSource {
  private elements: string[] = [];
  private listeners: Set<DataChangeListener>;

  constructor(elements: string[]) {
    this.elements = elements;
    this.listeners = new Set();
  }

  public totalCount(): number {
    return this.elements.length;
  }

  public getData(index: number): string {
    /**
     * TODO:知识点:1.当index等于this.totalCount() - 1时向后请求网络数据。当index等于0时向前请求网络数据。
     * TODO:知识点:2.新请求到的数据可以通过push插入到队尾，通知listeners刷新添加可参考pushItem方法。如果想要插到队头可以通过unshift插入到队头，通知listeners刷新添加可参考addItem方法。
     */
    return this.elements[index];
  }

  public indexOf(item: string): number {
    return this.elements.indexOf(item);
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  public registerDataChangeListener(listener: DataChangeListener): void {
    this.listeners.add(listener);
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  public unregisterDataChangeListener(listener: DataChangeListener): void {
    this.listeners.delete(listener);
  }

  public pinItem(item: string, index: number): void {
    this.elements.splice(index, 1);
    this.elements.unshift(item);
    this.listeners.forEach(listeners => listeners.onDataReloaded());
  }

  // 从开头添加数据
  public addItem(item: string): void {
    this.elements.unshift(item);
    this.listeners.forEach(listeners => listeners.onDataAdd(0));
  }

  // 从结尾插入数据
  public pushItem(item: string): void {
    this.elements.push(item);
    this.listeners.forEach(listeners => listeners.onDataAdd(this.elements.length - 1));
  }

  public insertItem(item: string, index: number): void {
    this.elements.splice(index, 0, item);
    this.listeners.forEach(listeners => listeners.onDataAdd(index));
  }

  public deleteItem(item: string): void {
    const index = this.elements.indexOf(item);
    if (index < 0) {
      return;
    }
    this.elements.splice(index, 1);
    this.listeners.forEach(listeners => listeners.onDataDelete(index));
  }

  public deleteItemByIndex(index: number): void {
    this.elements.splice(index, 1);
    this.listeners.forEach(listeners => listeners.onDataDelete(index));
  }
}

/**
 * 阅读页
 * @see: https://gitee.com/harmonyos-cases/cases/blob/master/CommonAppDevelopment/feature/pageflip/README.md
 * @see: https://nodlik.github.io/StPageFlip/
 */
@Entry
@Component
struct Read {
  @State openMenu: boolean = false
  @State topY: Length = '100%'
  @State bottomY: Length = 0
  @State isMenuViewVisible: boolean = false
  @State isCommentVisible: boolean = false
  @State currentPageNum: number = 0
  @State flipType: FlipType = FlipType.Roll;

/** 轮播控制器 */
  private swiperController: SwiperController = new SwiperController()

/** 滚动控制器 */

  private listScroller: ListScroller = new ListScroller()

/** 数据源 */

  private data: BasicDataSource = new BasicDataSource([]);

/** 屏幕宽度 */

  private screenW: number = px2vp(display.getDefaultDisplaySync().width);
  private _duration: number = 200
  private _background: Resource = $r('app.color.background')
  private _index: number = 0

  aboutToAppear(): void {

/**
 * 请求网络数据之后可以通过this.data.addItem(new Item('app.string.content' + i.toString()));的方法插入到数据源的开头形成新的数据源。
 * 请求网络数据之后可以通过this.data.pushItem(new Item('app.string.content' + i.toString()));的方法插入到数据源的末尾形成新的数据源。
 */

    for (let i = 1; i <= 14; i++) {
      this.data.pushItem(`${ i }\n` +
        '刺激啊就到了开发额记录反馈动静分离色' +
        '\t\t\tsjlfkejlfkjsle');
    }
    this.data.addItem(`${ this._index-- }\n` +
      '刺激啊就到了开发额记录反馈动静分离色' +
      '\t\t\tsjlfkejlfkjsle')
    this.currentPageNum = 1;
    if (this.screenW > 600) {
      this.screenW = this.screenW / 2;
    }
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        this.topBuild()
        this.bottomBuild()
        if (this.flipType == FlipType.Slide) {
          this.slideBuild()
        } else if (this.flipType == FlipType.Roll) {
          this.contentBuild()
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe3a2')
    // 扩展至所有非安全区域
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }


/** 顶部菜单 */

  @Builder
  topBuild() {
    Column() {
      Row() {
        Text('测试')
      }

      Row() {
        Text('测试')
      }
    }
    .zIndex(1)
    .width('100%')
    .backgroundColor(this._background)
    .markAnchor({ x: 0, y: this.topY })
    .position({ x: 0, y: 0 })
    .animation({ duration: this._duration })
  }


/** 顶部菜单 */

  @Builder
  bottomBuild() {
    Column() {
      Row() {
        Text('测试')
      }

      Row() {
        Text('测试')
      }
    }
    .zIndex(1)
    .width('100%')
    .backgroundColor(this._background)
    .markAnchor({ x: 0, y: this.bottomY })
    .position({ x: 0, y: '100%' })
    .animation({ duration: this._duration })
  }


/** 滑动 */

  @Builder
  slideBuild() {
    Swiper(this.swiperController) {

/**
 * 高性能知识点: 使用了cachedCount设置预加载的Text的数量，只在LazyForEach中生效，设置该属性后会缓存cachedCount个Text，LazyForEach超出显示和缓存范围的Text会被释放。
 * 使用cachedCount参数的例子:https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/ui-ts-performance-improvement-recommendation-0000001477981001-V2
 */

      LazyForEach(this.data, (item: string) => {
        this.contentBuild(item)
      }, (item: string) => item)
    }
    // 知识点:index设置当前在容器中显示的子组件的索引值。设置小于0或大于等于子组件数量时，按照默认值0处理。
    .index($$this.currentPageNum)
    .indicator(false)
    .cachedCount(3)
    .itemSpace(0)
    .loop(false)
    .curve(Curve.Linear)
    .effectMode(EdgeEffect.Fade)
    .duration(300)
    .onChange((index: number) => {
      // 通过onChange监听当前处于第几页。
      //this.currentPageNum = index;
      console.info(`${ index } - ${ this._index }`)
      if (index == 0) {
        this.currentPageNum = 1
        this.data.addItem(`${ this._index-- }\n` +
          '刺激啊就到了开发额记录反馈动静分离色' +
          '\t\t\tsjlfkejlfkjsle\n' +
          '123456789')
      }
    })
  }


/** 滚动 */

  @Builder
  rollBuild() {
    // 知识点:initialIndex设置为负数或超过了当前List最后一个item的索引值时视为无效取值，无效取值按默认值0显示。
    List({ initialIndex: this.currentPageNum, scroller: this.listScroller }) {
      LazyForEach(this.data, (item: string) => {
        ListItem() {
          this.centerContentBuild(item)
        }
      }, (item: string) => item)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .cachedCount(3)
    .onScrollIndex((start: number, end: number, center: number) => {
      if (start == 0) {
        let y = this.listScroller.currentOffset().yOffset + this.listScroller.getItemRect(1).height
        this.listScroller.scrollTo({
          xOffset: 0,
          yOffset: y,
          animation: false
        })
        this.data.addItem(`${ this._index-- }\n` +
          '刺激啊就到了开发额记录反馈动静分离色' +
          '\t\t\tsjlfkejlfkjsle\n' +
          '123456789')
      }
    })
  }


/** 覆盖 */

  @Builder
  coverBuild() {
    Stack() {

    }
  }


/** 顶部信息 */

  @Builder
  topInfoBuild() {
    Column() {
      Row() {
        RelativeContainer() {
          Text('123')
            .id('topLeft')
            .alignRules({
              left: { anchor: '__container__', align: HorizontalAlign.Start }
            })
          Text('123')
            .id('topCenter')
            .alignRules({
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })
          Text('123')
            .id('topRight')
            .alignRules({
              right: { anchor: '__container__', align: HorizontalAlign.End }
            })
        }.height('auto')
      }
      .margin(5)

      Divider()
        .strokeWidth(1)
        .margin({ bottom: 5 })
    }
  }


/** 底部信息 */

  @Builder
  bottomInfoBuild() {
    Column() {
      Divider()
        .strokeWidth(1)
        .margin({ top: 5 })
      Row() {
        RelativeContainer() {
          Text('123')
            .id('bottomLeft')
            .alignRules({
              left: { anchor: '__container__', align: HorizontalAlign.Start }
            })
          Text('123')
            .id('bottomCenter')
            .alignRules({
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })
          Text('123')
            .id('bottomRight')
            .alignRules({
              right: { anchor: '__container__', align: HorizontalAlign.End }
            })
        }.height('auto')
      }
      .margin(5)
    }
  }


/** 中间内容 */

  @Builder
  centerContentBuild(item?: string) {
    Text(item)
      .width('100%')
      .height('100%')
      .fontSize(16)
      .textAlign(TextAlign.Start)
      .align(Alignment.TopStart)
  }


/** 可视内容 */

  @Builder
  contentBuild(item?: string) {
    Column() {
      this.topInfoBuild()
      Column() {
        if (this.flipType == FlipType.Roll) {
          this.rollBuild()
        } else {
          this.centerContentBuild(item)
        }
      }
      .height('100%')
      .flexShrink(1)

      this.bottomInfoBuild()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .onClick(() => {
      this.openMenu = !this.openMenu;
      this.topY = this.openMenu ? 0 : '100%'
      this.bottomY = this.openMenu ? '100%' : 0
    })
  }
}


