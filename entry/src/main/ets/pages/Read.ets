/**
 * 翻页动画分类
 */
import webview from '@ohos.web.webview';

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
  @State flipType: FlipType = FlipType.Roll;
  private webController: webview.WebviewController = new webview.WebviewController()
  private _duration: number = 200
  private _background: Resource = $r('app.color.background')

  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        this.topBuild()
        this.bottomBuild()
        Web({ src: 'https://juejin.cn/post/6844903507405848589', controller: this.webController })
          .onResourceLoad((event) => {
            console.info(event?.url)
            return null;
          })
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

  /**
   * 随机颜色
   * @returns 颜色
   */
  randomColor() {
    return `#${ (Math.random() * 255).toString(16) }${ (Math.random() * 255).toString(16) }${ (Math.random() * 255).toString(16) }`
  }
}