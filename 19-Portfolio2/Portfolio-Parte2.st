!classDefinition: #PortfolioReportsTest category: #'Portfolio-Parte2'!
TestCase subclass: #PortfolioReportsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!PortfolioReportsTest methodsFor: 'summary' stamp: 'na 6/29/2020 15:41:16'!
test04EmptyPortfolioPritsItsNameAndItsBalance

	|portfolio|
	
	portfolio := Portfolio named: 'Portfolio de Carlitos'.
	
	self assert: (PortfolioSummary for: portfolio) summary equals: (OrderedCollection newFrom:{'Portfolio de Carlitos'. 
																												    '	Balance = 0'})
	
	
	
	
	
	! !

!PortfolioReportsTest methodsFor: 'summary' stamp: 'na 6/29/2020 15:46:16'!
test05PortfolioWithAnEmptyAccountPrintsTheirNamesAndBalanceWithIndentation

	|portfolio account|
	
	portfolio := Portfolio named: 'Portfolio de Carlitos'.
	account := ReceptiveAccount named: 'Cuenta de Gaston'.
	portfolio add: account.
	
	self assert: (PortfolioSummary for: portfolio) summary equals: (OrderedCollection newFrom:{'Portfolio de Carlitos'. 
																												    '	Cuenta de Gaston'.
																												    '		Balance = 0'.
																												    '	Balance = 0'})
	
	
	
	
	
	! !

!PortfolioReportsTest methodsFor: 'summary' stamp: 'na 6/29/2020 16:01:32'!
test06PortfolioWithAnAccountWithTransactionsPrintsWell

	|portfolio account|
	
	portfolio := Portfolio named: 'Portfolio de Carlitos'.
	account := ReceptiveAccount named: 'Cuenta de Gaston'.
	portfolio add: account.
	Deposit register: 100 on: account.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account .
	
	self assert: (PortfolioSummary for: portfolio) summary equals: (OrderedCollection newFrom:{'Portfolio de Carlitos'. 
																												    '	Cuenta de Gaston'.
																												    '		Depósito por 100.'.
																												    '		Depósito por 100.'.
																												    '		Extracción por 50.'.
																												    '		Balance = 150'.
																												    '	Balance = 150'})
	
	
	
	
	
	! !

!PortfolioReportsTest methodsFor: 'summary' stamp: 'na 6/29/2020 16:27:23'!
test07PortfolioWithAPortfolioWithAccountsWithTransactionsPrintsWell

	| account1 account2 account3 portfolio1 portfolio2 |
	
	portfolio1 := Portfolio named: 'Portfolio de Carlitos'.
	portfolio2 := Portfolio named: 'Portfolio de Betty'.
	account1 := ReceptiveAccount named: 'Cuenta de Esteban'.
	account2 := ReceptiveAccount named: 'Cuenta de Ester'.
	account3 := ReceptiveAccount named: 'Cuenta de Mastropiero'.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: account3.
	
	portfolio2 add: portfolio1.
	
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
	Transfer register: 50 in: account1 andOutOf: account2.
	
	self assert: (PortfolioSummary for: portfolio2) summary equals: (OrderedCollection newFrom:{'Portfolio de Betty'.
																											  '	Cuenta de Mastropiero'.
																											  '		Depósito por 100.'.
																											  '		Balance = 100'.
																											  '	Portfolio de Carlitos'.
																											  '		Cuenta de Esteban'.
																											  '			Depósito por 100.'.
																											  '			Entrada por transferencia de 50.'.
																											  '			Balance = 150'.
																											  '		Cuenta de Ester'.
																											  '			Depósito por 100.'.
																											  '			Salida por transferencia de 50.'.
																											  '			Balance = 50'.
																											  '		Balance = 200'.
																											  '	Balance = 300'.}).
	
	
	
	
	! !


!PortfolioReportsTest methodsFor: 'treePrinter' stamp: 'na 6/29/2020 16:28:11'!
test01EmptyPortfolioOnlyPrintItsName

	|portfolio|
	
	portfolio := Portfolio named: 'Portfolio de Carlitos'.
	
	self assert: (PortfolioTreePrinter for: portfolio) treePrinter equals: (OrderedCollection newFrom: {'Portfolio de Carlitos'})! !

