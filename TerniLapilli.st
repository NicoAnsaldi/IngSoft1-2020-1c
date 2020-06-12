!classDefinition: #TestTerniLapilli category: #TerniLapilli!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:16:37'!
test01StartsGameWithEmptyBoardAndMovesX

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self assert: juegoNuevo playedMarks equals: 0.
		self assert: juegoNuevo isPlayingX equals: true.
		self assert: juegoNuevo isPlayingO equals: false.
		self assert: juegoNuevo hasntFinishedYet equals: true.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:30:48'!
test02PlayerXMadeAMove

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: 1 equals: juegoNuevo playedMarks.
		self assert: juegoNuevo isPlayingX equals: false.
		self assert: juegoNuevo isPlayingO equals: true.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:32:59'!
test03XPlayedNowPlaysO
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: 2 equals: juegoNuevo playedMarks.
		self assert: juegoNuevo isPlayingX equals: true.
		self assert: juegoNuevo isPlayingO equals: false.
! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:38:47'!
test04AMarkCanNotBePutOnThePositionOfAnotherMark
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putOat: 1 @ 1. ]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: 1 equals: juegoNuevo playedMarks.
									self assert: juegoNuevo isPlayingX equals: false.
									self assert: juegoNuevo isPlayingO equals: true.
									TerniLapilli InvalidComandErrorDescription ]! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'marks playerTurn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:14:22'!
hasntFinishedYet
	^ true! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:25:26'!
initialize

	marks := OrderedCollection new.
	playerTurn := 'X'.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:29:26'!
isPlayingO
	^ playerTurn  = 'O'! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:28:33'!
isPlayingX
	^ playerTurn  = 'X'! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:21:02'!
playedMarks
	
	^ marks size
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:45:19'!
putOat: aPosition

	(marks includes: aPosition) ifFalse: [marks add: aPosition. playerTurn := 'X'.].
	
	^ self error: self class InvalidComandErrorDescription.
	
	

	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:43:14'!
putXat: aPosition

	marks add: aPosition.
	playerTurn := 'O'.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:39:26'!
InvalidComandErrorDescription

	^ ' ya hay ficha ahi, gil!! '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:19:00'!
new
	^ self basicNew initialize.! !
