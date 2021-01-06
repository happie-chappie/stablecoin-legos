pragma solidity ^0.7.0;

contract StableCoin{
	address ceo = 0xD0A16a95669B14161B09dafFa20B24575b77b731;

	mapping(address => uint) tokens;

	function approval(address _owner, address _approved,uint _tokenId) public {
		require(tokens[_owner]==_tokenId);
		tokens[_approved]=_tokenId;
	}

	function transfer(address _to, uint _amount) public payable {
		require(_amount <= tokens[msg.sender]);
		tokens[msg.sender]-=_amount;
		tokens[_to]+=_amount;
	}

	function balanceOf(address _owner) public view returns (uint) {
		return tokens[_owner];
	}

	function TransferFrom(address _from, address _to, uint _tokenId) public payable{
		require(tokens[_from]==_tokenId);
		tokens[_from]=0;
		tokens[_to]=_tokenId;
	}

	function approve(address _approved, uint _tokenId) public payable {
		require(tokens[msg.sender]==_tokenId);
		tokens[_approved]=_tokenId;
	}

	function mint(address _to, uint _amount) public payable {
		tokens[ceo]+=_amount;
		tokens[_to]+=_amount;
	}

	function burn(address _from,uint _amount) public payable {
		tokens[ceo]-=_amount;
		tokens[_from]-=_amount;
	}
}
