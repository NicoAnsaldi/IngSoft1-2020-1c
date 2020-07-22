!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'rjs 7/21/2020 18:31:37'!
test09CartRemembersCorrectlyMultipleTimesAddedItem

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 8! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'test' stamp: 'na 7/21/2020 14:42:29'!
test01CreateCreditCard

	| visa |

	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepito'.

	self assert: visa number equals: '1234567891234567'.
	self assert: visa date equals: (Month month: 2 year: 2020).
	self assert: visa owner equals: 'Pepito'! !

!CreditCardTest methodsFor: 'test' stamp: 'na 7/21/2020 14:42:52'!
test02ValidNumber

	self
	should: [ CreditCard createWithANumber: '123456789123456' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepe' .]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]! !

!CreditCardTest methodsFor: 'test' stamp: 'na 7/21/2020 14:43:04'!
test03ValidOwner

	self
	should: [ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: ' ' ]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]! !

!CreditCardTest methodsFor: 'test' stamp: 'na 7/21/2020 14:54:01'!
test04isExpired

	| today visa |
	
	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepito'.

	today := DateAndTime now.
	
	self assert: (visa isExpiredOn: today)! !


!classDefinition: #InterfaceRestTest category: #TusLibros!
TestCase subclass: #InterfaceRestTest
	instanceVariableNames: 'testObjectsFactory debitBehavior autSystem objectFactory clock interfaze'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'rjs 7/16/2020 19:09:22'!
autentificateWith: anID and: aPassword

	^ autSystem value: anID value: aPassword.! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'na 7/21/2020 13:58:42'!
autentificationSystem

	^self! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'na 7/21/2020 14:50:02'!
creditCardOwner

	^'Pepito'! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'rjs 7/21/2020 19:25:53'!
debit: anAmount from: aCreditCard 

	! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'na 7/22/2020 19:43:24'!
expiredCreditCardDate

	^(Month month: (clock now) monthIndex year: (clock now) yearNumber - 1)! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'na 7/22/2020 15:04:43'!
invalidCartID

	^nil! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'na 7/21/2020 13:58:59'!
merchantProcessor

	^self! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'na 7/22/2020 14:35:27'!
notExpiredCreditCardDate

	^(Month month: (DateAndTime now) monthIndex year: (DateAndTime now) yearNumber + 1)! !

!InterfaceRestTest methodsFor: 'auxiliaries' stamp: 'rjs 7/21/2020 17:41:15'!
validCreditCardNumber

	^'1234567891234567'! !


!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 18:57:31'!
test01CanCreateACartWithAValidUserAndAValidPass

	| cartID |

	autSystem := [ :ID :Pass | ].
	cartID := interfaze createCart: '1234' with: 'hola1234'.
	
	self assert: ((interfaze listCart: cartID) isEmpty)

! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 18:57:49'!
test02CanNotCreateACartWithInvalidUser

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongIDErrorMessage].
	
	self 
		should: [ interfaze createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongIDErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 18:58:01'!
test03CanNotCreateACartWithInvalidPass

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongPassErrorMessage].
	
	self 
		should: [ interfaze createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongPassErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 18:58:17'!
test04CreateCartReturnsAnId
	| cartId|

	cartId :=interfaze createCart: '1234' with: 'hola1234'.
	
	self assert: (cartId = nil) not.
	
	
	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 18:58:35'!
test05DifferentCartsReturnDifferentIds

	| cartId1 cartId2 cartId3 |

	cartId1 := interfaze createCart: 'L' with: '678'.
	cartId2 := interfaze createCart: 'N' with: '123'.
	cartId3 := interfaze createCart: 'R' with: '454'.
	
	self assert: ((cartId1 = cartId2) not).
	self assert: ((cartId2 = cartId3) not).
	self assert: ((cartId1 = cartId3) not).
	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 18:59:31'!
test06CanAddBooksToAValidCart

	|  cartID |

	cartID := interfaze createCart: '1234' with: 'hola1234'.
	
	interfaze addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	
	self assert: ((interfaze listCart: cartID) includes: objectFactory itemSellByTheStore).
	self assert: ((interfaze listCart: cartID) occurrencesOf: objectFactory itemSellByTheStore) equals: 1
	



	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 18:59:56'!
test07CanNotAddItemToNotCreatedCart		

	self 
		should: [ interfaze addBook: objectFactory itemSellByTheStore quantity: 1 cart: self invalidCartID . ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest invalidCartIDErrorMessage.]
	


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:00:22'!
test08CanNotAddItemNotSellByTheStore

	|cartID |

	cartID := interfaze createCart: '1234' with: 'hola1234'.
		

	self 
		should: [ interfaze addBook: objectFactory itemNotSellByTheStore quantity: 1 cart: cartID. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = interfaze invalidItemErrorMessage.
		self assert: (interfaze listCart: cartID) isEmpty ]
	
	
	


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:00:45'!
test09ListCartOfAnEmptyCartIsEmpty
	
	|cartID |

	cartID := interfaze createCart: '1234' with: 'hola1234'.
		
	self assert: ((interfaze listCart: cartID) isEmpty).


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:01:04'!
test10CanNotListCartOfNotCreatedCart

	self 
		should: [ interfaze listCart: self invalidCartID. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest invalidCartIDErrorMessage.]

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:01:35'!
test11ListCartReturnsTheRightNumberOfItems

	|cartID |
	
	cartID := interfaze createCart: '1234' with: 'hola1234'.
	
	interfaze addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	interfaze addBook: objectFactory itemSellByTheStore quantity: 10 cart: cartID.
	interfaze addBook: objectFactory itemSellByTheStore quantity: 12 cart: cartID.
	interfaze addBook: objectFactory anotherItemSellByTheStore  quantity: 4 cart: cartID. 
	
	self assert: ((interfaze listCart: cartID) includes: objectFactory itemSellByTheStore).
	self assert: ((interfaze listCart: cartID) includes: objectFactory anotherItemSellByTheStore).
	self assert: ((interfaze listCart: cartID) occurrencesOf: objectFactory itemSellByTheStore) equals: 23.
	self assert: ((interfaze listCart: cartID) occurrencesOf: objectFactory anotherItemSellByTheStore) equals: 4.
	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:02:08'!
test12CanCheckoutACart

	|cartID purchases|

	cartID := interfaze createCart: 'Pepito' with: 'hola1234'.
	interfaze addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	
	interfaze checkout: cartID 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self notExpiredCreditCardDate 
				wihtOwner: self creditCardOwner.
				
	purchases := interfaze listPurchasesFromUser: 'Pepito' andPass: 'hola1234'.
	
	
	self assert: (purchases includesKey: objectFactory itemSellByTheStore).
	self assert: (purchases at: objectFactory itemSellByTheStore) equals: objectFactory itemSellByTheStorePrice.


	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:46:59'!
test13CanNotCheckoutWithAnExpiredCard

	|cartID |

	cartID := interfaze createCart: 'Pepito' with: 'hola1234'.
	interfaze addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	
	self
	should: [interfaze checkout: cartID 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self expiredCreditCardDate 
				wihtOwner: self creditCardOwner.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError | 
		self assert: anError messageText = interfaze canNotChargeAnExpiredCreditCardErrorMessage.
		self assert: (interfaze listPurchasesFromUser: 'Pepito' andPass: 'hola1234') isEmpty]
				
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:02:59'!
test14CanNotCheckoutAnEmptyCart

	|cartID |

	cartID := interfaze createCart: 'Pepito' with: 'hola1234'.
	
	self
	should: [interfaze checkout: cartID 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self expiredCreditCardDate 
				wihtOwner: self creditCardOwner.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError | 
		self assert: anError messageText = interfaze cartCanNotBeEmptyErrorMessage.
		self assert: (interfaze listPurchasesFromUser: 'Pepito' andPass: 'hola1234') isEmpty]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:03:20'!
test15CanNotCheckoutANotCreatedCart

	self
	should: [interfaze checkout: self invalidCartID 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self expiredCreditCardDate 
				wihtOwner: self creditCardOwner.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError | 
		self assert: anError messageText = InterfaceRest invalidCartIDErrorMessage]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:03:46'!
test16WhenCheckOutTheCartCantBeUseAgain

	| cartID |

	cartID := interfaze createCart: 'Pepito' with: 'hola1234'.
	interfaze addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	
	interfaze checkout: cartID 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self notExpiredCreditCardDate 
				wihtOwner: self creditCardOwner.
				
	self should: [(interfaze listCart: cartID)]
	raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError | anError messageText = InterfaceRest invalidCartIDErrorMessage ]
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:04:16'!
test17CanListPurchasesOfOneUserCart

	|cartID purchases|

	cartID := interfaze createCart: 'Pepito' with: 'hola1234'.
	interfaze addBook: objectFactory itemSellByTheStore quantity: 4 cart: cartID.
	interfaze addBook: objectFactory anotherItemSellByTheStore quantity: 3 cart: cartID.
	
	interfaze checkout: cartID 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self notExpiredCreditCardDate 
				wihtOwner: self creditCardOwner.
				
	purchases := interfaze listPurchasesFromUser: 'Pepito' andPass: 'hola1234'.
	
	
	self assert: (purchases includesKey: objectFactory itemSellByTheStore).
	self assert: (purchases at: objectFactory itemSellByTheStore) equals: objectFactory itemSellByTheStorePrice * 4.
	self assert: (purchases includesKey: objectFactory anotherItemSellByTheStore).
	self assert: (purchases at: objectFactory anotherItemSellByTheStore) equals: objectFactory anotherItemSellByTheStorePrice * 3.

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:04:52'!
test18ListPurchasesDontShowPurchasesFromOtherCostumers

	|cartID1 cartID2 purchases1 purchases2|

	cartID1 := interfaze createCart: 'Pepito' with: 'hola1234'.
	cartID2 := interfaze createCart: 'Pedro' with: 'eldiegote'.
	interfaze addBook: objectFactory itemSellByTheStore quantity: 4 cart: cartID1.
	interfaze addBook: objectFactory anotherItemSellByTheStore quantity: 3 cart: cartID2.
	
	interfaze checkout: cartID1 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self notExpiredCreditCardDate 
				wihtOwner: self creditCardOwner.

	interfaze checkout: cartID2 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self notExpiredCreditCardDate 
				wihtOwner: 'Pedro'.
				
	purchases1 := interfaze listPurchasesFromUser: 'Pepito' andPass: 'hola1234'. 
	purchases2 := interfaze listPurchasesFromUser: 'Pedro' andPass: 'eldiegote'. 
	
	self assert: (purchases1 includesKey: objectFactory itemSellByTheStore).
	self assert: (purchases1 at: objectFactory itemSellByTheStore) equals: objectFactory itemSellByTheStorePrice * 4.
	self deny: (purchases1 includesKey: objectFactory anotherItemSellByTheStore).
	
	self assert: (purchases2 includesKey: objectFactory anotherItemSellByTheStore).
	self assert: (purchases2 at: objectFactory anotherItemSellByTheStore) equals: objectFactory anotherItemSellByTheStorePrice * 3.
	self deny: (purchases2 includesKey: objectFactory itemSellByTheStore).! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:05:09'!
