pragma solidity ^0.4.19;

import "./zombiefactory.sol"; // 파일이 나뉘어 있을 때, 상속 등과 같은 행위를 위해 another file을 import 한다

contract KittyInterface { // Interface 선언 : contract 선언과 같은 방식으로 선언되나, 함수를 {}로 감싸지 않고 ()로 감싸고, ) 뒤에 ;을 붙임
  function getKitty(uint256 _id) external view returns ( // external : 외부 컨트랙트에서만 호출이 가능, 동일 컨트랙트 내 다른 함수에서 호출 불가능
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  );
}

contract ZombieFeeding is ZombieFactory { // 상속, ZombieFactory의 함수를 가져다 사용할 수 있게 한다

  address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
  KittyInterface kittyContract = KittyInterface(ckAddress);

  function feedAndMultiply(uint _zombieId, uint _targetDna, string _species) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId]; // storage : 포인터와 같다, 영구적으로 해당 주소의 값을 변경한다
                                                  // memory : 임시 변수, 값을 변경할 수 없이 메모리에 데이터를 복사한다
                                                  //          값 변경을 위해선 블록체인 저장소의 주소를 직접 가리켜야 한다
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + _targetDna) / 2;
    if (keccak256(_species) == keccak256("kitty")) { // 입력받은 _species와 "kitty"의 해시값 비교
      newDna = newDna - newDna % 100 + 99; // ( newDna - (newDna % 100) ) + 99
    }
    _createZombie("NoName", newDna);
  }

  function feedOnKitty(uint _zombieId, uint _kittyId) public {
    uint kittyDna;
    (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId); // 다수의 반환 값 처리를 위해 입력하지 않을 데이터의 위치는 ','으로 표시
    feedAndMultiply(_zombieId, kittyDna, "kitty");
  }

}
