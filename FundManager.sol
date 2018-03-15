pragma solidity ^0.4.9;

import "./FundStorage.sol";

interface IFundManager {
    function deposit(address _to, uint256 _amount) public returns(bool result);
    function withdraw(address _from) public returns(bool result);
    function withdrawBack(address _from) public returns(bool result);
}


/**
 * Contact for interaction with users
 *
 */
contract FundManager is IFundManager{
    address FundStorageAddr;
    
    function FundManager(address _storageAddress) public {
        FundStorageAddr = _storageAddress;
    }

    
    function deposit(address _to, uint256 _amount) public returns(bool result) {
        FundStorage fundStorage = FundStorage(FundStorageAddr);
        return fundStorage.setRecipient(_to, _amount, msg.sender);
    }

    function withdraw(address _from) public returns(bool result) {
        if(msg.sender != _from)
            return false;
            
        
        FundStorage fundStorage = FundStorage(FundStorageAddr);

        return fundStorage.withdrawFrom(_from, msg.sender);
    }

    function withdrawBack(address _from) public returns(bool result) {
        FundStorage fundStorage = FundStorage(FundStorageAddr);
        return fundStorage.withdrawBack(_from, msg.sender);
    }


}