test19CantListPurchasesOfAnInvalidUserName

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongIDErrorMessage].
	
	self 
		should: [interfaze listPurchasesFromUser: 'User' andPass: 'Pass']
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongIDErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:05:21'!
test20CantListPurchasesOfAValidUserNameWithInvalidPassword

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongPassErrorMessage].
	
	self 
		should: [interfaze listPurchasesFromUser: 'User' andPass: 'Pass']
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongPassErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:05:52'!
test21CanNotAddToCartWhenSessionIsExpired

	|cartId |

	cartId := interfaze createCart: 'Pepito' with: 'hola1234'.
	clock advanceTime: (interfaze sessionDuration + 1 minutes) .
	self
		should: [interfaze addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartId]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: interfaze sessionHasExpiredErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:47:51'!
test22CanNotListCartWhenSessionIsExpired

	|cartId |

	cartId := interfaze createCart: 'Pepito' with: 'hola1234'.
	clock advanceTime: (interfaze sessionDuration + 1 minutes) .
	self
		should: [interfaze listCart: cartId]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: interfaze sessionHasExpiredErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/22/2020 19:49:56'!
test23CanNotCheckOutACartWhenSessionIsExpired

	|cartId |

	cartId := interfaze createCart: 'Pepito' with: 'hola1234'.
	clock advanceTime: (interfaze sessionDuration + 1 minutes) .
	self
		should: [interfaze checkout: cartId 
							creditCardNumber: self validCreditCardNumber 
							withExpiredDate: self notExpiredCreditCardDate 
							wihtOwner: self creditCardOwner.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: interfaze sessionHasExpiredErrorMessage.]! !


