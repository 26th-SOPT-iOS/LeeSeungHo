# 2주차 세미나 🎉

- 실행 gif

<img src="../Screenshots/videos.gif" width="30%" height="30%">

---

## 🟢 2차 과제 - 계산기 🟢

### 1. StackView 구조 만들기

전체적인 StackView 구조를 먼저 만들어야 합니다. 저같은 경우는 View를 7등분해서 </br>

1 - 빈 StackView</br>
2 - UILabel StackView</br>
3 - Button</br>
4 - Button</br>
5 - Button</br>
6 - Button</br>
7 - Button</br>

1부터 7까지는 Horizontal Stack View, 이들를 감싸는 가장 큰 Vertical StackView 1개로
구성하였습니다. </br>

- Horizontal StackView </br>

각 버튼은 Equal Width 속성을 가지고 있습니다.

- Vertical StackView

각 StackView는 Equal Height 속성을 가지고 있습니다.</br>
만약 추가적인 높이 조절이 필요할 때는 `Multiplier`를 수정하여 높이 조절을 할 수 있습니다. </br>

### 2. 버튼 모양 세팅하기

> Button이 여러개일 때는 Outlet Collections를 사용하는것이 좋습니다. </br>
> 실행 방법은 다음과 같습니다.

<center>
<img src="../Screenshots/connections.png" width="30%" height="30%" >
<img src="../Screenshots/outletcollections.png" width="30%" height="30%"> 
</center>
</br>
button의 Outlet을 설정해준 뒤에는 버튼의 모양을 설정해주어야 합니다.</br>
우측의 Attribute Inspector 창에서 설정해줄 수 있습니다. 코드로는 다음과 같이 설정해 줄 수 있습니다.

```swift
func setButtonLooksLike() {
        digitStackView.backgroundColor = .black
        displayView.backgroundColor = .black
        view.backgroundColor = .black

        for i in 0..<yellowOperations.count {
            let bt: UIButton = {
                let btn = yellowOperations[i]
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
                btn.setTitleColor(.white, for: .normal)
                btn.layer.cornerRadius = btn.frame.height/2
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.clear.cgColor
                btn.clipsToBounds = true
                btn.backgroundColor = UIColor.calculatorColor(.orangeColor)

                return btn
            }()
        }
```

1. swift에서 `for ~ in ~` 의 형태는 위와 같습니다.
2. `btn.layer.cornerRadius` ~~~ `btn.clipsToBounds = true` : 해당 뷰를 원처럼 만들어 줍니다.

### 3. 필요한 AutoLayout 잡기

- UILabel AutoLayout

2번째 Horizontal StackView에는 UILabel이 있는데, 이는 기본적으로 오른쪽 정렬이여야 합니다. </br>
또한, 오른쪽에서 왼쪽으로 숫자가 쌓이며 커지는 형태이므로,
**LeftAnchor의 값은 계속 변해야 합니다.**

숫자가 계속 입력됨에 따라 -

> `LeftAnchor`----- **감소** ----- `UILabel` ----- **_0으로 유지_** ----- `RightAnchor`

이는 Constraint에서 Relation의 특성을 보아야 합니다.

<img src="../Screenshots/constraintrelation.png" width="30%" height="30%">

왼쪽 Constraint의 숫자는 점점 작아져야 하므로, </br>
Less Than or Equal으로 설정하면 Constraint 값보다 유동적으로 작아지게 됩니다.

코드로 설정하면 다음과 같습니다.

```swift
        let constraints = [
            display.leftAnchor.constraint(lessThanOrEqualTo: displayView.leftAnchor, constant: 320),
            display.rightAnchor.constraint(equalTo: displayView .rightAnchor, constant: 0),
            display.bottomAnchor.constraint(equalTo: displayView.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
```

> 이상입니다. 감사합니다~! 😊 </br>
> 계산기 로직은 필요하신 경우 클론해서 쓰세요!
