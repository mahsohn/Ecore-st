accessing
eClass
	| props result |
	props := self eBasicProperties.
	props ifNotNil: [ 
		result := props eClass.
		result ifNotNil: [ ^ result ]
		 ].
	^ self eStaticClass.