!InterfaceRestTest methodsFor: 'setUp' stamp: 'na 7/22/2020 18:12:20'!
setUp

	autSystem := [ :ID :Pass | ].
	objectFactory := StoreTestObjectsFactory new.
	clock := ManualClock at: DateAndTime now.
	interfaze := InterfaceRest withAthoritationSystem: self autentificationSystem 
									withACatalog: objectFactory defaultCatalog 
									aMerchantProcessor: self merchantProcessor 
									andASalesBook:  OrderedCollection new using: clock.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'na 7/22/2020 14:23:37'!
invalidItemErrorMessage
	
	^self class invalidItemErrorMessage.! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'rjs 7/21/2020 18:25:01'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Dictionary new.! !


!Cart methodsFor: 'queries' stamp: 'rjs 7/21/2020 19:24:45'!
contents

	| collection |
	
	collection := OrderedCollection  new.
		
	items keysDo: [ :aBook | 1 to: (items at: aBook) do: [ :each | collection add: aBook ] ].
		
	^ collection! !

!Cart methodsFor: 'queries' stamp: 'rjs 7/21/2020 18:55:42'!
createSaleRow: aBlock

	items keysDo: [ :each | aBlock value: each value: (items at: each)  value: (items at: each)*(catalog at: each)]! !

!Cart methodsFor: 'queries' stamp: 'rjs 7/21/2020 18:28:29'!
occurrencesOf: anItem
	
	 ^ items at: anItem ifAbsent: [ ^0 ]! !


!Cart methodsFor: 'testing' stamp: 'rjs 7/21/2020 18:29:11'!
includes: anItem

	^items includesKey: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'rjs 7/21/2020 18:42:47'!
total

	^ (items keys) inject: 0 into: [ :sum :each | sum + ((items at: each) * (catalog at: each)) ].! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'rjs 7/21/2020 18:28:37'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	items at: anItem put: (self occurrencesOf: anItem) + aQuantity! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!Cart class methodsFor: 'as yet unclassified' stamp: 'na 7/22/2020 14:23:22'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !


!classDefinition: #CartSession category: #TusLibros!
Object subclass: #CartSession
	instanceVariableNames: 'owner cart interface lastTimeUsed'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSession methodsFor: 'actions' stamp: 'na 7/22/2020 19:50:50'!
add: aQuantity of: aBook

	self assertSessionIsNotExpired.
	
	cart add: aQuantity of: aBook.
	lastTimeUsed := interface now.
	! !

!CartSession methodsFor: 'actions' stamp: 'na 7/22/2020 19:51:24'!
carContents

	self assertSessionIsNotExpired.

	^cart contents ! !

!CartSession methodsFor: 'actions' stamp: 'na 7/22/2020 19:53:18'!
checkout: aCartID creditCardNumber: aCreditCardNumber withExpiredDate: aCreditCardExpiredDate withOwner: aCreditCardOwner
	
	self assertSessionIsNotExpired.
	lastTimeUsed := interface now.
	
	^(Cashier toCheckout: cart 
				charging: (CreditCard createWithANumber: aCreditCardNumber thisDate: aCreditCardExpiredDate thisOwner: aCreditCardOwner)
				throught: interface merchantProcessor 
				on: interface now 
				registeringOn: interface salesBook) checkOut.
	
	
	
	! !


!CartSession methodsFor: 'accesing' stamp: 'na 7/22/2020 18:42:39'!
now
	
	^interface now
	! !


!CartSession methodsFor: 'asserts' stamp: 'na 7/22/2020 18:47:52'!
assertIsExpiredOn: aTime

	^(aTime - lastTimeUsed ) > interface sessionDuration.! !

!CartSession methodsFor: 'asserts' stamp: 'na 7/22/2020 19:50:50'!
assertSessionIsNotExpired

	^ (self assertIsExpiredOn: interface now) ifTrue: [self error: interface sessionHasExpiredErrorMessage]! !


