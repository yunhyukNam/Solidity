pragma solidity ^0.4.19;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    mapping (uint => address) public zombieToOwner; // 매핑 : 값 저장소, 데이터를 저장하고 검색할 때 사용
    mapping (address => uint) ownerZombieCount; // 앞의 경우에는 매핑 시, 키는 address이고 값은 uint

    function _createZombie(string _name, uint _dna) internal { // internal : 상속하는 컨트랙트에서도 접근이 가능하다는 점을 제외하면 private와 동일
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        require(ownerZombieCount[msg.sender] == 0); // require : 함수 실행 전 조건 확인 후 실행, 조건에 맞지 않는다면 에러 메세지 출력 후 실행 중단
                                                    // msg.sender : 호출한 사람 or 호출한 컨트랙트의 주소를 저장, 
                                                    //              따라서 어떤 한 유저의 값을 변경하기 위해서는 그 유저의 개인키를 훔쳐야 한다.
        uint randDna = _generateRandomDna(_name);
        randDna = randDna - randDna % 100;
        _createZombie(_name, randDna);
    }

}
