!classDefinition: #TestTerniLapilli category: #TerniLapilliExercise!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:36:48'!
test01StartsGameWithEmptyBoardAndMovesX

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self assert: juegoNuevo playedMarks equals: 0.
		self assert: juegoNuevo isPlaying equals: 'X'.
		self assert: juegoNuevo hasntFinishedYet equals: true.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:37:02'!
test02PlayerXMadeAMove

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: 1 equals: juegoNuevo playedMarks.
		self assert: juegoNuevo isPlaying equals: 'O'.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:37:13'!
test03XPlayedNowPlaysO
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: 2 equals: juegoNuevo playedMarks.
		self assert: juegoNuevo isPlaying equals: 'X'.
! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:37:23'!
test04AMarkCanNotBePutOnThePositionOfAnotherMark
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putOat: 1 @ 1. ]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 1 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli InvalidComandErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:37:32'!
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
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidComandErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:37:42'!
test06YCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 10.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:37:50'!
test07YCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 0.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:38:04'!
test08XCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 10 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:38:13'!
test09XCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 0 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 0 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:38:24'!
test10XCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 1 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlaying equals: 'O'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:38:31'!
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
									self assert: juegoNuevo isPlaying equals: 'X'.
									TerniLapilli invalidNumberOfMarksErrorDescription ]! !


!classDefinition: #TerniLapilli category: #TerniLapilliExercise!
Object subclass: #TerniLapilli
	instanceVariableNames: 'Xmarks Omarks playerTurn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:18:54'!
addMarkFromPlayerOAt: aPosition

	Omarks add: aPosition.
	playerTurn := PlayingX new: self.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:23:42'!
addMarkFromPlayerXAt: aPosition

	Xmarks add: aPosition.
	playerTurn := PlayingO new: self.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:05:57'!
checkIfItIsAValidPosition: aPosition

	(aPosition y > 3 or: [aPosition y < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	(aPosition x > 3 or: [aPosition x < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	
	((Omarks includes: aPosition) or: [Xmarks includes: aPosition]) ifTrue: [^ self error: self class InvalidComandErrorDescription].
	
	^ true! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:03:47'!
checkIfMaxMarksIsReached: aCollection

	aCollection size = 3 ifTrue:[^ self error: self class invalidNumberOfMarksErrorDescription]
	
		! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:14:22'!
hasntFinishedYet
	^ true! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:26:44'!
initialize

	Xmarks := OrderedCollection new.
	Omarks := OrderedCollection new.
	playerTurn := PlayingX new: self.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:36:20'!
isPlaying
	^ playerTurn whoIsPlaying! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 18:23:18'!
playedMarks
	
	^ Omarks size + Xmarks size
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 18:20:01'!
playedOMarks
	
	^ Omarks size
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 18:19:55'!
playedXMarks
	
	^ Xmarks size
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:10:30'!
putOat: aPosition

	self checkIfMaxMarksIsReached: Omarks.
	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putOat: aPosition
	
	

	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:13:35'!
putXat: aPosition

	self checkIfMaxMarksIsReached: Xmarks.
	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putXat: aPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilliExercise!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:39:26'!
InvalidComandErrorDescription

	^ ' ya hay ficha ahi, gil!! '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 17:45:53'!
InvalidMarkPositionErrorDescription

	^ ' Posicion de Marca invalida, Probá del 1 al 3 '! !

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

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:09:30'!
putOat: aPosition
	terniLapilli addMarkFromPlayerOAt: aPosition! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:28:52'!
putXat: aPosition
	 ^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:21:36'!
whoIsPlaying
	^ 'O'! !


!classDefinition: #PlayingX category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:28:43'!
putOat: aPosition
	 ^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:07:13'!
putXat: aPosition
	terniLapilli addMarkFromPlayerXAt: aPosition! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:21:44'!
whoIsPlaying
	^ 'X'! !
