pragma solidity ^0.4.19;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);  // NewZombie라는 이벤트를 호출하여 해당 함수가 실행되었음을 알림

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;  // Solidity 제곱 계산

    struct Zombie { // 구조체 선언
        string name;
        uint dna;
    }

    Zombie[] public zombies;    // 배열 선언

    function _createZombie(string _name, uint _dna) private {   // 함수 선언
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {  // 값을 변경하지 않고, 참조(보기)만 할 시에 view 사용
                                                                            // pure : view와 같으나, 전달된 인자에 따라 반환 값이 변할 시
        uint rand = uint(keccak256(_str));  // 형 변환, keccak256 함수를 통해 만들어진 16진수 해시값을 uint형으로 변환
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
