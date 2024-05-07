import { Size } from '@ohos/hypium';

@Preview
@Component
export struct ButtonIcon {
  @Prop options: ButtonOptions = {
    type: ButtonType.Normal,
    stateEffect: true,
    buttonStyle: ButtonStyleMode.NORMAL
  };
  @Prop disable: boolean = false;
  @Prop icon: Resource = $r('app.media.bookshelf');
  @Prop iconSize: SizeResult = { width: 28, height: 28 };

  build() {
    Button(this.options) {
      Image(this.icon)
        .width(this.iconSize.width)
        .height(this.iconSize.height)
        .objectFit(ImageFit.Cover)
    }
    .borderRadius(8)
    .opacity(this.disable ? 0.4 : 1)
  }
}