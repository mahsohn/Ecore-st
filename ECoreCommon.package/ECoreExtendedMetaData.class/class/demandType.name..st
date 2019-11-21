as yet unclassified
demandType: namespace name: aName
	| ePackage eClassifier eClass |
	ePackage := self demandPackage: namespace.
	eClassifier := self getType: ePackage name: name.
	eClassifier ifNotNil: [ ^eClassifier ]
	ifNil:[
		eClass := ECoreFactory createEClass.
		eClass name: aName.
		eClass getESuperTypes add: XMLTypePackage getAnyType.
		self setContentKind: eClass kind: self MIXED_CONTENT.
		ePackage getEClassifiers add: eClass.
		^eClass
	]