!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'comparing' stamp: 'na 5/20/2020 18:03:31'!
thisStack: aStack isEqualTo: otherStack
	
	|bool|
	
	bool := true.
	
	(aStack size = otherStack size) ifFalse: [^false].
	
	[aStack isEmpty not] whileTrue: [bool := bool and:[aStack pop = otherStack pop]].
	
	^bool! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'na 5/20/2020 19:22:08'!
test01thePrefixCantBeEmpty

	|stack|
	
	stack := OOStack new.
	
	self 
	should: [SentenceFinderByPrefix in: stack withPrefix: ''] 
	raise: Error  
	withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix errorPrefixEmpty]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'na 5/20/2020 19:30:26'!
test02thePrefixCantBeAnEmptySpace

	|stack|
	
	stack := OOStack new.
	
	self 
	should: [SentenceFinderByPrefix in: stack withPrefix: ' '] 
	raise: Error  
	withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix errorPrefixWithSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'na 5/20/2020 19:30:53'!
test03thePrefixCantHaveEmptySpaces

	|stack|
	
	stack := OOStack new.
	
	self 
	should: [SentenceFinderByPrefix in: stack withPrefix: 'Oveja '] 
	raise: Error  
	withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix errorPrefixWithSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'na 5/20/2020 18:58:38'!
test04searchInAnEmptyStackResultInAEmptyCollection

	| stack collectionResult finder|
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix in: stack withPrefix: 'Nada'.
	
	collectionResult := finder find.

	self assert: collectionResult isEmpty ! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'na 5/20/2020 18:58:45'!
test05searchByPrefixWorksCorrectlyWithOutCaseSensitive

	| stack collectionResult finder |
	
	stack := OOStack new.
	stack push: 'Oveja'.
	stack push: 'Perro'.
	stack push: 'Ornitorrinco'.
	stack push: 'Ovejita'.
	finder := SentenceFinderByPrefix in: stack withPrefix: 'Ove'.
	
	collectionResult := finder find.

	self assert: collectionResult isEmpty not.
	self assert: collectionResult size = 2.
! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'na 5/20/2020 18:58:51'!
test06searchByPrefixWorksCorrectlyWithCaseSensitive

	| stack collectionResult finder |
	
	stack := OOStack new.
	stack push: 'Oveja'.
	stack push: 'Perro'.
	stack push: 'Ornitorrinco'.
	stack push: 'Ovejita'.
	
	finder := SentenceFinderByPrefix in: stack withPrefix: 'ove'.
	collectionResult := finder find.

	self assert: collectionResult isEmpty.

! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'na 5/20/2020 18:59:00'!
test07searchDoesNotModifyTheStack

	| stack stack2 collectionResult finder |
	
	stack := OOStack new.
	stack2 := OOStack new.
	stack push: 'dog'.
	stack push: 'cat'.
	stack push: 'chiken'.
	stack2 push: 'dog'.
	stack2 push: 'cat'.
	stack2 push: 'chiken'.
	
	finder := SentenceFinderByPrefix in: stack withPrefix: 'cat'.
	collectionResult := finder find.

	self assert: collectionResult isEmpty not.
	self assert: (self thisStack: stack isEqualTo: stack2).

! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'na 5/18/2020 18:44:12'!
initialize

	elements := OrderedCollection new.! !


!OOStack methodsFor: 'state' stamp: 'na 5/14/2020 23:50:46'!
isEmpty

	^elements isEmpty.! !

!OOStack methodsFor: 'state' stamp: 'na 5/15/2020 00:11:50'!
size

	^elements size.! !

!OOStack methodsFor: 'state' stamp: 'rjs 5/18/2020 21:39:10'!
state 

	^OOStackState new: self! !


!OOStack methodsFor: 'operations - private' stamp: 'na 5/18/2020 18:56:35'!
canPop

	^elements removeFirst.! !

!OOStack methodsFor: 'operations - private' stamp: 'na 5/18/2020 18:57:58'!
canTop
	
	^elements at:1! !

!OOStack methodsFor: 'operations - private' stamp: 'na 5/18/2020 18:55:37'!
cantPop

	^self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'operations - private' stamp: 'na 5/18/2020 18:57:46'!
cantTop
	
	^self error: self class stackEmptyErrorDescription ! !


!OOStack methodsFor: 'operations' stamp: 'na 5/18/2020 18:47:44'!
pop
	
	^self state pop
	
	! !

!OOStack methodsFor: 'operations' stamp: 'na 5/15/2020 00:01:18'!
push: anElement

	elements addFirst: anElement.
	! !

!OOStack methodsFor: 'operations' stamp: 'na 5/18/2020 18:57:03'!
top

	^self state top! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'initialization' stamp: 'na 5/18/2020 18:44:01'!
new
	
	^self basicNew initialize! !


