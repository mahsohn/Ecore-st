testing
isAncestor: ancestorEObject eObject: anEObject
	| count eContainer |
	anEObject ifNotNil: [ 
		anEObject == ancestorEObject ifTrue: [ ^true ].
		count := 0.
		eContainer := anEObject eInternalContainer.
		[ count > 100000 ifTrue: [ ^self isAncestor: ancestorEObject eObject: eContainer ].
		  eContainer == ancestorEObject ifTrue: [ ^true ].
		  eContainer := eContainer eInternalContainer.
		] doWhileTrue: [ eContainer notNil & eContainer ~= anEObject  ].
	].
	^false