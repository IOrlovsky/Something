pragma solidity ^0.4.9;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";


/**
 * Storage contract
 */
contract FundStorage is Ownable{
	struct Recipient {
		address funder;
		uint256 amount;
	}
	
	mapping (address => Recipient) private recipients;

	function setRecipient(address _to, uint256 _amount, address _funder) 
		onlyOwner external returns(bool result)
	{
    	this.send(_amopragma solidity ^0.4.9;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";


contract FundStorage is Ownable{
	struct Recipient {
		address funder;
		uint256 amount;
	}
	
	
	mapping (address => Recipient) private recipients;
	
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function setRecipient(address _to, uint256 _amount, address _funder)
	    onlyOwner external returns(bool result)
	{

    	emit Transfer(_funder, this, _amount);
    	recipients[_to] = Recipient(_funder, _amount);

    	return true;	
	}

	function withdrawFrom(address _from, address _to) onlyOwner external returns(bool result){		
		emit Transfer(this, _to,  recipients[_from].amount);
		recipients[_from].amount = 0;		

		return true;
	}

	function withdrawBack(address _from, address _funder) onlyOwner external returns(bool result){
		if(recipients[_from].funder != _funder)
			return false;

		if(recipients[_from].amount == 0)
			return false;

		emit Transfer(this, _funder, recipients[_from].amount);
		recipients[_from].amount = 0;	

		return true;
	}
}unt);
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