as yet unclassified
eFactory: nsURI
	""
	
	| ePackage |
	ePackage := self at: nsURI ifAbsent: nil.
	(ePackage isKindOf: EPackage) ifTrue: [ ^ePackage eFactoryInstance ].
	(ePackage isKindOf: ECoreDescriptor) ifTrue: [ ^ePackage ePackage eFactory ].
	^ self delegatedEFactory: nsURI.