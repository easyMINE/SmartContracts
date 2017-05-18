import "./StandardToken.sol";

pragma solidity ^0.4.10;

contract EasyMineToken is StandardToken {

  string public constant name = "EasyMine Token";
  string public constant symbol = "EMT";
  uint8 public constant decimals = 18;

  function EasyMineToken(address _icoAddress,
                         address _preIcoAddress,
                         address _easyMineWalletAddress,
                         address _bountyWalletAddress) {
    if (_icoAddress == 0 || _preIcoAddress == 0 || _easyMineWalletAddress == 0 || _bountyWalletAddress == 0) {
      throw;
    }

    totalSupply = 33000000 * 10**18;                     // 33.000.000 EMT

    uint256 icoTokens = 27000000 * 10**18;               // 27.000.000 EMT

    uint256 preIcoTokens = 2000000 * 10**18;             // 2.000.000 EMT

    uint256 easyMineTokens = 3000000 * 10**18;           // 1.500.000 EMT dev team +
                                                         // 500.000 EMT advisors +
                                                         // 1.000.000 EMT easyMINE corporation +
                                                         // = 3.000.000 EMT

    uint256 bountyTokens = 1000000 * 10**18;             // 1.000.000 EMT

    if (icoTokens + preIcoTokens + easyMineTokens + bountyTokens != totalSupply) {
      revert();
    }

    balances[_icoAddress] = icoTokens;
    Transfer(0, _icoAddress, icoTokens);

    balances[_preIcoAddress] = preIcoTokens;
    Transfer(0, _preIcoAddress, preIcoTokens);

    balances[_easyMineWalletAddress] = easyMineTokens;
    Transfer(0, _easyMineWalletAddress, easyMineTokens);

    balances[_bountyWalletAddress] = bountyTokens;
    Transfer(0, _bountyWalletAddress, bountyTokens);
  }

  function burn(uint256 _value) returns (bool success) {
    if (balances[msg.sender] >= _value && _value > 0) {
      balances[msg.sender] -= _value;
      totalSupply -= _value;
      return true;
    } else {
      return false;
    }
  }
}
