as yet unclassified
demandFeature: namespace name: aName isElement: isElement isReference: isReference
	| ePackage documentRootEClass eStructuralFeature eReference eAttribute|
	ePackage := self demandPackage: namespace.
	documentRootEClass := self getDocumentRoot: ePackage.
	eStructuralFeature := isElement ifTrue: [ self getLocalElement: documentRootEClass 
																namespace: namespace 
																name: aName ]
											ifFalse: [ self getLocalAttribute: documentRootEClass 
																namespace: namespace 
																name: aName ].
	eStructuralFeature ifNotNil: [ ^eStructuralFeature  ]
	ifNil: [ 
		isReference ifTrue: [ 
			eReference := ECoreFactory createEReference.
			isElement ifTrue: [ 
				eReference setContainment: true.
				eReference setResolveProxies: false.
			].
			eReference eType: ECorePackageLiterals EOBJECT.
			eReference name: aName.
			eReference derived: true.
			eReference transient: true.
			eReference volatile: true.
			documentRootEClass getEStructuralFeatures add: eReference.
			(self setFeatureKind: eReference kind: isElement) ifTrue: [ self ELEMENT_FEATURE  ]
																		    ifFalse: [ self ATTRIBUTE_FEATURE  ].
			self setNamespace: eReference namespace: namespace.
			isElement ifTrue: [ eReference setUpperBound: ETypedElement UNSPECIFIED_MULTIPLICITY ].
			^ eReference
		]
		ifFalse: [ 
			eAttribute := ECoreFactory createEAttribute.
			eAttribute eType: ECorePackageLiterals EOBJECT.
			eAttribute name: aName.
			eAttribute derived: true.
			eAttribute transient: true.
			eAttribute volatile: true.
			documentRootEClass getEStructuralFeatures add: eAttribute.
			(self setFeatureKind: eAttribute kind: isElement) ifTrue: [ self ELEMENT_FEATURE  ]
																		    ifFalse: [ self ATTRIBUTE_FEATURE  ].
			self setNamespace: eAttribute namespace: namespace.
			isElement ifTrue: [ eAttribute setUpperBound: ETypedElement UNSPECIFIED_MULTIPLICITY ].
			^ eAttribute
		]
	]
															