!CartSession methodsFor: 'initialization' stamp: 'na 7/22/2020 18:35:59'!
initializeWith: anUser withCart: aCart onInterface: anInterfaceRest.

	owner := anUser.
	cart := aCart.
	interface := anInterfaceRest.
	
	lastTimeUsed := interface now.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: #TusLibros!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'instance creation' stamp: 'na 7/22/2020 18:35:03'!
by: anUser with: aCart withInterface: anInterfaceRest

	^self new initializeWith: anUser withCart: aCart onInterface: anInterfaceRest.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total sale'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'rjs 7/21/2020 19:00:21'!
registerSale

	salesBook add: sale! !


!Cashier methodsFor: 'checkout' stamp: 'rjs 7/21/2020 19:00:41'!
checkOut

	self createSale.

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 18:59:57'!
createSale

	| items |

	items := OrderedCollection  new.
	
	cart createSaleRow: [:anItem :aQuantity :aTotal | items add: (SaleRow item: anItem quantity: aQuantity total: aTotal) ].
	
	sale := Sale withCostumer: creditCard owner andItems: items.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'na 7/21/2020 14:54:01'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #Clock category: #TusLibros!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'action' stamp: 'na 7/22/2020 20:01:45'!
now

	^self subclassResponsibility ! !


!classDefinition: #ManualClock category: #TusLibros!
Clock subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ManualClock methodsFor: 'initialization' stamp: 'na 7/22/2020 17:29:49'!
initializeWithTime: aTime

	now := aTime.! !


!ManualClock methodsFor: 'accesing' stamp: 'na 7/22/2020 17:40:17'!
advanceTime: aTime

	now := now + aTime.! !

!ManualClock methodsFor: 'accesing' stamp: 'na 7/22/2020 18:13:47'!
now

	^now! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ManualClock class' category: #TusLibros!
ManualClock class
	instanceVariableNames: ''!

!ManualClock class methodsFor: 'instance creation' stamp: 'na 7/22/2020 17:29:03'!
at: aTime

	^self new initializeWithTime: aTime.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'owner number date limit amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'na 7/21/2020 14:54:01'!
isExpiredOn: today

	^  (today yearNumber > date yearNumber) or: [ (today yearNumber = date yearNumber) and:[ (today monthIndex > date monthIndex) ] ]! !


!CreditCard methodsFor: 'accesing' stamp: 'na 7/21/2020 14:44:27'!
date

	^ date! !

!CreditCard methodsFor: 'accesing' stamp: 'na 7/21/2020 14:44:38'!
number

	^ number! !

!CreditCard methodsFor: 'accesing' stamp: 'na 7/21/2020 14:45:05'!
owner

	^ owner! !


!CreditCard methodsFor: 'initialization' stamp: 'na 7/21/2020 14:44:14'!
initializeWithANumber: aNumber andADate: aDate andAnOwner: anOwner

	number := aNumber.
	date := aDate.
	owner := anOwner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'na 7/21/2020 14:46:56'!
createWithANumber: aNumber thisDate: aDate thisOwner: anOwner

	self checkName: anOwner.
	self checkNumber: aNumber.

	^ self new initializeWithANumber: aNumber andADate: aDate andAnOwner: anOwner.! !


!CreditCard class methodsFor: 'assertions' stamp: 'na 7/21/2020 14:46:33'!
checkName: anOwner

	(anOwner = ' ' ) ifTrue: [ ^ self error: self InvalidCardErrorDescription ]! !

!CreditCard class methodsFor: 'assertions' stamp: 'na 7/21/2020 14:46:43'!
checkNumber: aNumber.

	(aNumber size = 16) ifFalse: [ ^ self error: self InvalidCardErrorDescription ]! !


!CreditCard class methodsFor: 'error' stamp: 'na 7/21/2020 14:46:04'!
InvalidCardErrorDescription

 	^ 'Tarjeta invalida'! !


!classDefinition: #InterfaceRest category: #TusLibros!
Object subclass: #InterfaceRest
	instanceVariableNames: 'id autentificationSystem cartsSession catalog merchant salesBook transactionID clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceRest methodsFor: 'initialization' stamp: 'na 7/22/2020 18:54:46'!
