!classDefinition: #TestTerniLapilli category: #TerniLapilliExercise!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:52:10'!
test01StartsGameWithEmptyBoardAndMovesX

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self assert: juegoNuevo playedMarks equals: 0.
		self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
		self assert: juegoNuevo isPlaying equals: 'X'.
		self assert: juegoNuevo hasntFinishedYet equals: true.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:55:05'!
test02PlayerXMadeAMove

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: 1 equals: juegoNuevo playedMarks.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
		self assert: juegoNuevo isPlaying equals: 'O'.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:55:37'!
test03XPlayedNowPlaysO
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: 2 equals: juegoNuevo playedMarks.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
		self assert: juegoNuevo isPlaying equals: 'X'.
! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:56:03'!
test04AMarkCanNotBePutOnThePositionOfAnotherMark
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putOat: 1 @ 1. ]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 1 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:56:27'!
test05AMarkCanNotBePutOnThePositionOfAnotherMark
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 2 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:57:01'!
test06YCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 10.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:57:11'!
test07YCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 0.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:57:15'!
test08XCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 10 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:57:23'!
test09XCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 0 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:57:46'!
test10XCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 1 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:58:37'!
test11XCanNotPlayFourNewMarks
	
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
									self assert: 6 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:59:08'!
test12XCanNotMoveAMarkBeforePlacingThree
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidLessNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 18:29:55'!
test13XCanNotMoveAMarkOutOfBoard
	
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
									self assert: 6 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:59:24'!
test14XCanNotMoveAMarkMoreThanOnePlace
	
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
									self assert: 6 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:59:29'!
test15XCanOnlyMoveHisMarks
	
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
									self assert: 6 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli MarkMoveErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:09:36'!
test16XMovedAMark
	
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
		self assert: 6 equals: juegoNuevo playedMarks.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 3 @ 3. 2 @ 3}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
		self assert: juegoNuevo isPlaying equals: 'O'.
		! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:45:04'!
test17XCanNotMoveAtOsTurn
	
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
									self assert: 5 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2.}).
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli invalidPlayerErrorDescription ]! !


!classDefinition: #TerniLapilli category: #TerniLapilliExercise!
Object subclass: #TerniLapilli
	instanceVariableNames: 'Xmarks Omarks playerTurn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilli methodsFor: 'put' stamp: 'rjs 6/12/2020 19:18:54'!
addMarkFromPlayerOAt: aPosition

	Omarks add: aPosition.
	playerTurn := PlayingX new: self.! !

!TerniLapilli methodsFor: 'put' stamp: 'rjs 6/12/2020 19:23:42'!
addMarkFromPlayerXAt: aPosition

	Xmarks add: aPosition.
	playerTurn := PlayingO new: self.! !

!TerniLapilli methodsFor: 'put' stamp: 'rjs 6/12/2020 19:10:30'!
putOat: aPosition

	self checkIfMaxMarksIsReached: Omarks.
	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putOat: aPosition
	
	

	! !

!TerniLapilli methodsFor: 'put' stamp: 'rjs 6/12/2020 19:13:35'!
putXat: aPosition

	self checkIfMaxMarksIsReached: Xmarks.
	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putXat: aPosition! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:44:05'!
moveMark: aMark FromPlayerOAt: aPosition

	self checkIfIsPosibleToMoveNow: Omarks.
	
	Omarks remove: aMark ifAbsent: [^self error: self class MarkMoveErrorDescription].
	
	Omarks add: aPosition.
	playerTurn := PlayingX new: self.
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:31:12'!
moveMark: aMark FromPlayerXAt: aPosition

	self checkIfIsPosibleToMoveNow: Xmarks.

	Xmarks remove: aMark ifAbsent: [^self error: self class MarkMoveErrorDescription].
	
	Xmarks add: aPosition.
	playerTurn := PlayingO new: self.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:30:27'!
moveOMarkAt: aMark to: aPosition

	self checkIfItIsAValidPosition: aPosition.
	self checkIfThisPosition: aPosition isAdyacentToThisMark: aMark.
	
	^ playerTurn moveOMarkAt: aMark to: aPosition.

! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:31:04'!
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

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/12/2020 18:23:18'!
playedMarks
	
	^ Omarks size + Xmarks size
	! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/12/2020 18:20:01'!
playedOMarks
	
	^ Omarks size
	! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/12/2020 18:19:55'!
playedXMarks
	
	^ Xmarks size
	! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/13/2020 19:51:50'!
visualizeOMarks
	
	^ Omarks copy
	! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/13/2020 19:44:22'!
visualizeXMarks
	
	^ Xmarks copy
	! !


!TerniLapilli methodsFor: 'asserts' stamp: 'rjs 6/13/2020 20:05:50'!
checkIfIsPosibleToMoveNow: aCollection

	(aCollection size < 3) ifTrue: [^ self error: self class invalidLessNumberOfMarksErrorDescription ].
	
	^ true! !

!TerniLapilli methodsFor: 'asserts' stamp: 'rjs 6/13/2020 18:52:26'!
checkIfItIsAValidPosition: aPosition

	(aPosition y > 3 or: [aPosition y < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	(aPosition x > 3 or: [aPosition x < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	
	((Omarks includes: aPosition) or: [Xmarks includes: aPosition]) ifTrue: [^ self error: self class InvalidMarkPlaceErrorDescription].
	
	^ true! !

!TerniLapilli methodsFor: 'asserts' stamp: 'rjs 6/12/2020 19:03:47'!
checkIfMaxMarksIsReached: aCollection

	aCollection size = 3 ifTrue:[^ self error: self class invalidNumberOfMarksErrorDescription]
	
		! !

!TerniLapilli methodsFor: 'asserts' stamp: 'rjs 6/13/2020 20:07:56'!
checkIfThisPosition: aPosition isAdyacentToThisMark: aMark

	| vecinos |
	
	vecinos := aMark eightNeighbors.
	(vecinos includes: aPosition ) ifFalse: [^self error: self class invalidDistanceOfMarksErrorDescription ].
	
	^ true! !


!TerniLapilli methodsFor: 'inicialization' stamp: 'rjs 6/12/2020 19:26:44'!
initialize

	Xmarks := OrderedCollection new.
	Omarks := OrderedCollection new.
	playerTurn := PlayingX new: self.! !

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

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:22:26'!
moveOMarkAt: aMark to: aPosition
	terniLapilli moveMark: aMark FromPlayerOAt: aPosition! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:23:18'!
moveXMarkAt: aMark to: aPosition
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:09:30'!
putOat: aPosition
	terniLapilli addMarkFromPlayerOAt: aPosition! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:28:52'!
putXat: aPosition
	 ^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:21:36'!
whoIsPlaying
	^ 'O'! !


!classDefinition: #MovingO category: #TerniLapilliExercise!
PlayingO subclass: #MovingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!


!classDefinition: #PuttingO category: #TerniLapilliExercise!
PlayingO subclass: #PuttingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!


!classDefinition: #PlayingX category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:23:25'!
moveOMarkAt: aMark to: aPosition
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 20:23:03'!
moveXMarkAt: aMark to: aPosition
	terniLapilli moveMark: aMark FromPlayerXAt: aPosition! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:28:43'!
putOat: aPosition
	 ^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:07:13'!
putXat: aPosition
	terniLapilli addMarkFromPlayerXAt: aPosition! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:21:44'!
whoIsPlaying
	^ 'X'! !


!classDefinition: #MovingX category: #TerniLapilliExercise!
PlayingX subclass: #MovingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!


!classDefinition: #PuttingX category: #TerniLapilliExercise!
PlayingX subclass: #PuttingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!
