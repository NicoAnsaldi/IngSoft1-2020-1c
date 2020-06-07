!classDefinition: #TestRobot category: #Rover!
TestCase subclass: #TestRobot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/4/2020 21:37:10'!
test01StringVacio
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: ' '.
	
	self assert: robot position equals: 1@1.
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/4/2020 21:36:43'!
test02MoverHaciaAdelante
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'f'.
	
	self assert: 1@2 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/4/2020 21:36:25'!
test03MoverHaciaAtras
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'b'.
	
	self assert:  1@0 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/4/2020 21:40:32'!
test04GirarDerecha
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'r'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'E' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 10:14:08'!
test05GirarIzquierda
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'l'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'O' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 12:16:58'!
test06StringErroneo
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	self
		should: [ robot send: 'x'. ]
		raise: Error
		withMessageText: [	self assert: robot position equals: 1@1.
									self assert: robot direction equals: 'N'.
									MarsRobot marsRobotInvalidComandErrorDescription ]

 ! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 12:11:42'!
test07AvanzarDosVeces
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'E'.
	
	robot send: 'f'.
	robot send: 'f'.
	self assert:  3@1 equals: robot position .
	self assert:  'E' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 12:11:50'!
test08RetrocederDosVeces
	
	| robot |
	
	robot := MarsRobot in: 1@3 with: 'N'.
	
	robot send: 'b'.
	robot send: 'b'.
	self assert:  1@1 equals: robot position .
	self assert:  'N' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 12:11:56'!
test09SePuedeGirarHaciaLaDerecha
	
	| robot1 robot2 robot3 robot4 |
	
	robot1 := MarsRobot in: 1@1 with: 'N'.
	robot2 := MarsRobot in: 1@1 with: 'E'.
	robot3 := MarsRobot in: 1@1 with: 'S'.
	robot4:= MarsRobot in: 1@1 with: 'O'.
	
	robot1 send: 'r'.
	robot2 send: 'r'.
	robot3 send: 'r'.
	robot4 send: 'r'.
	
	self assert:  1@1 equals: robot1 position .
	self assert:  'E' equals: robot1 direction.
	self assert:  1@1 equals: robot2 position .
	self assert:  'S' equals: robot2 direction.
	self assert:  1@1 equals: robot3 position .
	self assert:  'O' equals: robot3 direction.
	self assert:  1@1 equals: robot4 position .
	self assert:  'N' equals: robot4 direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 12:12:03'!
test10SePuedeGirarHaciaLaIzquierda
	
	| robot1 robot2 robot3 robot4 |
	
	robot1 := MarsRobot in: 1@1 with: 'N'.
	robot2 := MarsRobot in: 1@1 with: 'O'.
	robot3 := MarsRobot in: 1@1 with: 'S'.
	robot4:= MarsRobot in: 1@1 with: 'E'.
	
	robot1 send: 'l'.
	robot2 send: 'l'.
	robot3 send: 'l'.
	robot4 send: 'l'.
	
	self assert:  1@1 equals: robot1 position .
	self assert:  'O' equals: robot1 direction.
	self assert:  1@1 equals: robot2 position .
	self assert:  'S' equals: robot2 direction.
	self assert:  1@1 equals: robot3 position .
	self assert:  'E' equals: robot3 direction.
	self assert:  1@1 equals: robot4 position .
	self assert:  'N' equals: robot4 direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 12:12:10'!
test11CadenaLarga
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'frblfl'.
	
	self assert:  0@3 equals: robot position .
	self assert:  'O' equals: robot direction.! !


!classDefinition: #MarsRobot category: #Rover!
Object subclass: #MarsRobot
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobot methodsFor: 'turnRigth' stamp: 'rjs 6/7/2020 11:21:43'!
girarADerechaMarsRobotWithEastState
	
	 direction := 'S'.! !

!MarsRobot methodsFor: 'turnRigth' stamp: 'rjs 6/7/2020 11:21:50'!
girarADerechaMarsRobotWithNorthState
	
	 direction := 'E'.! !

!MarsRobot methodsFor: 'turnRigth' stamp: 'rjs 6/7/2020 11:25:05'!
girarADerechaMarsRobotWithSouthState
	
	 direction := 'O'.! !

!MarsRobot methodsFor: 'turnRigth' stamp: 'rjs 6/7/2020 11:22:44'!
girarADerechaMarsRobotWithWestState
	
	 direction := 'N'.! !


