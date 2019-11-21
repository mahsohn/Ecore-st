as yet unclassified
eInternalResource
	| result count eContainer|
	result := self eDirectResource.
	result ifNil: [ 
		count := 0.
		eContainer := self eInternalContainer.
		[ 
			count > 100000 ifTrue: [ ^eContainer eInternalResource ].
			result := eContainer eDirectResource.
			(result isNotNil | (eContainer == self)) ifTrue: [ eContainer := nil ]
			ifFalse: [ eContainer := eContainer eInternalContainer ].
			count := count + 1.
		 ] doWhileTrue: [ eContainer notNil ]
	].
	^result