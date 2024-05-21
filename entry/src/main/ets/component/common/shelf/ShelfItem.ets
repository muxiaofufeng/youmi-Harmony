import promptAction from '@ohos.promptAction'

/**
 * 书架上的每个项目
 */
@Preview
@Component
export struct ShelfItem {
  @State url: string = ''
  @State coverUrl: string = ''
  @State coverWidth: Length = 110
  @State text: string = this.randomStr()
  @State textHeight: Length = 30

  build() {
    Button({ type: ButtonType.Normal, stateEffect: true, buttonStyle: ButtonStyleMode.NORMAL }) {
      Column() {
        Image(this.coverUrl)
          .backgroundColor(this.randomColor())
          .width(this.coverWidth)
          .aspectRatio(0.8)
          .objectFit(ImageFit.Cover)

        Column() {
          Text(this.text)
            .margin({ top: 5 })
            .fontSize($r('app.float.font_xs'))
            .fontColor($r('app.color.fontColor'))
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .height(this.textHeight)
        .margin({ bottom: -10 })
      }
    }
    .padding(10)
    .width('auto')
    .height('auto')
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

  /**
   * 随机颜色
   * @returns 颜色
   */
  randomColor() {
    let str = '#';
    for (let i = 0; i < 3; i++) {
      str += Math.floor(Math.random() * 255).toString(16)
    }
    return str
  }

  randomStr() {
    let str = ''
    let arr = ['附', '件', '都', '说', '了', '会', '计', '', '手', '机']
    let len = Math.floor(Math.random() * 25)
    for (let i = 0; i < len; i++) {
      str += arr[Math.floor(i / (len / 4))]
    }
    return str
  }
}