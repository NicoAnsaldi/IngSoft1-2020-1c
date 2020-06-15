!classDefinition: #TestTerniLapilli category: #TerniLapilliExercise!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 16:17:10'!
test01StartsGameWithEmptyBoardAndMovesX

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
		self assert: juegoNuevo isPlaying equals: 'X'.
		self assert: juegoNuevo hasntFinishedYet equals: true.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:38:41'!
test02PlayerXMadeAMove

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
		self assert: juegoNuevo isPlaying equals: 'O'.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:38:48'!
test03XPlayedNowPlaysO
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
		self assert: juegoNuevo isPlaying equals: 'X'.
! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:58:03'!
test04OCanNotPutAMarkInAXMarksPlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putOat: 1 @ 1. ]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:58:58'!
test05XCanNotPutAMarkInAOMarksPlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:06:46'!
test06CoordinateYCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 10.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:06:56'!
test07CoordinateYCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 0.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:07:06'!
test08CoordinateXCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 10 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:07:17'!
test09CoordinateXCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 0 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:39:48'!
test10XCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:09:30'!
test11OCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self
		should: [ juegoNuevo putOat: 1 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:13:17'!
test12XCanNotPlayFourMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo putXat: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:13:32'!
test13XCanNotMoveAMarkBeforePlacingThree
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidLessNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:15:42'!
test14OCanNotMoveAMarkBeforePlacingThree
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo moveOMarkAt: 1 @ 2 to: 2 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli invalidLessNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:21:01'!
test15XCanNotMoveAMarkOutOfBoard
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 3 to: 1 @ 4.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 13:20:07'!
test16OCanNotMoveAMarkOutOfBoard
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo moveOMarkAt: 3 @ 2 to: 4 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}). 
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 14:04:53'!
test17XCanNotMoveAMarkMoreThanOnePlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 3 to: 3 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 15:18:37'!
test18OCanNotMoveAMarkMoreThanOnePlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo moveOMarkAt: 2 @ 1 to: 2 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 14:06:16'!
test19XCanOnlyMoveHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 2 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli MarkMoveErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 15:24:18'!
test20OCanOnlyMoveHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo moveOMarkAt: 1 @ 3 to: 2 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli MarkMoveErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 16:26:38'!
test21XCanMoveOnlyInHisTurn
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 3 to: 2 @ 3. ]
		raise: Error
		withMessageText: [ 	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2.}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 16:26:57'!
test22OCanMoveOnlyInHisTurn
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveOMarkAt: 2 @ 1 to: 2 @ 2. ]
		raise: Error
		withMessageText: [ 	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 15:36:48'!
test23XCanMovedOneOfHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		juegoNuevo moveXMarkAt: 1 @ 3 to: 2 @ 3.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 3 @ 3. 2 @ 3}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
		self assert: juegoNuevo isPlaying equals: 'O'.
		! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 16:08:17'!
test24OCanMovedOneOfHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 3 to: 2 @ 3.
		juegoNuevo moveOMarkAt: 2 @ 1 to: 2 @ 2. 
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 3 @ 3. 2 @ 3}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 2}).
		self assert: juegoNuevo isPlaying equals: 'X'.! !


!classDefinition: #TerniLapilli category: #TerniLapilliExercise!
Object subclass: #TerniLapilli
	instanceVariableNames: 'Xmarks Omarks playerTurn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:18:07'!
addMarkFromPlayerOAt: aPosition

	Omarks add: aPosition.
	playerTurn := PuttingX new: self.
	Omarks size = 3 ifTrue: [playerTurn := MovingX new: self]! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:15:46'!
addMarkFromPlayerXAt: aPosition

	Xmarks add: aPosition.
	playerTurn := PuttingO new: self.! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:32:26'!
putOat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putOat: aPosition
	
	

	! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:32:32'!
putXat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putXat: aPosition! !


!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 12:36:59'!
moveMark: aMark FromPlayerOAt: aPosition

	(Omarks includes: aMark) ifFalse: [^self error: self class MarkMoveErrorDescription].
	Omarks remove: aMark.
	Omarks add: aPosition.
	playerTurn := MovingX new: self.
! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 12:37:06'!
moveMark: aMark FromPlayerXAt: aPosition

	(Xmarks includes: aMark) ifFalse: [^self error: self class MarkMoveErrorDescription].
	Xmarks remove: aMark.
	Xmarks add: aPosition.
	playerTurn := MovingO new: self.! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 12:36:50'!
moveOMarkAt: aMark to: aPosition

	self checkIfItIsAValidPosition: aPosition.
	self checkIfThisPosition: aPosition isAdyacentToThisMark: aMark.
	
	^ playerTurn moveOMarkAt: aMark to: aPosition.

! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 12:30:36'!
moveXMarkAt: aMark to: aPosition

	self checkIfItIsAValidPosition: aPosition.
	self checkIfThisPosition: aPosition isAdyacentToThisMark: aMark.
	
	^ playerTurn moveXMarkAt: aMark to: aPosition.! !


