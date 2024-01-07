import { ExpressionEvaluator } from '../tools/CalculateHelper'
import { NumButton } from './NumButton'
import { ZeroButton } from './ZeroButton'

@Entry
@Component
struct Index {
  @State cal: string = ""
  @State result: string = "0"
  @State special: boolean = false

  build() {
    Column({ space: 12 }) {
      // Image($r('app.media.dog'))
      if (this.result == '101') {
        Image('images/dog.gif').width(200)
      }
      Blank()
      Column() {
        Text(this.result).fontColor(Color.White)
          .fontSize(this.special ? 65 : 60)
      }.width('100%').alignItems(HorizontalAlign.End)
      .padding({ right: 30 })

      Column() {
        Text(`${this.cal}`).fontColor(Color.White)
          .fontSize(40)
      }.width('100%').height(40).alignItems(HorizontalAlign.End).padding({ right: 30 })

      Row({ space: 8 }) {
        NumButton({ num: 'AC', buttonColor: 0xa5a5a5, textColor: Color.Black, textSize: 30 })
          .onClick(() => {
            this.cal = ''
            this.result = '0'
          })
        NumButton({ num: '+/-', buttonColor: 0xa5a5a5, textColor: Color.Black, textSize: 30 })
          .onClick(() => {
            this.special = !this.special
          })
        NumButton({ num: '%', buttonColor: 0xa5a5a5, textColor: Color.Black, textSize: 30 })
        NumButton({ num: '/', buttonColor: 0xff9808 })
          .onClick(() => {
            this.cal += '/'
          })
      }

      Row({ space: 8 }) {
        NumButton()
          .onClick(() => {
            this.cal = this.cal + '1'
          })
        NumButton({ num: '2' })
          .onClick(() => {
            this.cal += '2'
          })
        NumButton({ num: '3' })
          .onClick(() => {
            this.cal += '3'
          })
        NumButton({ num: 'X', buttonColor: 0xff9808 })
          .onClick(() => {
            this.cal += '*'
          })
      }

      Row({ space: 8 }) {
        NumButton({ num: '4' })
          .onClick(() => {
            this.cal += '4'
          })
        NumButton({ num: '5' })
          .onClick(() => {
            this.cal += '5'
          })
        NumButton({ num: '6' })
          .onClick(() => {
            this.cal += '6'
          })
        NumButton({ num: '-', buttonColor: 0xff9808 })
          .onClick(() => {
            this.cal += '-'
          })
      }

      Row({ space: 8 }) {
        NumButton({ num: '7' })
          .onClick(() => {
            this.cal += '7'
          })
        NumButton({ num: '8' })
          .onClick(() => {
            this.cal += '8'
          })
        NumButton({ num: '9' })
          .onClick(() => {
            this.cal += '9'
          })
        NumButton({ num: '+', buttonColor: 0xff9808 })
          .onClick(() => {
            this.cal += '+'
          })
      }

      Row({ space: 8 }) {
        ZeroButton({ num: '0' })
          .onClick(() => {
            this.cal += '0'
          })
        NumButton({ num: '.' })
          .onClick(() => {
            this.cal += '.'
          })
        NumButton({ num: '=', buttonColor: 0xff9808 })
          .onClick(() => {
            let calTool = new ExpressionEvaluator()
            let tmp = `${calTool.evaluate(this.cal)}`
            if (this.special  && tmp.length == 8) {
              this.result = '101'
            } else {
              this.result = tmp
            }
          })
      }.margin({ bottom: 50 })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}