!MarsRobot methodsFor: 'turnLeft' stamp: 'rjs 6/7/2020 11:29:12'!
girarAIzquierdaMarsRobotWithEastState
	
	 direction := 'N'.! !

!MarsRobot methodsFor: 'turnLeft' stamp: 'rjs 6/7/2020 11:29:24'!
girarAIzquierdaMarsRobotWithNorthState
	
	 direction := 'O'.! !

!MarsRobot methodsFor: 'turnLeft' stamp: 'rjs 6/7/2020 11:29:40'!
girarAIzquierdaMarsRobotWithSouthState
	
	 direction := 'E'.! !

!MarsRobot methodsFor: 'turnLeft' stamp: 'rjs 6/7/2020 11:29:55'!
girarAIzquierdaMarsRobotWithWestState
	
	 direction := 'S'.! !


!MarsRobot methodsFor: 'avanzar' stamp: 'rjs 6/7/2020 11:00:17'!
avanzarMarsRobotWithEastState
	
	 position := (( position x +1) @ ( position y)).! !

!MarsRobot methodsFor: 'avanzar' stamp: 'rjs 6/7/2020 11:00:07'!
avanzarMarsRobotWithNorthState
	
	position := (( position x) @ ( position y +1)).! !

!MarsRobot methodsFor: 'avanzar' stamp: 'rjs 6/7/2020 10:59:20'!
avanzarMarsRobotWithSouthState
	
	position := ((position x) @ (position y - 1))! !

!MarsRobot methodsFor: 'avanzar' stamp: 'rjs 6/7/2020 10:59:35'!
avanzarMarsRobotWithWestState
	
	position := ((position x - 1 ) @ (position y)) ! !


!MarsRobot methodsFor: 'retroceder' stamp: 'rjs 6/7/2020 11:11:22'!
retrocederMarsRobotWithEastState
	
	 position := (( position x -1) @ ( position y)).! !

!MarsRobot methodsFor: 'retroceder' stamp: 'rjs 6/7/2020 11:11:30'!
retrocederMarsRobotWithNorthState
	
	position := (( position x) @ ( position y -1)).! !

!MarsRobot methodsFor: 'retroceder' stamp: 'rjs 6/7/2020 11:11:49'!
retrocederMarsRobotWithWestState
	
	position := ((position x + 1 ) @ (position y)) ! !

!MarsRobot methodsFor: 'retroceder' stamp: 'rjs 6/7/2020 11:11:41'!
retrodecerMarsRobotWithSouthState
	
	position := ((position x) @ (position y + 1))! !


!MarsRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:34:36'!
direction
	^ direction! !

!MarsRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:04:53'!
initialize: aPosition with: aDirection
		
	position := aPosition.
	direction := aDirection.! !

!MarsRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:10:48'!
position
	
	^ position! !

!MarsRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 12:28:29'!
procesarComando: aChar
	
	(aChar = $ ) ifTrue: [ ^ self  ].
	(aChar = $f) ifTrue: [ (MarsRobotState stateFor: self) avanzar  ].
	(aChar = $b) ifTrue: [ (MarsRobotState stateFor: self) retroceder ].
	(aChar = $r) ifTrue: [ (MarsRobotState stateFor: self) girarADerecha ].
	(aChar = $l) ifTrue: [ (MarsRobotState stateFor: self) girarAIzquierda  ].
	
	^ self error: self class marsRobotInvalidComandErrorDescription.
	! !

!MarsRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 12:23:49'!
send: aString

	aString do: [ :each | self procesarComando: each ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobot class' category: #Rover!
MarsRobot class
	instanceVariableNames: ''!

!MarsRobot class methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:04:07'!
in: aPosition with: aDirection
		

	 ^ self basicNew initialize: aPosition with: aDirection.! !

!MarsRobot class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 12:14:40'!
marsRobotInvalidComandErrorDescription 

	^ ' me pasaste wea amigo, recatate'! !

!MarsRobot class methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 20:58:03'!
new

	 ^ self basicNew.! !


!classDefinition: #MarsRobotState category: #Rover!
Object subclass: #MarsRobotState
	instanceVariableNames: 'marsRobot'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotState methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:02:12'!
avanzar
	^ self subclassResponsibility ! !

!MarsRobotState methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:19:22'!
girarADerecha
	^ self subclassResponsibility ! !

!MarsRobotState methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:28:02'!
girarAIzquierda
	^ self subclassResponsibility ! !

!MarsRobotState methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:09:57'!
retroceder
	^ self subclassResponsibility ! !


!MarsRobotState methodsFor: 'initialize' stamp: 'rjs 6/7/2020 10:51:11'!
inicializar: aMarsRobot

	marsRobot _ aMarsRobot
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotState class' category: #Rover!
MarsRobotState class
	instanceVariableNames: ''!

!MarsRobotState class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 10:44:25'!
canHandle: aMarsRobot
	^ self subclassResponsibility ! !

!MarsRobotState class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 10:47:50'!
for: aMarsRobot
 	^ self new inicializar: aMarsRobot! !

!MarsRobotState class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 10:42:37'!
stateFor: aMarsRobot

	^(self subclasses detect: [:aMarsRobotStateClass | aMarsRobotStateClass canHandle: aMarsRobot ]) for: aMarsRobot! !


!classDefinition: #MarsRobotStateEast category: #Rover!
MarsRobotState subclass: #MarsRobotStateEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotStateEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:00:46'!
avanzar

	^ marsRobot avanzarMarsRobotWithEastState.

	
	! !

!MarsRobotStateEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:19:33'!
girarADerecha

	^ marsRobot girarADerechaMarsRobotWithEastState.

	
	! !

!MarsRobotStateEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:28:15'!
girarAIzquierda

	^ marsRobot girarAIzquierdaMarsRobotWithEastState.

	
	! !

!MarsRobotStateEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:10:12'!
retroceder

	^ marsRobot retrocederMarsRobotWithEastState.

	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotStateEast class' category: #Rover!
MarsRobotStateEast class
	instanceVariableNames: ''!

!MarsRobotStateEast class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 10:45:30'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'E'! !


!classDefinition: #MarsRobotStateNorth category: #Rover!
MarsRobotState subclass: #MarsRobotStateNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotStateNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:20:01'!
avanzar
	^ marsRobot avanzarMarsRobotWithNorthState.! !

!MarsRobotStateNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:20:18'!
girarADerecha

	^ marsRobot girarADerechaMarsRobotWithNorthState.
! !

!MarsRobotStateNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:28:25'!
girarAIzquierda

	^ marsRobot girarAIzquierdaMarsRobotWithNorthState.
! !

!MarsRobotStateNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:10:24'!
retroceder
	^ marsRobot retrocederMarsRobotWithNorthState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotStateNorth class' category: #Rover!
MarsRobotStateNorth class
	instanceVariableNames: ''!

!MarsRobotStateNorth class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 10:46:03'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'N'! !


!classDefinition: #MarsRobotStateSouth category: #Rover!
MarsRobotState subclass: #MarsRobotStateSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotStateSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:19:53'!
avanzar
	^ marsRobot avanzarMarsRobotWithSouthState.! !

!MarsRobotStateSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:20:29'!
girarADerecha

	^ marsRobot girarADerechaMarsRobotWithSouthState.
! !

!MarsRobotStateSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:28:34'!
girarAIzquierda

	^ marsRobot girarAIzquierdaMarsRobotWithSouthState.
! !

!MarsRobotStateSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:10:34'!
retroceder
	^ marsRobot retrocederMarsRobotWithSouthState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotStateSouth class' category: #Rover!
MarsRobotStateSouth class
	instanceVariableNames: ''!

!MarsRobotStateSouth class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 10:46:09'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'S'! !


!classDefinition: #MarsRobotStateWest category: #Rover!
MarsRobotState subclass: #MarsRobotStateWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotStateWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:01:12'!
avanzar
	^ marsRobot avanzarMarsRobotWithWestState.! !

!MarsRobotStateWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:20:40'!
girarADerecha

	^ marsRobot girarADerechaMarsRobotWithWestState.
! !

!MarsRobotStateWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:28:43'!
girarAIzquierda

	^ marsRobot girarAIzquierdaMarsRobotWithWestState.
! !

!MarsRobotStateWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 11:10:41'!
retroceder
	^ marsRobot retrocederMarsRobotWithWestState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotStateWest class' category: #Rover!
MarsRobotStateWest class
	instanceVariableNames: ''!

!MarsRobotStateWest class methodsFor: 'as yet unclassified' stamp: 'rjs 6/7/2020 10:46:16'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'O'! !