!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/11/2020 20:14:22'!
hasntFinishedYet
	^ true! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/12/2020 19:36:20'!
isPlaying
	^ playerTurn whoIsPlaying! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/13/2020 19:51:50'!
visualizeOMarks
	
	^ Omarks copy
	! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/13/2020 19:44:22'!
visualizeXMarks
	
	^ Xmarks copy
	! !


!TerniLapilli methodsFor: 'asserts' stamp: 'rjs 6/13/2020 18:52:26'!
checkIfItIsAValidPosition: aPosition

	(aPosition y > 3 or: [aPosition y < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	(aPosition x > 3 or: [aPosition x < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	
	((Omarks includes: aPosition) or: [Xmarks includes: aPosition]) ifTrue: [^ self error: self class InvalidMarkPlaceErrorDescription].
	
	^ true! !

!TerniLapilli methodsFor: 'asserts' stamp: 'rjs 6/13/2020 20:07:56'!
checkIfThisPosition: aPosition isAdyacentToThisMark: aMark

	| vecinos |
	
	vecinos := aMark eightNeighbors.
	(vecinos includes: aPosition ) ifFalse: [^self error: self class invalidDistanceOfMarksErrorDescription ].
	
	^ true! !


!TerniLapilli methodsFor: 'inicialization' stamp: 'na 6/15/2020 12:15:03'!
initialize

	Xmarks := OrderedCollection new.
	Omarks := OrderedCollection new.
	playerTurn := PuttingX new: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilliExercise!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 18:52:26'!
InvalidMarkPlaceErrorDescription

	^ ' ya hay ficha ahi, gil!! '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 17:45:53'!
InvalidMarkPositionErrorDescription

	^ ' Posicion de Marca invalida, Probá del 1 al 3 '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:01:12'!
MarkMoveErrorDescription

	^ ' Solo podes elegir tus fichas para moverlas '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 18:35:34'!
invalidDistanceOfMarksErrorDescription

	^ ' No podes mover una ficha mas de un casillero de distancia '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 18:08:59'!
invalidLessNumberOfMarksErrorDescription

	^ '  No pusiste las 3 fichas todavia '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 18:17:41'!
invalidNumberOfMarksErrorDescription

	^ ' No podes poner más fichas, move las que tenés '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 18:10:20'!
invalidPlayerErrorDescription

	^ ' Ya jugaste vos pibe, compartí '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:19:00'!
new
	^ self basicNew initialize.! !


!classDefinition: #TerniLapilliState category: #TerniLapilliExercise!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:26:00'!
initialize: aTerniLapilli.
	 
	terniLapilli := aTerniLapilli.! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:21:19'!
whoIsPlaying
	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilliExercise!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:07:48'!
new: aTerniLapilli
	^ self basicNew initialize: aTerniLapilli.! !


!classDefinition: #PlayingO category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:16'!
whoIsPlaying
	
	^ 'O'! !


!classDefinition: #MovingO category: #TerniLapilliExercise!
PlayingO subclass: #MovingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:34:38'!
moveOMarkAt: aMark to: aPosition
	
	terniLapilli moveMark: aMark FromPlayerOAt: aPosition! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:34:33'!
moveXMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription.! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 11:50:15'!
putOat: aPosition

	^terniLapilli error: terniLapilli class invalidNumberOfMarksErrorDescription! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 11:55:41'!
putXat: aPosition
	
	^terniLapilli error: terniLapilli class invalidPlayerErrorDescription! !


!classDefinition: #PuttingO category: #TerniLapilliExercise!
PlayingO subclass: #PuttingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:01:47'!
moveOMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidLessNumberOfMarksErrorDescription! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:34:54'!
moveXMarkAt: aMark to: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription.! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:01'!
putOat: aPosition
	
	terniLapilli addMarkFromPlayerOAt: aPosition! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:05'!
putXat: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !


!classDefinition: #PlayingX category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:22'!
whoIsPlaying
	
	^ 'X'! !


!classDefinition: #MovingX category: #TerniLapilliExercise!
PlayingX subclass: #MovingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:28'!
moveOMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:33'!
moveXMarkAt: aMark to: aPosition
	
	terniLapilli moveMark: aMark FromPlayerXAt: aPosition! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:37'!
putOat: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:43'!
putXat: aPosition
	
	^ terniLapilli error: terniLapilli class invalidNumberOfMarksErrorDescription! !


!classDefinition: #PuttingX category: #TerniLapilliExercise!
PlayingX subclass: #PuttingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:36:28'!
moveOMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:36:24'!
moveXMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidLessNumberOfMarksErrorDescription! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:36:18'!
putOat: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:05:14'!
putXat: aPosition
	
	terniLapilli addMarkFromPlayerXAt: aPosition! !