!PortfolioReportsTest methodsFor: 'treePrinter' stamp: 'na 6/29/2020 16:28:11'!
test02PortfolioWithAnAccountPrintTheirNamesWithIndentation

	|portfolio|
	
	portfolio := Portfolio named: 'Portfolio de Carlitos'.
	portfolio add: (ReceptiveAccount named: 'Cuenta de Juan').
	
	self assert: (PortfolioTreePrinter for: portfolio) treePrinter equals: (OrderedCollection newFrom:{'Portfolio de Carlitos'.
																											'	Cuenta de Juan'}).! !

!PortfolioReportsTest methodsFor: 'treePrinter' stamp: 'na 6/29/2020 16:28:11'!
test03PortfolioWithPortfolioAnAccountPrintTheirNamesWithIndentationRecursively

	| account1 account2 account3 portfolio1 portfolio2 |
	
	portfolio1 := Portfolio named: 'Portfolio de Carlitos'.
	portfolio2 := Portfolio named: 'Portfolio de Betty'.
	account1 := ReceptiveAccount named: 'Cuenta de Esteban'.
	account2 := ReceptiveAccount named: 'Cuenta de Ester'.
	account3 := ReceptiveAccount named: 'Cuenta de Mastropiero'.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: account3.
	
	portfolio2 add: portfolio1.
	
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
	Transfer register: 50 in: account1 andOutOf: account2.
	
	self assert: (PortfolioTreePrinter for: portfolio2) treePrinter equals: (OrderedCollection newFrom:{'Portfolio de Betty'.
																											  '	Cuenta de Mastropiero'.
																											  '	Portfolio de Carlitos'.
																											  '		Cuenta de Esteban'.
																											  '		Cuenta de Ester'}).
	
	
	
	
	
	
	! !


!classDefinition: #PortfolioTest category: #'Portfolio-Parte2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/29/2020 16:43:20'!
test16PortfolioCanHaveAName

	self assert: (Portfolio named: 'Portfolio de Carlitos') name equals: 'Portfolio de Carlitos'.! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Parte2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'na 6/29/2020 16:45:13'!
test08ReceptiveAccountCanHaveAName

	self assert: (ReceptiveAccount named: 'Cuenta de Carlitos') name equals: 'Cuenta de Carlitos'.! !


!classDefinition: #TransactionsReportsTest category: #'Portfolio-Parte2'!
TestCase subclass: #TransactionsReportsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!TransactionsReportsTest methodsFor: 'netTransfer' stamp: 'rjs 6/27/2020 17:39:21'!
test08NetTransferEmptyAccountEqualsEmptyNetTransferSummary

	| account |
	
	account := ReceptiveAccount new.

	self assert: ((NetTransfer for: account ) generateNetTransferSummary ) equals: 0.
	
	! !

!TransactionsReportsTest methodsFor: 'netTransfer' stamp: 'rjs 6/27/2020 17:51:15'!
test09NetTransferPortfolioWithAccountsWithTransactions

	| account1 account2 account3 portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	portfolio1 add: account1.
	portfolio2 add: account2.
	portfolio2 add: account3.
	
	portfolio2 add: portfolio1.
	
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
	Transfer register: 50 in: account1 andOutOf: account2.

	self assert: ((NetTransfer for: portfolio1 ) generateNetTransferSummary ) equals: 50.
	self assert: ((NetTransfer for: portfolio2 ) generateNetTransferSummary ) equals: 0.
	self assert: ((NetTransfer for: account1 ) generateNetTransferSummary ) equals: 50.
	self assert: ((NetTransfer for: account2 ) generateNetTransferSummary ) equals: -50.
	! !


!TransactionsReportsTest methodsFor: 'accountSummary' stamp: 'rjs 6/27/2020 17:05:03'!
test01EmptyAccountEqualsEmptyReport

	| account |
	
	account := ReceptiveAccount new.

	self assert: ((AccountSummary for: account ) generateSummary ) equals: (OrderedCollection  newFrom: { 'Balance = 0' }).
	
	! !

