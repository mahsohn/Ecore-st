as yet unclassified
ePackage: nsURI
	""
	
	| ePackage |
	ePackage := self at: nsURI ifAbsent: nil.
	(ePackage isKindOf: EPackage) ifTrue: [ ^ePackage ].
	(ePackage isKindOf: ECoreDescriptor) ifTrue: [ 
		ePackage := ePackage ePackage.
		self at: nsURI put: ePackage.
		^ePackage.
		].
	^ self delegatedEPackage: nsURI.