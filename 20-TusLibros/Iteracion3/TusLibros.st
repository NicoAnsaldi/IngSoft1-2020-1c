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

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'na 7/21/2020 14:42:29'!
test01CreateCreditCard

	| visa |

	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepito'.

	self assert: visa number equals: '1234567891234567'.
	self assert: visa date equals: (Month month: 2 year: 2020).
	self assert: visa owner equals: 'Pepito'! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'na 7/21/2020 14:42:52'!
test02ValidNumber

	self
	should: [ CreditCard createWithANumber: '123456789123456' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepe' .]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'na 7/21/2020 14:43:04'!
test03ValidOwner

	self
	should: [ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: ' ' ]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'na 7/21/2020 14:54:01'!
test04isExpired

	| today visa |
	
	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepito'.

	today := DateAndTime now.
	
	self assert: (visa isExpiredOn: today)! !


!classDefinition: #InterfaceRestTest category: #TusLibros!
TestCase subclass: #InterfaceRestTest
	instanceVariableNames: 'testObjectsFactory debitBehavior autSystem objectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/16/2020 19:09:22'!
autentificateWith: anID and: aPassword

	^ autSystem value: anID value: aPassword.! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 13:58:42'!
autentificationSystem

	^self! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 13:58:29'!
createInterfaceRest

	^ InterfaceRest with: self autentificationSystem aCatalog: objectFactory defaultCatalog aMerchantProcessor: self merchantProcessor andASalesBook:  OrderedCollection new.! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 16:41:35'!
creditCardDate

	^(Month month: (DateAndTime now) monthIndex year: (DateAndTime now) yearNumber + 1)! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/21/2020 19:25:53'!
debit: anAmount from: aCreditCard 

	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 13:58:59'!
merchantProcessor

	^self! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/21/2020 17:37:43'!
test01CanCreateACartWithAValidUserAndAValidPass

	|  interface cartID |

	autSystem := [ :ID :Pass | ].
	interface := self createInterfaceRest.
	cartID := interface createCart: '1234' with: 'hola1234'.
	
	self assert: ((interface listCart: cartID) isEmpty)

! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:01:55'!
test02CanNotCreateACartWithInvalidUser

	|  interface |

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongIDErrorMessage].
	interface := self createInterfaceRest.
	
	self 
		should: [ interface createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongIDErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:02:03'!
test03CanNotCreateACartWithInvalidPass

	|  interface |

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongPassErrorMessage].
	interface := self createInterfaceRest .
	
	self 
		should: [ interface createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongPassErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:26:54'!
test04CreateCartReturnsAnId
	|  interface cartId|

	interface := self createInterfaceRest.
	
	self 
		shouldnt: [cartId :=interface createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood.

	self assert: (cartId = nil) not.
	
	
	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:27:53'!
test05DifferentCartsReturnDifferentIds

	|  interface cartId1 cartId2 cartId3 |

	interface := self createInterfaceRest.
	cartId1 := interface createCart: 'L' with: '678'.
	cartId2 := interface createCart: 'N' with: '123'.
	cartId3 := interface createCart: 'R' with: '454'.
	
	self assert: ((cartId1 = cartId2) not).
	self assert: ((cartId2 = cartId3) not).
	self assert: ((cartId1 = cartId3) not).
	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/21/2020 19:23:22'!
test06CanAddBooksToAValidCart

	|  interface cartID collection |

	interface := self createInterfaceRest.
	cartID := interface createCart: '1234' with: 'hola1234'.
	
	interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	
	collection := interface listCart: cartID.
	
	
	self assert: ((interface listCart: cartID) includes: objectFactory itemSellByTheStore).
	self assert: ((interface listCart: cartID) occurrencesOf: objectFactory itemSellByTheStore) equals: 1
	



	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:05:29'!
test07CanNotAddItemToNotCreatedCart

	|  interface  |

	interface := self createInterfaceRest .
		

	self 
		should: [ interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: 3. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest CanNotAddBookToNotCreatedCartErrorMessage.]
	


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:05:39'!
test08CanNotAddItemNotSellByTheStore

	|  interface  cartID |

	interface := self createInterfaceRest .
	cartID := interface createCart: '1234' with: 'hola1234'.
		

	self 
		should: [ interface addBook: objectFactory itemNotSellByTheStore quantity: 1 cart: cartID. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest CanNotAddBookNotInCatalogToCartErrorMessage.]
	
	"es necesario hacer este test?, porque, cart ya tiene el mismo?"
	
	


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:29:05'!
test09ListCartOfAnEmptyCartIsEmpty
	
	|  interface cartID |

	interface := self createInterfaceRest .
	cartID := interface createCart: '1234' with: 'hola1234'.
		
	self assert: ((interface listCart: cartID) isEmpty).


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:29:27'!
test10CanNotListCartOfNotCreatedCart

	|  interface  |

	interface := self createInterfaceRest .
		

	self 
		should: [ interface listCart: 3. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest CanNotListANotCreatedCartErrorMessage.]

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:30:09'!
test11ListCartReturnsTheRightNumberOfItems

	|  interface cartID |

	interface := self createInterfaceRest .
	cartID := interface createCart: '1234' with: 'hola1234'.
	
	interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	interface addBook: objectFactory itemSellByTheStore quantity: 10 cart: cartID.
	interface addBook: objectFactory itemSellByTheStore quantity: 12 cart: cartID.
	
	
	self assert: ((interface listCart: cartID) includes: objectFactory itemSellByTheStore).
	self assert: ((interface listCart: cartID) occurrencesOf: objectFactory itemSellByTheStore) equals: 23

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/21/2020 20:20:21'!
test12CanCheckoutACart

	|  interface cartID purchases|

	interface := self createInterfaceRest .
	cartID := interface createCart: 'Pepito' with: 'hola1234'.
	interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	
	interface checkout: cartID 
				creditCardNumber: self validCreditCardNumber 
				withExpiredDate: self creditCardDate 
				wihtOwner: self creditCardOwner.
				
	purchases := interface listPurchasesFromUser: 'Pepito' andPass: 'hola1234'.
	
	
	self assert: (purchases includesKey: objectFactory itemSellByTheStore).
	self assert: (purchases at: objectFactory itemSellByTheStore) equals: 10.


	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 16:50:53'!
test13CanNotCheckoutWithAnExpiredCard

	'Es necesario?, lo resuelve el cashier'! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 16:51:53'!
test14CanNotCheckoutAnEmptyCart

	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:36:21'!
test15CanNotCheckoutACartUsingAnInvalidCard

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:36:32'!
test16CanNotCheckoutANotCreatedCart

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'na 7/21/2020 14:36:44'!
test17CanNotDoOperationsOnACheckoutACart

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/21/2020 20:21:26'!
test20ListPurchasesOfEmptyCartIsEmpty


	



	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:09'!
test21CanListPurchasesOfOneUserCart

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:04'!
test22CanListPurchasesOfManyUserCarts

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:29:50'!
test23CanListPurchasesOfTwoDifferentChekoutCarts

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:29'!
test24CantListPurchasesOfAnInvalidUserName

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:24'!
test25CantListPurchasesOfAValidUserNameWithInvalidPassword

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/21/2020 17:41:15'!
validCreditCardNumber

	^'1234567891234567'! !


!InterfaceRestTest methodsFor: 'setUp' stamp: 'na 7/21/2020 14:50:02'!
creditCardOwner

	^'Pepito'! !

!InterfaceRestTest methodsFor: 'setUp' stamp: 'rjs 7/16/2020 20:19:50'!
setUp

	autSystem := [ :ID :Pass | ].
	objectFactory := StoreTestObjectsFactory new.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

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


!Cart methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 18:55:42'!
createSaleRow: aBlock

	items keysDo: [ :each | aBlock value: each value: (items at: each)  value: (items at: each)*(catalog at: each)]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


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
	instanceVariableNames: 'id autentificationSystem carts catalog merchant salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceRest methodsFor: 'initialization' stamp: 'rjs 7/21/2020 17:43:45'!
initializeWith: anAutentificationSystem and: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook

	autentificationSystem := anAutentificationSystem.
	id := 0.
	carts := Dictionary new.
	catalog := aCatalog.
	merchant := aMP.
	salesBook := aSalesBook.! !


!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/20/2020 20:29:57'!
addBook: aBook quantity: aQuantity cart: aCartID

	| cart |
	
	(catalog includesKey: aBook) ifFalse: [^ self error: self class CanNotAddBookNotInCatalogToCartErrorMessage ].
	cart := carts at: aCartID ifAbsent: [ ^ self error: self class CanNotAddBookToNotCreatedCartErrorMessage ].
		
	cart add: aQuantity of: aBook.

	
	! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 17:47:14'!
checkout: aCartID creditCardNumber: aCreditCardNumber withExpiredDate: aCreditCardExpiredDate wihtOwner: aCreditCardOwner
	
	|cart creditCard cashier|
	
	cart := carts at: aCartID.
	creditCard := CreditCard createWithANumber: aCreditCardNumber thisDate: aCreditCardExpiredDate thisOwner: aCreditCardOwner.
	
	cashier := Cashier toCheckout: cart charging: creditCard throught: merchant on: (DateAndTime now) registeringOn: salesBook.
	
	^ cashier checkOut ! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/20/2020 20:08:51'!
createCart: anID with: aPassword
	
	| cart |
	
	autentificationSystem autentificateWith: anID and: aPassword.
	
	id := id + 1.
	
	cart := Cart acceptingItemsOf: catalog.
	carts at: id put: cart.
	
	^ id.

	 ! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 20:13:32'!
defineResumeIn: book with: anItem and: aTotal

	| newTotal |
	
	newTotal  := (book at: anItem ifAbsent: [0] ) + aTotal.
	book at: anItem put: newTotal.! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/20/2020 20:38:40'!
listCart: aCartID
	
	^ (carts at: aCartID ifAbsent: [ ^ self error: self class CanNotListANotCreatedCartErrorMessage ]) contents.

! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 20:16:38'!
listPurchasesFromUser: anUser andPass: aPassWord

	" libro1 cantidad1 libron cantidadn TOTAL"

	| collection book |
	
	collection := salesBook select: [ :each | each belongsTo: anUser ].
	
	book := Dictionary  new.
	
	collection do: [ :aSale | aSale createListOfPurchases: [:anItem :aTotal | self defineResumeIn: book with: anItem and: aTotal ] ].
	
	^ book! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InterfaceRest class' category: #TusLibros!
InterfaceRest class
	instanceVariableNames: ''!

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/20/2020 20:20:43'!
CanNotAddBookNotInCatalogToCartErrorMessage
	^ ' No podes agregar un libro que no esta en el catalog a un changuito '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/20/2020 20:17:06'!
CanNotAddBookToNotCreatedCartErrorMessage
	^ ' No podes agregar un libro a un changuito no creado '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/20/2020 20:37:35'!
CanNotListANotCreatedCartErrorMessage
	^ ' No podes listar un carrito no creado '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/16/2020 19:00:52'!
wrongIDErrorMessage
	^ ' usuario erroneo '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/16/2020 19:17:56'!
wrongPassErrorMessage
	^ ' Password erronea '! !


!InterfaceRest class methodsFor: 'initialization' stamp: 'rjs 7/20/2020 20:52:44'!
with: anAutentificationSystem aCatalog: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook

	^ self new initializeWith: anAutentificationSystem and: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook.! !


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

!Sale methodsFor: 'total' stamp: 'rjs 7/21/2020 19:03:13'!
total
	
	^ items inject: 0 into: [:sum :each | sum + each total].! !


!Sale methodsFor: 'initialization' stamp: 'rjs 7/21/2020 19:58:50'!
belongsTo: anUser

	^ owner = anUser
! !

!Sale methodsFor: 'initialization' stamp: 'rjs 7/21/2020 18:55:03'!
initializeWithCostumer: anOwner andItems: aListOfItems.

	owner := anOwner.
	items := aListOfItems.! !

!Sale methodsFor: 'initialization' stamp: 'rjs 7/21/2020 19:27:05'!
owner

	^owner
! !


!Sale methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 20:15:39'!
createListOfPurchases: aBlock

	items do: [:each | aBlock value: each item value: each total].

! !

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

!SaleRow methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 18:16:26'!
initializeItem: anItem quantity: anAmount total: aTotal.

	item := anItem.
	quantity := anAmount .
	total := aTotal.! !

!SaleRow methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 19:02:36'!
item

	^ item! !

!SaleRow methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 19:02:44'!
quantity

	^ quantity! !

!SaleRow methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 19:02:31'!
total

	^ total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SaleRow class' category: #TusLibros!
SaleRow class
	instanceVariableNames: ''!

!SaleRow class methodsFor: 'as yet unclassified' stamp: 'rjs 7/21/2020 18:16:43'!
item: anItem quantity: anAmount total: aTotal

	^self new initializeItem: anItem quantity: anAmount total: aTotal.! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

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

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
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
