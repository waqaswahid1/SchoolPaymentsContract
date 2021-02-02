pragma solidity ^0.8.0;

interface MyTokenInterface {
    
    function transfer(address from, address to, uint256 amount) external returns(bool);
    function mint(uint256 amount) external returns(bool);
    function balance() external returns(uint256);
}


contract MyToken is MyTokenInterface {
    
    //balance mapping
    mapping(address=>uint256) internal balances;
    

    function transfer(address from, address to, uint256 amount) external override returns(bool) {
        balances[from] -= amount;
        balances[to] += amount;
        return true;
    }
    
    function mint(uint256 amount) public override returns(bool){
        balances[msg.sender] = amount;
        return true;
    }
    
    function balance() public override returns(uint256){
        return balances[msg.sender];
    }

    
}
