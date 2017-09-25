pragma solidity ^0.4.11;

contract FancyToken {
    
    mapping(address => uint256) public balanceOf;
    
    string public name;
    string public symbol;
    uint8 public decimals;
    
    /***
     * This is the one and only sovereign FancyToken.  Get it while its hot.
     * @param initialSupply uncorruptable quantity.  Forever!!!
     * 
     * ***/
    function FancyToken(
        uint256 initialSupply, 
        string tokenName, 
        string tokenSymbol, 
        uint8 decimalUnits) {
        
        balanceOf[msg.sender] = initialSupply;
        
        name = tokenName;                         // Set the name for display purposes
        symbol = tokenSymbol;                     // Set the symbol for display purposes
        decimals = decimalUnits;                  // Amount of decimals for display purposes
    }
    
    function transfer(address _to, uint256 _value) {
        require(balanceOf[msg.sender] >= 
            _value && balanceOf[_to] + _value >= balanceOf[_to]);
       
        // Add and subtract new balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        // Notify anyone listening that this transfer took place
        Transfer(msg.sender, _to, _value);
    }
    
    event Transfer(address indexed from, address indexed to, uint256 value);
}