initializeWith: anAutentificationSystem and: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook using: aClock

	autentificationSystem := anAutentificationSystem.
	id := 0.
	cartsSession := Dictionary new.
	catalog := aCatalog.
	merchant := aMP.
	salesBook := aSalesBook.
	transactionID := 0.
	clock := aClock.! !


!InterfaceRest methodsFor: 'accesing' stamp: 'na 7/22/2020 19:23:42'!
merchantProcessor

	^merchant ! !

!InterfaceRest methodsFor: 'accesing' stamp: 'na 7/22/2020 18:13:38'!
now

	^clock now.! !

!InterfaceRest methodsFor: 'accesing' stamp: 'na 7/22/2020 19:23:53'!
salesBook

	^salesBook ! !

!InterfaceRest methodsFor: 'accesing' stamp: 'na 7/22/2020 17:33:46'!
sessionDuration

	^30 minutes.! !


!InterfaceRest methodsFor: 'actions' stamp: 'na 7/22/2020 19:55:46'!
addBook: aBook quantity: aQuantity cart: aCartID

	| cartSession |
	
	cartSession := self assertTheSessionExistsInTheInterface: aCartID.
		
	cartSession add: aQuantity of: aBook.

	
	! !

!InterfaceRest methodsFor: 'actions' stamp: 'na 7/22/2020 19:56:09'!
checkout: aCartID creditCardNumber: aCreditCardNumber withExpiredDate: aCreditCardExpiredDate wihtOwner: aCreditCardOwner
	
	|cartSession |
	
	cartSession := self assertTheSessionExistsInTheInterface: aCartID.
	cartSession checkout: aCartID creditCardNumber: aCreditCardNumber withExpiredDate: aCreditCardExpiredDate withOwner: aCreditCardOwner.
	
	
	cartsSession removeKey: aCartID.
	transactionID := transactionID +1.
	^transactionID 
	! !

!InterfaceRest methodsFor: 'actions' stamp: 'na 7/22/2020 18:38:34'!
createCart: anUser with: aPassword
	
	| cartSession |
	
	autentificationSystem autentificateWith: anUser and: aPassword.
	
	id := id + 1.
	
	cartSession := CartSession by: anUser with: (Cart acceptingItemsOf: catalog) withInterface: self.
	cartsSession at: id put: cartSession.
	
	^ id.

	 ! !

!InterfaceRest methodsFor: 'actions' stamp: 'na 7/22/2020 19:56:27'!
listCart: aCartID
	
	^ (self assertTheSessionExistsInTheInterface: aCartID) carContents.

! !


!InterfaceRest methodsFor: 'asserts' stamp: 'na 7/22/2020 19:55:24'!
assertTheSessionExistsInTheInterface: aCartId

	^cartsSession at: aCartId ifAbsent: [ ^ self error: self class invalidCartIDErrorMessage ].	! !


!InterfaceRest methodsFor: 'listPurchases - auxiliaries' stamp: 'na 7/22/2020 16:16:26'!
defineResumeIn: book for: anItem withTotal: aTotal

	| newTotal |
	
	newTotal  := (book at: anItem ifAbsent: [0] ) + aTotal.
	book at: anItem put: newTotal.! !

!InterfaceRest methodsFor: 'listPurchases - auxiliaries' stamp: 'na 7/22/2020 17:10:37'!
listPurchasesFromUser: anUser andPass: aPassword

	" libro1 cantidad1 libron cantidadn TOTAL"

	| collection book |
	autentificationSystem autentificateWith: anUser and: aPassword.
	collection := salesBook select: [ :each | each belongsTo: anUser ].
	
	book := Dictionary  new.
	
	collection do: [ :aSale | aSale createListOfPurchases: [:anItem :aTotal | self defineResumeIn: book for: anItem  withTotal: aTotal ] ].
	
	^ book! !


!InterfaceRest methodsFor: 'error' stamp: 'na 7/22/2020 14:39:20'!
canNotChargeAnExpiredCreditCardErrorMessage

	^Cashier canNotChargeAnExpiredCreditCardErrorMessage! !

!InterfaceRest methodsFor: 'error' stamp: 'na 7/22/2020 15:02:10'!
cartCanNotBeEmptyErrorMessage
	
	^Cashier cartCanNotBeEmptyErrorMessage! !

