pragma solidity ^0.4.23;

contract UploadData {
    struct Uploader {
        address uploaderaddress;
        uint uploaddate;
        bytes32 uploadername;
        bytes32 cvs;
        
    }

    mapping (uint => Uploader) public uploaderInfo;
    address public owner;
    address[20] public uploaders; //address 배열을 동적 배열로 변경

    event LogUploadUploadData(
        address _uploader,
        uint _date,
        bytes32 _name,
        uint _id
    );

    constructor() public {
        owner = msg.sender;
    }

    function UploaderUploadData(uint _id, uint _uploaddate, bytes32 _uploadername, bytes32 _cvs) public payable { //내부 거래에서 별다른 가스비 없이 eth를 주고받을 수 있습니다. 
        require(_id >= 0 && _id <= 20);
        uploaders[_id] = msg.sender;
        uploaderInfo[_id] = Uploader(msg.sender, _uploaddate, _uploadername, _cvs);

        owner.transfer(msg.value);
        emit LogUploadUploadData(msg.sender, _uploaddate, _uploadername, _id);
    }
 
    function getUploaderInfo(uint _id) public view returns (address, uint, bytes32, bytes32) {
        Uploader memory uploader = uploaderInfo[_id];
        return (uploader.uploaderaddress, uploader.uploaddate, uploader.uploadername, uploader.cvs);
    }

    function getAllUploaders() public view returns (address[20]) { 
        return uploaders;
    }
}
