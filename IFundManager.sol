pragma solidity ^0.4.0;

interface IFundManager {
	function deposit(address _to, uint256 _amount) public returns(bool result);
	function withdraw(address _from) public returns(bool result);
	function withdrawBack(address _from) public returns(bool result);
}
