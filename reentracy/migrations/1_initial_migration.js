const Mycontract = artifacts.require("Mycontract");
const Attack = artifacts.require('Attack');

module.exports = async (deployer) =>{
  await deployer.deploy(Mycontract);
  await deployer.deploy(Attack,Mycontract.address);
};
