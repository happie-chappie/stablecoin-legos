const { expect } = require("chai");

describe("StableCoin contract", function() {

  let StableCoin;
  let stableCoin;
  let owner;
  let addr1;

  beforeEach(async function () {
    StableCoin = await ethers.getContractFactory("StableCoin");
    [owner, addr1] = await ethers.getSigners();

    stableCoin = await StableCoin.deploy();
    await stableCoin.deployed();
  });

  describe("Usual Suspects", function () {
    it("dummy", async function () {
    });
  });

});
