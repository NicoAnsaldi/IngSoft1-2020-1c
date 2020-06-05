!classDefinition: #TestRobot category: #Rover!
TestCase subclass: #TestRobot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!TestRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:37:10'!
test01StringVacio
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: ' '.
	
	self assert: robot position equals: 1@1.
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:36:43'!
test02MoverHaciaAdelante
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'f'.
	
	self assert: 1@2 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:36:25'!
test03MoverHaciaAtras
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'b'.
	
	self assert:  1@0 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:40:32'!
test04GirarDerecha
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'r'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'E' equals: robot direction.! !

!TestRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:41:02'!
test05GirarIzquierda
	
	| robot |
	
	robot := MarsRobot in: 1@1 with: 'N'.
	
	robot send: 'l'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'O' equals: robot direction.! !


!classDefinition: #MarsRobot category: #Rover!
Object subclass: #MarsRobot
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

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

!MarsRobot methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:41:24'!
send: aString
	
	aString = ' ' ifTrue: [ ^ self  ].
	aString = 'f' ifTrue: [ position := 1@2  ].
	aString = 'b' ifTrue: [ position := 1@0  ].
	aString = 'r' ifTrue: [ direction := 'E'  ].
	aString = 'l' ifTrue: [ direction := 'O'  ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobot class' category: #Rover!
MarsRobot class
	instanceVariableNames: ''!

!MarsRobot class methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 21:04:07'!
in: aPosition with: aDirection
		

	 ^ self basicNew initialize: aPosition with: aDirection.! !

!MarsRobot class methodsFor: 'as yet unclassified' stamp: 'rjs 6/4/2020 20:58:03'!
new

	 ^ self basicNew.! !
