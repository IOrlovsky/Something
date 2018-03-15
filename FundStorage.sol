pragma solidity ^0.4.0;

import "https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/ownership/Ownable.sol";


contract FundStorage is Ownable{
	struct Recipient {
		address funder;
		uint256 amount;
	}
	
	private mapping (address => Recipient) recipients;

	function setRecipient(address _to, uint256 _amount, address _funder) 
		onlyOwner external returns(bool result)
	{

		_funder.sub(_value);
    	this.add(_value);
    	recipients[_to] = Recipient(_funder, _amount);

    	return true;	
	}

	function withdrawFrom(address _from) onlyOwner external returns(bool result){
		this.sub(recipients[_from].amount);
		_from.add(recipients[_from].amount);
		recipients[_from].amount = 0;		

		return true;
	}

	function withdrawBack(address _from, address _funder) onlyOwner external returns(bool result){
		if(recipients[_from].funder != _funder)
			return false;

		if(recipients[_from].amount == 0)
			return false;

		this.sub(recipients[_from].amount);
		_funder.add(recipients[_from].amount);
		recipients[_from].amount = 0;	

		return true;
	}
}