!TransactionsReportsTest methodsFor: 'accountSummary' stamp: 'rjs 6/27/2020 17:05:16'!
test02AccountWithADeposit

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 10 on: account.

	self assert: ((AccountSummary for: account ) generateSummary ) equals: (OrderedCollection  newFrom: { 'Depósito por 10.'. 'Balance = 10' }).
	
	! !

!TransactionsReportsTest methodsFor: 'accountSummary' stamp: 'rjs 6/27/2020 17:05:26'!
test03AccountWithSeveralsTransactions

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 10 on: account.
	Withdraw register: 5 on: account.

	self assert: ((AccountSummary for: account ) generateSummary )  equals: (OrderedCollection  newFrom: { 'Depósito por 10.'. 'Extracción por 5.'. 'Balance = 5'  }).
	
	! !

!TransactionsReportsTest methodsFor: 'accountSummary' stamp: 'rjs 6/27/2020 17:05:47'!
test04AccountsWithSeveralsTransfer

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	Withdraw register: 10 on: account1.
	Transfer register: 10 in: account1 andOutOf: account2.
	Transfer register: 50 in: account2 andOutOf: account1.

	self assert: ((AccountSummary for: account1 ) generateSummary )  equals: (OrderedCollection  newFrom: { 'Depósito por 100.'. 
																					'Extracción por 10.'. 
																					'Entrada por transferencia de 10.'.
																					'Salida por transferencia de 50.'.
																					'Balance = 50' }).
																					
	self assert: ((AccountSummary for: account2 ) generateSummary ) equals: (OrderedCollection  newFrom: { 'Depósito por 100.'. 'Salida por transferencia de 10.'. 'Entrada por transferencia de 50.'. 'Balance = 140' }).
	
	
	! !

!TransactionsReportsTest methodsFor: 'accountSummary' stamp: 'rjs 6/27/2020 17:18:48'!
test05EmptyPortfolioEmptyReport

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: ((AccountSummary for: portfolio ) generateSummary ) equals: (OrderedCollection  newFrom: { 'Balance = 0' }).
	
	! !

!TransactionsReportsTest methodsFor: 'accountSummary' stamp: 'na 6/29/2020 14:07:32'!
test06PortfolioWithAccountsWithOutTransactions

	| account1 account2 portfolio |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio add: account1.
	portfolio add: account2.
	
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	Transfer register: 50 in: account1 andOutOf: account2.

	self assert: ((AccountSummary for: portfolio ) generateSummary )  equals: (OrderedCollection  newFrom: {  'Depósito por 100.'. 
																					'Entrada por transferencia de 50.'.
																					'Depósito por 100.'.
																					'Salida por transferencia de 50.'.
																					'Balance = 200'  }).
	! !

!TransactionsReportsTest methodsFor: 'accountSummary' stamp: 'na 6/29/2020 14:11:25'!
test07PortfolioWithAccountsWithTransactions

	| account1 account2 account3 portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: account3.
	
	portfolio2 add: portfolio1.
	
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
	Transfer register: 50 in: account1 andOutOf: account2.

	self assert: ((AccountSummary for: portfolio2 ) generateSummary ) equals: (OrderedCollection  newFrom: {    'Depósito por 100.'.
																						'Depósito por 100.'. 
																						'Entrada por transferencia de 50.'.
																						'Depósito por 100.'.
																						'Salida por transferencia de 50.'.
																						'Balance = 300'  }).
	! !


!classDefinition: #TransferTest category: #'Portfolio-Parte2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!TransferTest methodsFor: 'test' stamp: 'na 6/25/2020 10:57:35'!
test01CanDoATransference

	| accountOut accountIn|
	
	accountIn := ReceptiveAccount new.
	accountOut := ReceptiveAccount new.
	
	Transfer register: 50 in: accountIn andOutOf: accountOut.
	
	self assert: accountIn balance equals: 50.
	self assert: accountOut balance equals: -50.
	
	! !

