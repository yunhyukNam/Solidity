# **<span style="color:lightgreen">Chapter 1.</span>** | 좀비 공장 만들기
<br>

> #### <br>**해당 포스트는 CryptoZombie의 커리큘럼에 따라 작성되었습니다.**<br><br>
<br>

[##_Image|kage@Klthv/btsd0uagwmp/fS91Vix5gctev4dU1crNK0/img.png|CDM|1.3|{"originWidth":692,"originHeight":486,"style":"alignCenter","link":"https://cryptozombies.io/ko/course","isLinkNewWindow":true,"title":"CryptoZombie","filename":"CryptoZombies.png"}_##]
<br>

## <span style="color:#498C8A">**목차**</span>
**1.**  [**솔리디티 Solidity**](#chapter1)  

**2.**  [**컨트랙트 Contract**](#chapter2)  

**3.**  [**상태변수 & 정수 State Variables & Integers**](#chapter3)  

**4.**  [**수학 연산 Math Operation**](#chapter4)  

**5.**  [**구조체 Struct**](#chapter5)  

**6.**  [**배열 Array**](#chapter6)  


<br>

---

<br>
  

## **<span style="color:orange">1.</span>** **솔리디티** Solidity <a id="chapter1"></a>
솔리디티는 이더리움에서 제공하는 스마트 컨트랙트 개발 언어로,

EVM(Ethereum Virtual Machine)에서 구동되도록 설계된 고급 프로그래밍 언어입니다.
  
<br>

모든 솔리디티 소스 파일은 **version pragma**로 시작해야 하며, 형태는 다음과 같습니다.

<br><br>

[##_Image|kage@GunIW/btsd1h2RPFz/cmymFcv0sNlCAjvEFjcfW1/img.png|alignCenter|width="100%"|_##]
<br>

## **<span style="color:orange">2.</span>** **컨트랙트** Contract <a id="chapter2"></a>
솔리디티 코드는 Contract 내에 둘러 싸여 있어야 합니다.

컨트랙트는 이더리움 애플리케이션의 기본 구성 요소로, 모든 변수와 함수는 어떤 한 컨트랙트 내에 속해 있습니다.

<br><br>

[##_Image|kage@dt5hFp/btsd4eEuvhj/gJrDkdB2NPkb02bgX0UyY1/img.png|alignCenter|width="100%"|_##]
<br>

## **<span style="color:orange">3.</span>** **상태 변수 & 정수**  State Variables & Integers <a id="chapter3"></a>
상태 변수는 컨트랙트의 저장소 내에 영구적으로 저장되는 자료형으로, 데이터베이스에 데이터를 작성하는 것과 유사합니다.
<br>

해당 코스에서는 부호 없는 정수형인 **uint**만을 설명하고 있어, uint 형에 대해서만 다루겠습니다.

uint형은 unsigned int로, 음수를 표현하지 않는 양수만을 다루는 변수의 자료형으로 사용됩니다.
<br>

<details close>
  <summary>참고</summary>
    uint는 uint256과 같으며, uint8, uint16, uint32 등과 같은 더 적은 비트로도 선언이 가능합니다.
</details>
<br>

---
<br>

### 직접 해보기

우리의 좀비 DNA는 16자리 숫자로 결정될 걸세.  
<br>

1.  dnaDigits라는 uint를 선언하고 16이라는 값을 배정해 보게.
<br><br>

[##_Image|kage@x0YKp/btsd4FWuBGh/RzA9i8v6gyDkwjJFT7qQok/img.png|alignCenter|width="100%"|_##]

## **<span style="color:orange">4.</span>** **수학 연산** Math Operation <a id="chapter4"></a>

솔리디티에서 수학은 이전에 다른 언어를 접해본 적 있다는 가정 하에 매우 쉽습니다.  

다른 프로그래밍 언어에서의 수학 연산과 동일하기 때문이죠.  
  

-   덧셈 : x + y
-   뺄셈 : x - y
-   곱셈 : x \* y
-   나눗셈 : x / y
-   나머지(modulo) : x % y
-   지수 연산 : x \*\* y

<br>

---
<br>

### 직접 해보기

우리의 좀비 DNA가 16자리 숫자가 되도록 하기 위해 또다른 unit형 변수를 생성하고 10^16 값을 배정하세.  
이로써 이 값을 이후 모듈로 연산자 %와 함께 이용하여 16자리보다 큰 수를 16자리 숫자로 줄일 수 있네.  
<br>  

1.  dnaModulus라는 uint형 변수를 생성하고 10의 dnaDigits승을 배정한다.  
<br><br>

[##_Image|kage@bfuAO7/btsedbmBPSw/7BUZOSqs8qqYFybsLWyFoK/img.png|alignCenter|width="100%"|_##]

## **<span style="color:orange">5.</span>** **구조체** Struct <a id="chapter5"></a>
uint형 변수 선언, string형 변수 선언처럼 단순한 변수 선언이 아닌  
조금 더 복잡하고, 다양한 자료형을 필요로 할 때 사용합니다.

<br>

---
<br>

### 직접 해보기
우리 앱에서 좀비 몇 마리를 생성하기를 원할 것이네! 
좀비들이 다양한 특성을 가질 것이니 구조체를 활용하기에 안성맞춤이군.
<br>
1. Zombie라는 struct를 생성한다.
<br><br>
2. 우리의 Zombie 구조체는 name (string형)과 dna (uint형)이라는 2가지 특성을 가진다.
<br><br>

[##_Image|kage@biOGnp/btseh7jTcgT/XPHioANt3i74TqhLNhs7Y0/img.png|alignCenter|width="100%"|_##]

## **<span style="color:orange">6.</span>** **배열** Array <a id="chapter6"></a>
일반적인 배열과 생김새는 비슷합니다.  
정적 배열과 동적 배열, 두 종류가 존재합니다.
<br><br>

[##_Image|kage@cA5Nrt/btseggagq2w/niLBb4wmaUS65UKdBDYk3K/img.png|alignCenter|width="100%"|_##]
<br>

이전 3장에서 상태 변수는 블록체인에 영구적으로 저장할 수 있다고 설명하였는데,  
따라서 구조체의 동적 배열을 생성하면 데이터베이스에 데이터를 저장하듯이 사용할 수 있습니다.
<br>

#### **<span style="color:#D6E8DB">Public</span> 배열**
배열을 public으로 선언할 수 있으며, 솔리디티에서는 이와 같은 배열을 위해 _getter_ 메소드를 생성합니다.  
이렇게 public으로 선언할 시에는 다른 컨트랙트에서 읽을 수 있게 됩니다.   **※ <span style="color:red">쓰기</span>는 안됩니다 ※**

<br>

---
<br>

### 직접 해보기
우리 앱에 좀비 군대를 저장하고 싶네. 그리고 우리 좀비들을 다른 앱에 자랑하고 싶네.  
그러니 좀비 군대 저장소를 public으로 해야 하네.
<br>
1. Zombie 구조체의 public 배열을 생성하고 이름을 zombies로 한다.
<br><br>

[##_Image|kage@KH9UI/btsd4FCc0hm/dsoEKLoJJfyHzVtmdHMIz0/img.png|alignCenter|width="100%"|_##]

<br>


#### <span style="color:lightblue">Lesson 1</span> Code in GitHub (~/contract/Chap 1/)

---
<br>

[##_Image|kage@buFcXu/btsd6umRhcf/FaYrrkhNPsXt43Fke2yQmk/img.png|CDM|1.3|{"originWidth":835,"originHeight":254,"style":"alignCenter","link":"https://github.com/yunhyukNam/Solidity.git","isLinkNewWindow":true,"title":"GitHub","filename":"GitHub-Logo.png"}_##]