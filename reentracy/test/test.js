const Mycontract = artifacts.require('Mycontract')
const Attack = artifacts.require('Attack')

contract('testing ',(accounts) =>{

    let mycontract,attack
    it('deployement',async ()=>{
        mycontract = await Mycontract.deployed()
        console.log('deployed address is ',mycontract.address)


        attack = await Attack.deployed(mycontract.address)
        console.log('deployed address is ',attack.address)
    })

    it('deposit',async()=>{
        await mycontract.deposit({
            from : accounts[1],
            value : 1000000000000000,
            gas : 800000
        
        })

        await mycontract.deposit({
            from : accounts[2],
            value : 3000000000000000,
            gas : 800000
        
        })

        await mycontract.deposit({
            from : accounts[3],
            value : 3000000000000000,
            gas : 800000
        
        })
    })


    it('total balance of smart contract',async()=>{
        await mycontract.balanceOf().then(function(results){
            console.log("%s",results)
        })
    })

    it('implementing attack',async()=>{

        await attack.attack({
            from : accounts[4],
            value : 3000000000000000,
            gas : 80000
        }).then(function(results){
            console.log(results)
        })
    })


    it('total balance of smart contract',async()=>{
        await mycontract.balanceOf().then(function(results){
            console.log("%s",results)
        })
    })

    it('total balance of attack contract',async()=>{
        await attack.balanceOf().then(function(results){
            console.log("%s",results)
        })
    })

    

    

})