!TransferTest methodsFor: 'test' stamp: 'na 6/25/2020 08:28:35'!
test02CanNotDoATransferenceWithNonPositiveOrZeroMoney

	| accountOut accountIn  |
	
	accountIn := ReceptiveAccount new.
	accountOut := ReceptiveAccount new.

	
	self
		should: [ Transfer register: 0 in: accountIn andOutOf: accountOut.]
		raise: Error
		withMessageText: [ Transfer InvalidTransactionNegativeValueErrorDescription ]! !

!TransferTest methodsFor: 'test' stamp: 'na 6/25/2020 08:28:45'!
test03AnAccountCanNotDoATransferenceToItself

	| account  |
	
	account := ReceptiveAccount new.
	
	self
		should: [ Transfer register: 50 in: account andOutOf: account.]
		raise: Error
		withMessageText: [ Transfer InvalidTransactionErrorDescription ]! !

!TransferTest methodsFor: 'test' stamp: 'na 6/25/2020 11:06:07'!
test04CanReachTheInLegFromTheOutLeg

	|legOut transfer|
	
	transfer := Transfer register: 50 in: ReceptiveAccount new andOutOf: ReceptiveAccount new.
	
	legOut := transfer legOut.
	
	self assert: (legOut transfer) equals: transfer.
	self assert: (legOut transfer legIn) equals: transfer legIn.
	! !

!TransferTest methodsFor: 'test' stamp: 'na 6/25/2020 11:06:46'!
test05CanReachTheOutLegFromTheInLeg

	|legIn transfer|
	
	transfer := Transfer register: 50 in: ReceptiveAccount new andOutOf: ReceptiveAccount new.
	legIn := transfer legIn.
	
	self assert: (legIn transfer) equals: transfer.
	self assert: (legIn transfer legOut) equals: transfer legOut.
	! !

!TransferTest methodsFor: 'test' stamp: 'na 6/25/2020 16:41:58'!
test06TheTransferInTheLegsIsTheSame

	|legIn legOut transfer|
	
	transfer := Transfer register: 50 in: ReceptiveAccount new andOutOf: ReceptiveAccount new.
	legIn := transfer legIn.
	legOut := transfer legOut.
	
	self assert: legIn transfer equals: legOut transfer.
	! !


!classDefinition: #Account category: #'Portfolio-Parte2'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'reports' stamp: 'na 6/29/2020 16:38:43'!
accept: aReport

	^self subclassResponsibility 
	! !

!Account methodsFor: 'reports' stamp: 'na 6/29/2020 16:38:35'!
reportAccounts: aReporter

	^self subclassResponsibility ! !

!Account methodsFor: 'reports' stamp: 'na 6/29/2020 16:39:01'!
reportTo: aReporter

	^self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Parte2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'na 6/29/2020 14:17:06'!
initializeWith: aName

	name := aName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'name' stamp: 'na 6/29/2020 14:17:18'!
name

	^name! !


!Portfolio methodsFor: 'reports' stamp: 'na 6/29/2020 14:45:01'!
accept: aReport

	aReport reportFromAPortfolio: self.
	! !

!Portfolio methodsFor: 'reports' stamp: 'na 6/29/2020 14:48:03'!
reportAccounts: aReporter

	accounts do:[:each | each accept: aReporter]! !