!classDefinition: #OOStackState category: #'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'operations' stamp: 'na 5/18/2020 18:53:43'!
pop
	
	^self subclassResponsibility ! !

!OOStackState methodsFor: 'operations' stamp: 'na 5/18/2020 19:02:16'!
top
	
	^self subclassResponsibility ! !


!OOStackState methodsFor: 'initialization' stamp: 'na 5/20/2020 18:12:29'!
initializeWith: aStack
	
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'initialization' stamp: 'na 5/18/2020 19:03:18'!
for: aStack

	^self subclassResponsibility ! !

!OOStackState class methodsFor: 'initialization' stamp: 'na 5/20/2020 18:13:59'!
new: aStack

	^(self subclasses detect: [:aStateClass | aStateClass isEmpty = aStack isEmpty]) for: aStack! !


!classDefinition: #OOStackEmpty category: #'Stack-Exercise'!
OOStackState subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'operations' stamp: 'na 5/18/2020 18:57:11'!
pop

	^stack cantPop

	! !

!OOStackEmpty methodsFor: 'operations' stamp: 'na 5/18/2020 19:01:56'!
top

	^stack cantTop	! !


!OOStackEmpty methodsFor: 'initialization' stamp: 'na 5/20/2020 18:11:01'!
initializeWith: aStack
	
	stack := aStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: #'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'initialization' stamp: 'na 5/18/2020 18:51:15'!
for: aStack

	^self basicNew initializeWith: aStack! !


!OOStackEmpty class methodsFor: 'state' stamp: 'na 5/20/2020 18:13:19'!
isEmpty

	^true! !


!classDefinition: #OOStackNotEmpty category: #'Stack-Exercise'!
OOStackState subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'operations' stamp: 'na 5/18/2020 18:56:09'!
pop

	^stack canPop! !

!OOStackNotEmpty methodsFor: 'operations' stamp: 'na 5/18/2020 19:00:28'!
top

	^stack canTop! !


!OOStackNotEmpty methodsFor: 'initialization' stamp: 'na 5/20/2020 18:11:06'!
initializeWith: aStack
	
	stack := aStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmpty class' category: #'Stack-Exercise'!
OOStackNotEmpty class
	instanceVariableNames: ''!

!OOStackNotEmpty class methodsFor: 'state' stamp: 'na 5/20/2020 18:13:50'!
isEmpty

	^false! !


!OOStackNotEmpty class methodsFor: 'initialization' stamp: 'na 5/18/2020 18:51:21'!
for: aStack

	^self basicNew initializeWith: aStack! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack2 prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'finder - auxiliaries' stamp: 'na 5/20/2020 18:56:55'!
moveTheElementsFromACollectionToTheStack: aCollection.

	[aCollection isEmpty not ] whileTrue: [ stack2 push: aCollection removeLast ].! !

!SentenceFinderByPrefix methodsFor: 'finder - auxiliaries' stamp: 'na 5/20/2020 18:49:45'!
moveTheElementsInTheStackToACollection
	
	|collection|
	
	collection := OrderedCollection new.
	
	[stack2 isEmpty not ] whileTrue: [ collection add: stack2 pop ].
	
	^collection! !


!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'na 5/20/2020 18:57:58'!
find

	| collectionAux collectionResult |
	
	collectionAux := OrderedCollection new.

	collectionAux := self moveTheElementsInTheStackToACollection.
	
	collectionResult  := collectionAux select: [:anElement | anElement  beginsWith: prefix ].
	
	self moveTheElementsFromACollectionToTheStack: collectionAux .
	
	^ collectionResult 
	
	

! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'na 5/20/2020 18:31:41'!
initializeWith: aStack andAPrefix: aPrefix
	
	stack2 := aStack.
	prefix := aPrefix ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'na 5/20/2020 18:36:27'!
errorPrefixEmpty

	^'El prefijo está vació'! !

!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'na 5/20/2020 18:38:33'!
errorPrefixWithSpaces

	^'El prefijo tiene espacios'! !


!SentenceFinderByPrefix class methodsFor: 'testing' stamp: 'na 5/20/2020 19:32:44'!
prefixNotEmpty: aPrefix

	(aPrefix = '') ifTrue: [^self error: self errorPrefixEmpty].! !

!SentenceFinderByPrefix class methodsFor: 'testing' stamp: 'na 5/20/2020 19:32:09'!
prefixWithOutSpaces: aPrefix

	(aPrefix includes: $ ) ifTrue: [^self error: self errorPrefixWithSpaces ].! !


!SentenceFinderByPrefix class methodsFor: 'initialization' stamp: 'na 5/20/2020 19:33:11'!
in: aStack withPrefix: aPrefix
	
	self prefixNotEmpty: aPrefix.
	self prefixWithOutSpaces: aPrefix.
	
	^ self basicNew initializeWith: aStack andAPrefix: aPrefix.! !
