pragma solidity ^0.8.0;



interface MyTokenInterface {
    
    function transfer(address from, address to, uint256 amount) external returns(bool);
    function mint(uint256 amount) external returns(bool);
    function balance() external returns(uint256);
}


contract SchoolPayroll {
    
    MyTokenInterface public token;
    address public owner;
    constructor(MyTokenInterface MyToken) {
        owner = msg.sender;
        token = MyToken;
    }
    
    function payFee(uint256 amount) external returns (bool) {
        
        token.transfer(msg.sender, owner, amount);
    }
    
    function paySalary(address teacher, uint256 amount) external {
        
        token.transfer(owner, teacher, amount);
    } 
    
}
