pragma solidity ^0.4.17;

contract OwnerProfileMapping {
    mapping(address => address) public ownerProfile;
    function setOwnerProfile(address owner, address profileContractAddress) public {
        ownerProfile[owner] = profileContractAddress;
    }

    function getProfileContractAddressBy (address owner) public view returns (address) {
        return ownerProfile[owner];
    }
}