!InterfaceRest methodsFor: 'error' stamp: 'na 7/22/2020 14:22:04'!
invalidItemErrorMessage
	^ Cart invalidItemErrorMessage.! !

!InterfaceRest methodsFor: 'error' stamp: 'na 7/22/2020 18:51:40'!
sessionHasExpiredErrorMessage
	
	^'La sesion ha expirado'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InterfaceRest class' category: #TusLibros!
InterfaceRest class
	instanceVariableNames: ''!

!InterfaceRest class methodsFor: 'error' stamp: 'na 7/22/2020 15:57:52'!
invalidCartIDErrorMessage
	^ 'Id inválido'! !

!InterfaceRest class methodsFor: 'error' stamp: 'na 7/22/2020 14:22:04'!
invalidItemErrorMessage
	^ ' No podes agregar un libro que no esta en el catalog a un changuito '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/16/2020 19:00:52'!
wrongIDErrorMessage
	^ ' usuario erroneo '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/16/2020 19:17:56'!
wrongPassErrorMessage
	^ ' Password erronea '! !


!InterfaceRest class methodsFor: 'initialization' stamp: 'na 7/22/2020 18:12:06'!
withAthoritationSystem: anAutentificationSystem withACatalog: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook using: aClock 

	^ self new initializeWith: anAutentificationSystem and: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook using: aClock.! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'owner items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'accesing' stamp: 'rjs 7/21/2020 19:58:50'!
belongsTo: anUser

	^ owner = anUser
! !

!Sale methodsFor: 'accesing' stamp: 'rjs 7/21/2020 20:15:39'!
createListOfPurchases: aBlock

	items do: [:each | aBlock value: each item value: each total].

! !

!Sale methodsFor: 'accesing' stamp: 'rjs 7/21/2020 19:27:05'!
owner

	^owner
! !

!Sale methodsFor: 'accesing' stamp: 'rjs 7/21/2020 19:03:13'!
total
	
	^ items inject: 0 into: [:sum :each | sum + each total].! !


!Sale methodsFor: 'initialization' stamp: 'rjs 7/21/2020 18:55:03'!
initializeWithCostumer: anOwner andItems: aListOfItems.

	owner := anOwner.
	items := aListOfItems.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'rjs 7/21/2020 18:54:07'!
withCostumer: anOwner andItems: aListOfItems.

	"should assert total is not negative or 0!!"
	^self new initializeWithCostumer: anOwner andItems: aListOfItems.! !


!classDefinition: #SaleRow category: #TusLibros!
Object subclass: #SaleRow
	instanceVariableNames: 'item quantity total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SaleRow methodsFor: 'initialization' stamp: 'rjs 7/21/2020 18:16:26'!
initializeItem: anItem quantity: anAmount total: aTotal.

	item := anItem.
	quantity := anAmount .
	total := aTotal.! !


!SaleRow methodsFor: 'accesing' stamp: 'rjs 7/21/2020 19:02:36'!
item

	^ item! !

!SaleRow methodsFor: 'accesing' stamp: 'rjs 7/21/2020 19:02:44'!
quantity

	^ quantity! !

!SaleRow methodsFor: 'accesing' stamp: 'rjs 7/21/2020 19:02:31'!
total

	^ total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SaleRow class' category: #TusLibros!
SaleRow class
	instanceVariableNames: ''!

!SaleRow class methodsFor: 'instance creator' stamp: 'rjs 7/21/2020 18:16:43'!
item: anItem quantity: anAmount total: aTotal

	^self new initializeItem: anItem quantity: anAmount total: aTotal.! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'na 7/22/2020 14:29:06'!
anotherItemSellByTheStore
	
	^ 'anotherValidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'na 7/22/2020 14:32:06'!
anotherItemSellByTheStorePrice
	
	^20! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'na 7/22/2020 14:31:50'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		at: self anotherItemSellByTheStore put: self anotherItemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'na 7/21/2020 16:26:25'!
expiredCreditCard
	
	^CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: today monthIndex year: today yearNumber - 1) thisOwner: 'Pepito'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'na 7/21/2020 16:26:31'!
notExpiredCreditCard
	
	^CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: today monthIndex year: today yearNumber + 1) thisOwner: 'Pepito'
	! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !
