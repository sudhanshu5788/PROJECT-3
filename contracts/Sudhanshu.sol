// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Sudhanshu {
    string public name;
    string public symbol;
    uint256 public tsupply;
  
    mapping(address => uint256) public balances;

    address public owner;
    
    

constructor(string memory _name, string memory _symbol, address _owner) {
        name = _name;
        symbol = _symbol;
        tsupply = 1000000;
        owner = _owner;
    }
//        modifier onlyOwner() {
//     require(owner == msg.sender, "ONLY OWNER CAN ACCESS");
//    _;
// }
  function mint (address add, uint val) public {
      require(owner == msg.sender, "ONLY OWNER CAN ACCESS");
      tsupply += val;
      balances[add] += val;
    }

  function burn (address add, uint val) public {
     require(balances[add]>= val, "INSUFFICIENT FUNDS TO BURN");
    { 
      tsupply -= val;
      balances[add] -= val;
     }    
    }
    function transfer(address _to, uint256 _amount) public {
        require(_to != address(0), "ENTER VALID ADDRESS");
        require(balances[msg.sender] >= _amount, "NOT ENOUGH BALANCE");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        
    }
}