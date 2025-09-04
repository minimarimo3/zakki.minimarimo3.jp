#import "/template.typ": 日報
#import "@preview/cheq:0.2.3": checklist
#show: checklist

#show : 本文 => 日報(
  執筆日: datetime(year: 2025, month: 09, day: 03),
  今日やる・やったこと: [
    - [x] タグによる検索
    - [x] 詳細画面で上にスワイプすると一覧画面に戻る
    - [x] フォルダ機能の追加
      - [x] フォルダで特定のタグがついた画像を見る
      - [x] フォルダを新規作成（名前をつける、画像を追加する、画像の登録を解除する）

    - [ ] （可能なら）ちゃんとした画像解析

      #link("https://huggingface.co/Camais03/camie-tagger-v2/tree/main")[camie-tagger-v2]が出たらしい。
      使ってみる

        ↑やってはいるんだがやっぱりどうにも動かない。
        毎回
        ```
Select TensorFlow op(s), included in the given model, is(are) not supported by this interpreter.
Make sure you apply/link the Flex delegate before inference.
For the Android, it can be resolved by adding "org.tensorflow:tensorflow-lite-select-tf-ops" dependency.
See instructions: https://www.tensorflow.org/lite/guide/ops_select
        ```
        と言われる。
        Android StudioのBuild > Analyze APKから共有ライブラリも確認したけどちゃんとあるし・・・
        結局`onnx2tf -i camie-tagger-v2_simplified.onnx -o camie_tf_fp16_builtin -b 1 -ois "input:1,3,512,512" -rtpo Erf Gelu -eatfp16`することでそもそもSelect TF Opsを出さないという線で行こうとしているっぽい。
        お！！！！！！この方法でとりあえず動きはしたぞ！！！あとは結果だな。これでmonochromeとか出たら本当にしんどいがw
  ],
  今日あった嬉しかったこと: [
  ],
  明日やりたいこと: [
  ],
  その他: [
 ]
)
