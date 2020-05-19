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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:43:02'!
test01FindDeVaciaDevuelveVacia

	| stack colectionPrueba aux|
	
	stack := OOStack new.
	aux := SentenceFinderByPrefix new.
	
	colectionPrueba := aux SentenceFinderByPrefix: stack with: 'Nada'.

	self assert: colectionPrueba isEmpty ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:35:47'!
test02FindEncuentraElElemento

	| stack colectionPrueba aux |
	
	stack := OOStack new.
	aux := SentenceFinderByPrefix new.
	stack push: 'Oveja'.
	stack push: 'Perro'.
	stack push: 'Ornitorrinco'.
	stack push: 'Ovejita'.
	
	colectionPrueba := aux SentenceFinderByPrefix: stack with: 'Ove'.

	self assert: colectionPrueba isEmpty not.
	self assert: colectionPrueba size = 2.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:36:42'!
test03FindEsCaseSensitive

	| stack colectionPrueba aux |
	
	stack := OOStack new.
	aux := SentenceFinderByPrefix new.
	stack push: 'Oveja'.
	stack push: 'Perro'.
	stack push: 'Ornitorrinco'.
	stack push: 'Ovejita'.
	
	colectionPrueba := aux SentenceFinderByPrefix: stack with: 'ove'.

	self assert: colectionPrueba isEmpty.

! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:38:10'!
test04LaCatedra

	| stack colectionPrueba aux |
	
	stack := OOStack new.
	aux := SentenceFinderByPrefix new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	colectionPrueba := aux SentenceFinderByPrefix: stack with: 'Wint'.

	self assert: colectionPrueba isEmpty not.
	self assert: colectionPrueba size = 1.

! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:55:47'!
test05HagoFindYSonIguales

	| stack stack2 colectionPrueba aux |
	
	stack := OOStack new.
	stack2 := OOStack new.
	aux := SentenceFinderByPrefix new.
	stack push: 'dog'.
	stack push: 'cat'.
	stack push: 'chiken'.
	stack2 push: 'dog'.
	stack2 push: 'cat'.
	stack2 push: 'chiken'.
	
	colectionPrueba := aux SentenceFinderByPrefix: stack with: 'cat'.

	self assert: colectionPrueba isEmpty not.
	self assert: (self thisStack: stack isEqualTo: stack2).

! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:56:47'!
thisStack: aStack isEqualTo: otherStack
	
	^ 'RINALDIIII '! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:56:35'!
canPop

	^elements removeFirst.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:58'!
canTop
	
	^elements at:1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:55:37'!
cantPop

	^self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:46'!
cantTop
	
	^self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:44:12'!
initialize

	elements := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/14/2020 23:50:46'!
isEmpty

	^elements isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:47:44'!
pop
	
	^self state pop
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/15/2020 00:01:18'!
push: anElement

	elements addFirst: anElement.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/15/2020 00:11:50'!
size

	^elements size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:39:10'!
state 

	^OOStackState new: self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:03'!
top

	^self state top! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'na 5/18/2020 18:44:01'!
new
	
	^self basicNew initialize! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: #'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:02:50'!
initializeWith: aStack
	
	stack := aStack! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:53:43'!
pop
	
	^self subclassResponsibility ! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:02:16'!
top
	
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:03:18'!
for: aStack

	^self subclassResponsibility ! !

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:50:38'!
new: aStack

	^(self subclasses detect: [:aStateClass | aStateClass state = aStack isEmpty]) for: aStack! !


!classDefinition: #OOStackEmpty category: #'Stack-Exercise'!
OOStackState subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:11'!
pop

	^stack cantPop

	! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:01:56'!
top

	^stack cantTop	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: #'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:51:15'!
for: aStack

	^self basicNew initializeWith: aStack! !

!OOStackEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:51:44'!
state

	^true! !


!classDefinition: #OOStackNotEmpty category: #'Stack-Exercise'!
OOStackState subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:56:09'!
pop

	^stack canPop! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:00:28'!
top

	^stack canTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmpty class' category: #'Stack-Exercise'!
OOStackNotEmpty class
	instanceVariableNames: ''!

!OOStackNotEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:51:21'!
for: aStack

	^self basicNew initializeWith: aStack! !

!OOStackNotEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:52:06'!
state

	^false! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:10:08'!
SentenceFinderByPrefix: stack with: aPrefix

	| newColection newColection2 |
	
	newColection := OrderedCollection new.

	[stack isEmpty not ] whileTrue: [ newColection add: stack pop ].
	
	newColection2  := newColection select: [:anElement | anElement  beginsWith: aPrefix ].
	
	[newColection isEmpty not ] whileTrue: [ stack push: newColection removeLast ].
	
	^ newColection2 
	
	

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'rjs 5/18/2020 21:18:00'!
new
	
	^ self basicNew ! !
