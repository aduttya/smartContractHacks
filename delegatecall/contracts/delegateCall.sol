// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract B{
    
    uint x;
    uint x1;

    function upgrade(uint _num) public payable{
        x1 = _num;
    }
    
    mapping(address=>uint) public balance;
    
    function insertInmap(uint val)public{
        balance[msg.sender] = val;
    }
    function get() public view returns(uint){
        return x;
    }
}


contract A{
    
    uint public x;
    uint public num;
    mapping(address => uint) public balances;
    address b;

    constructor(address _b){
        b = _b;
    }
    
    function upgrade(uint _num) public payable{
        (bool success,) = b.delegatecall(abi.encodeWithSignature("insertInmap(uint256)",_num));
    
    }
    
    function getval()public view returns(uint){
        return x;
    }
}
