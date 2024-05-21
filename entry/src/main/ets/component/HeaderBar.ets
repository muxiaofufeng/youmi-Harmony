import type { OperationItem } from '../../common/ArkType';

@Preview
@Component
export struct HeaderBar {
  @State title: string = ''
  @State iconSize: Length = $r('app.float.icon_sm')
  @State menus: OperationItem[] = []
  @BuilderParam more: () => void = this.moreBuild

  build() {
    Row() {
      Text(this.title)
        .fontSize($r('app.float.font_xl'))
        .fontWeight(FontWeight.Bold)
      Row({ space: 4 }) {
        ForEach(this.menus, (item: OperationItem, index: number) => {
          Button({ type: ButtonType.Circle, buttonStyle: ButtonStyleMode.TEXTUAL }) {
            Image(item.icon)
              .width(this.iconSize)
              .height(this.iconSize)
          }
          .padding(6)
          .onClick(item.action)
        })
        this.more()
      }
    }
    .width('100%')
    .padding(10)
    .zIndex(2)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor($r('app.color.titleBar'))
    .shadow(ShadowStyle.OUTER_DEFAULT_SM)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
  }

  @Builder
  moreBuild() {
  }
}