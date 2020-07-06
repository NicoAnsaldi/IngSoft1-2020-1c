!classDefinition: #CartTest category: #TusLibrosDotCom!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosDotCom'!

!CartTest methodsFor: 'auxiliaries' stamp: 'na 7/6/2020 10:23:56'!
anotherValidBook

	^ 'Another valid Book'! !

!CartTest methodsFor: 'auxiliaries' stamp: 'na 7/6/2020 10:23:40'!
catalog

	^OrderedCollection newFrom: {'A valid Book'. 'Another valid Book'}.! !

!CartTest methodsFor: 'auxiliaries' stamp: 'na 7/6/2020 10:13:03'!
invalidBook

	^ 'a Invalid Book'! !

!CartTest methodsFor: 'auxiliaries' stamp: 'na 7/6/2020 10:03:30'!
validBook

	^ 'A valid Book'! !


!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 10:03:19'!
test01WhenCreateACartItsEmpty
	
	|cart|

	cart := Cart with: self catalog.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 10:03:30'!
test02ACartIsNotEmptyWhenAddABook

	|cart|
	
	cart := Cart with: self catalog.
	
	cart add: self validBook.
	
	self deny: cart isEmpty.
	 ! !

!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 10:13:03'!
test03CartCantAddAnInvalidBook

	|cart aCatalog|
	
	aCatalog := OrderedCollection newFrom: {'a Valid Book'}.
	cart := Cart with: aCatalog.
	
	self should: [cart add: self invalidBook] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | self assert: anError messageText = cart class InvalidBookErrorMessage.
									 self assert: cart isEmpty.]! !

!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 10:03:30'!
test04CartCanAddManyCopiesOfAValidBook

	|cart|
	
	cart := Cart with: self catalog.
	cart add: 3 copiesOfThisBook: self validBook.
	
	self deny: cart isEmpty.
	self assert: cart includes: self validBook.
	self assert: (cart quantityOf: self validBook) equals: 3.! !

!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 10:05:07'!
test05CantAddNonPositiveCopiesOfABook
	
	|cart|
	
	cart := Cart with: self catalog.
	
	self should: [cart add: 0 copiesOfThisBook: self validBook] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | anError messageText = cart class InvalidQuantityErrorMessage.
									self assert: cart isEmpty.]
	! !

!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 10:13:30'!
test06CantAddManyCopiesOfABookThatDoesntExistsInTheCatalog
	
	|cart|
	
	cart := Cart with: self catalog.
	
	self should: [cart add: 2 copiesOfThisBook: self invalidBook] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | anError messageText = cart class InvalidBookErrorMessage.
									self assert: cart isEmpty.]
	! !

!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 10:22:43'!
test07CartNotHaveABookThatItDidntAddBefore
	
	|cart aBook|
	
	cart := Cart with: self catalog.
	aBook := 'a particular book'.
	
	self assert: cart isEmpty.
	self deny: (cart includes: aBook).
	self assert: (cart quantityOf: aBook) equals: 0.
	! !

!CartTest methodsFor: 'test' stamp: 'na 7/6/2020 11:07:59'!
test08CartListItsElementsWell
	
	|cart|
	
	cart := Cart with: self catalog.
	cart add: 3 copiesOfThisBook: self validBook.
	cart add: 2 copiesOfThisBook: self anotherValidBook.
	
	self assert: cart list equals: '(',
									'''',self validBook,'''->', (cart quantityOf: self validBook) asString, 
									' ''',self anotherValidBook ,'''->', (cart quantityOf: self anotherValidBook ) asString,
									' )'. ! !


!classDefinition: #Cart category: #TusLibrosDotCom!
Object subclass: #Cart
	instanceVariableNames: 'container catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosDotCom'!

!Cart methodsFor: 'asserts' stamp: 'na 7/6/2020 10:14:49'!
assertPositiveQuantity: aQuantity

	aQuantity <= 0 ifTrue: [^self error: self class InvalidQuantityErrorMessage].! !

!Cart methodsFor: 'asserts' stamp: 'na 7/6/2020 10:16:00'!
assertTheBookExistsInTheCatalog: aBook

	(catalog includes: aBook) ifFalse: [^self error: self class InvalidBookErrorMessage].! !


!Cart methodsFor: 'adding' stamp: 'na 7/6/2020 10:16:34'!
add: aBook 
	
	self add: 1 copiesOfThisBook: aBook.! !

!Cart methodsFor: 'adding' stamp: 'na 7/6/2020 10:16:21'!
add: aQuantity copiesOfThisBook: aBook 
	
	self assertPositiveQuantity: aQuantity.
	self assertTheBookExistsInTheCatalog: aBook.
	
	container at: aBook put: aQuantity.! !


!Cart methodsFor: 'initialization' stamp: 'na 7/6/2020 09:17:13'!
initializeWith: aCatalog 
	
	catalog := aCatalog.
	container := Dictionary new.! !


!Cart methodsFor: 'accessing' stamp: 'na 7/6/2020 09:44:42'!
includes: aBook 
	
	^container includesKey: aBook.! !

!Cart methodsFor: 'accessing' stamp: 'na 7/6/2020 08:27:40'!
isEmpty
	
	^container isEmpty.! !

!Cart methodsFor: 'accessing' stamp: 'na 7/6/2020 10:58:21'!
list
	
	|stream|
	
	stream := ReadWriteStream on: String new.
	
	container printElementsOn: stream.
	
	^stream contents.! !

!Cart methodsFor: 'accessing' stamp: 'na 7/6/2020 09:50:00'!
quantityOf: aBook

	^container at: aBook ifAbsent: [0]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibrosDotCom!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'na 7/6/2020 08:40:12'!
with: aCatalog
	
	^self new initializeWith: aCatalog. ! !


!Cart class methodsFor: 'errors' stamp: 'na 7/6/2020 08:47:02'!
InvalidBookErrorMessage

	^'Ese libro no está en el catálogo'.! !

!Cart class methodsFor: 'errors' stamp: 'na 7/6/2020 10:09:24'!
InvalidQuantityErrorMessage

	^'No podes agregar un libro con cantidad no positiva'.! !
