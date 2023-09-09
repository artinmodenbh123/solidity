// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

error ValidFundRange(uint minFund, uint donatorInputFund);
contract Donations is Ownable {
    mapping (address => uint) private  fundAmount ;

    uint constant private  minimumFund = 0.0001 ether;

    event Donated(address indexed Donator, uint DonateAmount) anonymous;

    function makeDonation() public  payable {
        if(msg.value <= minimumFund) revert ValidFundRange ({
            minFund: minimumFund,
            donatorInputFund: msg.value
        });
        _donate(msg.sender, msg.value);
    }

    function _donate(address donator, uint donateAmount) private {
        fundAmount[msg.sender] += donateAmount;
        emit Donated(donator, donateAmount);
    }

    function withdraw() public onlyOwner {
        payable(_msgSender()).transfer(address(this).balance);
    }

    receive() external payable {
        makeDonation();
    }

}


        