!Portfolio methodsFor: 'reports' stamp: 'na 6/29/2020 15:27:54'!
reportTo: aReporter

	accounts do: [ :each | each reportTo: aReporter ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Parte2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'na 6/29/2020 14:22:17'!
named: aName

	^self new initializeWith: aName! !

!Portfolio class methodsFor: 'instance creation' stamp: 'na 6/29/2020 14:22:21'!
named: aName with: anAccount

	^(self new initializeWith: aName) add: anAccount; yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'na 6/29/2020 14:22:25'!
named: aName with: anAccount with: anotherAccount

	^(self new initializeWith: aName) add: anAccount; add: anotherAccount; yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'error' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Parte2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'na 6/29/2020 14:18:01'!
initializeWith: aName

	super initialize.
	transactions := OrderedCollection new.
	name := aName.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'name' stamp: 'na 6/29/2020 14:18:11'!
name

	^name! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'na 6/29/2020 14:48:39'!
accept: aReporter

	aReporter reportFromAReceptiveAccount: self! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'na 6/29/2020 16:39:46'!
reportAccounts: aReporter

	! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'na 6/29/2020 14:08:27'!
reportTo: aReporter


	 transactions do: [ :each | each reportTo: aReporter ].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: #'Portfolio-Parte2'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'na 6/29/2020 14:17:40'!
named: aName

	^self new initializeWith: aName.! !


!classDefinition: #AccountTransaction category: #'Portfolio-Parte2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Parte2'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Parte2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'rjs 6/27/2020 16:16:04'!
reportTo: aReporter

	^ aReporter reportFromADeposit: value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Parte2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: #'Portfolio-Parte2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!TransferLeg methodsFor: 'report' stamp: 'na 6/29/2020 14:03:45'!
reportTo: aReporter

	^self subclassResponsibility.! !


!TransferLeg methodsFor: 'value' stamp: 'na 6/29/2020 14:04:00'!
value

	^self subclassResponsibility.! !


!TransferLeg methodsFor: 'balance' stamp: 'na 6/29/2020 14:03:27'!
affectBalance: aBalance

	^self subclassResponsibility.! !


!classDefinition: #IncomingTransfer category: #'Portfolio-Parte2'!
TransferLeg subclass: #IncomingTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!IncomingTransfer methodsFor: 'value' stamp: 'na 6/29/2020 14:03:09'!
value

	^transfer value! !


!IncomingTransfer methodsFor: 'balance' stamp: 'na 6/25/2020 10:57:19'!
affectBalance: aBalance

	^ aBalance + transfer value.! !


!IncomingTransfer methodsFor: 'initialization' stamp: 'na 6/29/2020 14:02:41'!
initializeFor: aTransfer

	transfer := aTransfer ! !


!IncomingTransfer methodsFor: 'report' stamp: 'rjs 6/27/2020 16:20:44'!
reportTo: aReporter

	^ aReporter reportFromAnInComingTransfer: transfer value .! !


!IncomingTransfer methodsFor: 'accesing' stamp: 'na 6/25/2020 11:01:55'!
transfer

	^transfer! !


!classDefinition: #OutgoingTransfer category: #'Portfolio-Parte2'!
TransferLeg subclass: #OutgoingTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!OutgoingTransfer methodsFor: 'initialization' stamp: 'na 6/29/2020 14:02:25'!
initializeFor: aTransfer

	transfer := aTransfer ! !


!OutgoingTransfer methodsFor: 'value' stamp: 'na 6/29/2020 14:03:14'!
value

	^transfer value! !


!OutgoingTransfer methodsFor: 'balance' stamp: 'na 6/25/2020 10:57:12'!
affectBalance: aBalance

	^ aBalance - transfer value! !


!OutgoingTransfer methodsFor: 'accesing' stamp: 'na 6/25/2020 11:02:06'!
transfer

	^transfer! !


!OutgoingTransfer methodsFor: 'report' stamp: 'rjs 6/27/2020 16:18:22'!
reportTo: aReporter

	^ aReporter reportFromAnOutgoingTransfer: transfer value .! !


!classDefinition: #Withdraw category: #'Portfolio-Parte2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'rjs 6/27/2020 16:14:37'!
reportTo: aReporter

	^ aReporter reportFromAWithdraw: value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Parte2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioReports category: #'Portfolio-Parte2'!
Object subclass: #PortfolioReports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!PortfolioReports methodsFor: 'report' stamp: 'na 6/29/2020 16:29:48'!
reportFromAPortfolio: aPortfolio

	^self subclassResponsibility ! !

!PortfolioReports methodsFor: 'report' stamp: 'na 6/29/2020 16:30:02'!
reportFromAReceptiveAccount: aReceptiveAccount

	^self subclassResponsibility ! !

!PortfolioReports methodsFor: 'report' stamp: 'na 6/29/2020 16:30:18'!
summary

	^self subclassResponsibility ! !


!classDefinition: #PortfolioSummary category: #'Portfolio-Parte2'!
PortfolioReports subclass: #PortfolioSummary
	instanceVariableNames: 'portfolio spaces summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!PortfolioSummary methodsFor: 'report' stamp: 'na 6/29/2020 16:29:31'!
reportFromAPortfolio: aPortfolio
	
	|spacesAux|
	spacesAux := spaces.
	
	summary add: spacesAux, aPortfolio name asString.
	spaces := spaces, '	'.
	aPortfolio reportAccounts: self.
	summary add: spacesAux, '	Balance = ', aPortfolio balance asString.! !

!PortfolioSummary methodsFor: 'report' stamp: 'na 6/29/2020 16:21:56'!
reportFromAReceptiveAccount: aReceptiveAccount
	
	|colectionAux|
	
	summary add: spaces, aReceptiveAccount name asString.
	
	colectionAux := (AccountSummary for: aReceptiveAccount) generateSummary.
	colectionAux do:[:each | summary add: spaces,'	',each ].! !

!PortfolioSummary methodsFor: 'report' stamp: 'na 6/29/2020 15:42:14'!
summary

	
	portfolio accept: self.
	^summary ! !


!PortfolioSummary methodsFor: 'initialization' stamp: 'na 6/29/2020 15:36:05'!
initializeWith: aPortfolio

	portfolio := aPortfolio.
	spaces := ''.
	summary := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioSummary class' category: #'Portfolio-Parte2'!
PortfolioSummary class
	instanceVariableNames: ''!

!PortfolioSummary class methodsFor: 'instance creation' stamp: 'na 6/29/2020 15:05:23'!
for: aPortfolio

	^self new initializeWith: aPortfolio.! !


!classDefinition: #PortfolioTreePrinter category: #'Portfolio-Parte2'!
PortfolioReports subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio summary spaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'na 6/29/2020 14:43:51'!
initializeWith: aPortfolio

	portfolio := aPortfolio.
	summary := OrderedCollection new.
	spaces := ''.! !


!PortfolioTreePrinter methodsFor: 'report' stamp: 'na 6/29/2020 14:47:06'!
reportFromAPortfolio: aPortfolio

	summary add: spaces, aPortfolio name asString.
	
	spaces := spaces, '	'.
	
	aPortfolio reportAccounts: self.! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'na 6/29/2020 14:49:07'!
reportFromAReceptiveAccount: aReceptiveAccount

	summary add: spaces, aReceptiveAccount name.! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'na 6/29/2020 14:49:25'!
treePrinter

	portfolio accept: self.
	
	^summary.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: #'Portfolio-Parte2'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'na 6/29/2020 14:20:35'!
for: aPortfolio

	^self new initializeWith: aPortfolio! !


!classDefinition: #TransactionsReports category: #'Portfolio-Parte2'!
Object subclass: #TransactionsReports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!TransactionsReports methodsFor: 'report' stamp: 'rjs 6/27/2020 16:54:50'!
generateSummary

	^self subclassResponsibility ! !


!classDefinition: #AccountSummary category: #'Portfolio-Parte2'!
TransactionsReports subclass: #AccountSummary
	instanceVariableNames: 'account summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!AccountSummary methodsFor: 'initialization' stamp: 'rjs 6/27/2020 17:19:54'!
initiliaze: anAccount

	account := anAccount.
	summary := OrderedCollection  new.! !


!AccountSummary methodsFor: 'report' stamp: 'na 6/29/2020 14:09:43'!
generateSummary

	account reportTo: self.
	summary add: ('Balance = ', account balance asString).
	^ summary

! !

!AccountSummary methodsFor: 'report' stamp: 'rjs 6/27/2020 17:03:23'!
reportFromADeposit: aValue

	summary add: 'Depósito por ' , aValue asString , '.'

! !

!AccountSummary methodsFor: 'report' stamp: 'rjs 6/27/2020 17:03:20'!
reportFromAWithdraw: aValue

	summary add:  'Extracción por ' , aValue asString , '.'

! !

!AccountSummary methodsFor: 'report' stamp: 'rjs 6/27/2020 17:01:42'!
reportFromAnInComingTransfer: aValue

	summary add:  'Entrada por transferencia de ' , aValue asString , '.'! !

!AccountSummary methodsFor: 'report' stamp: 'rjs 6/27/2020 17:01:46'!
reportFromAnOutgoingTransfer: aValue

	summary add:  'Salida por transferencia de ' , aValue asString , '.'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'Portfolio-Parte2'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'rjs 6/27/2020 17:20:46'!
for: anAccount
	^ self basicNew initiliaze: anAccount.! !


!classDefinition: #NetTransfer category: #'Portfolio-Parte2'!
TransactionsReports subclass: #NetTransfer
	instanceVariableNames: 'account netTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!NetTransfer methodsFor: 'initialization' stamp: 'rjs 6/27/2020 17:36:34'!
initiliaze: anAccount

	account := anAccount.
	netTransfer := 0.! !


!NetTransfer methodsFor: 'report' stamp: 'rjs 6/27/2020 17:37:54'!
generateNetTransferSummary
	
	account reportTo: self.
	
	^ netTransfer ! !

!NetTransfer methodsFor: 'report' stamp: 'rjs 6/27/2020 17:34:51'!
reportFromADeposit: aValue

	^ self! !

!NetTransfer methodsFor: 'report' stamp: 'rjs 6/27/2020 17:34:47'!
reportFromAWithdraw: aValue

	^ self

! !

!NetTransfer methodsFor: 'report' stamp: 'rjs 6/27/2020 17:38:09'!
reportFromAnInComingTransfer: aValue

	netTransfer := netTransfer + aValue! !

!NetTransfer methodsFor: 'report' stamp: 'rjs 6/27/2020 17:38:06'!
reportFromAnOutgoingTransfer: aValue

	netTransfer := netTransfer - aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NetTransfer class' category: #'Portfolio-Parte2'!
NetTransfer class
	instanceVariableNames: ''!

!NetTransfer class methodsFor: 'instance creation' stamp: 'rjs 6/27/2020 17:20:49'!
for: anAccount
	^ self basicNew initiliaze: anAccount.! !


!classDefinition: #Transfer category: #'Portfolio-Parte2'!
Object subclass: #Transfer
	instanceVariableNames: 'value legInComing legOutGoing'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Parte2'!

!Transfer methodsFor: 'initialization' stamp: 'na 6/29/2020 14:04:51'!
initializeWith: anAmount 

	value := anAmount.
	legInComing := IncomingTransfer new initializeFor: self.
	legOutGoing := OutgoingTransfer new initializeFor: self.! !


!Transfer methodsFor: 'action' stamp: 'na 6/25/2020 08:38:36'!
affectBalance: aBalance

	^self subclassResponsibility ! !


!Transfer methodsFor: 'accesing' stamp: 'na 6/25/2020 10:57:56'!
legIn

	^legInComing ! !

!Transfer methodsFor: 'accesing' stamp: 'na 6/25/2020 10:58:13'!
legOut

	^legOutGoing ! !

!Transfer methodsFor: 'accesing' stamp: 'na 6/25/2020 10:43:45'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Parte2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'na 6/25/2020 16:36:54'!
register: anAmount in: accountIn andOutOf: accountOut
	
	|transfer|
	
	( anAmount <= 0) ifTrue: [ self error: self InvalidTransactionNegativeValueErrorDescription ].
	
	(accountIn = accountOut)  ifTrue: [ self error: self  InvalidTransactionErrorDescription ].

	transfer := Transfer new initializeWith: anAmount.	
	accountIn register: transfer legIn.
	accountOut register: transfer legOut.
	
	^transfer ! !


!Transfer class methodsFor: 'error' stamp: 'rjs 6/22/2020 20:50:42'!
InvalidTransactionErrorDescription

	^ ' No podes transferir desde y hacia la misma cuenta '! !

!Transfer class methodsFor: 'error' stamp: 'rjs 6/22/2020 20:54:26'!
InvalidTransactionNegativeValueErrorDescription

	^ ' No podes transferir cantidad de dinero menor o igual a cero '! !
