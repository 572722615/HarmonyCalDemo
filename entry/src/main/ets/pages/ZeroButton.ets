@Preview
@Component
export struct ZeroButton {
  num: string = '1'
  buttonColor: number = 0x333333
  textColor: number = Color.White
  textSize: number = 40

  build() {
    Column() {
      Text(`${this.num}`)
        .fontColor(this.textColor)
        .fontSize(this.textSize)
        .fontWeight(FontWeight.Medium)
    }
    .width(150+10)
    .height(75)
    .backgroundColor(this.buttonColor)
    .justifyContent(FlexAlign.Center)
    .borderRadius(42.5)
  }
}