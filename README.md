
## 🟢 1차 세미나 🟢
VC (ViewController)간 데이터 전송하기

#### **POINT 1 : VC1 >>> VC2로 전송할 때** </br>
⚪️ VC1에서 VC2를 선언해 주어야 합니다.

```swift
 guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC") as? loginVC else { return }
 ```
위와 같이 선언 후 VC2를 다루어야 합니다.



#### **POINT 2 : **ViewController 표현 방식** </br>
⚪️present(Modal), Push(Navigation)을 주로 사용

Push는 NavigationController가 없는 경우 사용할 수 없다.

Present
```swift
        self.present(loginVC, animated: true, completion: nil)
```
Push
```swift
        self.navigationController?.pushViewController(signUpVC, animated: true)
``` 

## 🟢 1차 과제 🟢

VC1  >  VC2  >  VC3 </br>
   push  present
  
  </br>


 


 
