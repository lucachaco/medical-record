pragma solidity ^0.4.17;
import "./OwnerProfileMapping.sol";
contract Profile {

    string private governmentId;
    string private name;
    string private lastName;
    string private phone;
    address private ownerProfileMappingContractAddress;

    string private ownerAddress;

    function Profile(address _ownerProfileMappingContractAddress) public{
        ownerProfileMappingContractAddress = _ownerProfileMappingContractAddress;
    }

    function getOwnerProfileMappingContractAddress() public view returns (address){
        return ownerProfileMappingContractAddress;
    }

    function init(string _governmentId, string _name, string _lastName, string _phone,  address contractAddress) public {
        governmentId = _governmentId;
        name = _name;
        lastName = _lastName;
        phone = _phone;
        address owner = msg.sender;
        OwnerProfileMapping o = OwnerProfileMapping(ownerProfileMappingContractAddress);
        o.setOwnerProfile(owner, this);
    }

    function getGovernmentId() public view returns (string) {
        return governmentId;
    }

    function setName(string _name) public {
        name = _name;
    }

    function getName() public view returns (string) {
        return name;
    }


    function getLastName() public view returns (string) {
        return lastName;
    }

    function getOwnerAddress() public view returns (string){
        return ownerAddress;
    }

}