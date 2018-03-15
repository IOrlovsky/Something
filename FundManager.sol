pragma solidity ^0.4.0;

import "./FundStorage.sol";
import "./IFundManager.sol";



contract FundManager is IFundManager{
    address fundStorage;

    function FundManager(address _storageAddress) public {
        fundStorage = FundStorage(_storageAddress);
    }


    function deposit(address _to, uint256 _amount) public returns(bool result) {
    	return fundStorage.setRecipient(_to, _amount, msg.sender);
    }

    function withdraw(address _from) public returns(bool result) {
        if(msg.sender != _from)
            return false;

    	return fundStorage.withdrawFrom(_from);
    }

    function withdrawBack(address _from) public returns(bool result) {
        return fundStorage.withdrawBack(_from, msg.sender);
    }


}
