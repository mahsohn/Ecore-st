as yet unclassified
getAffiliation: eClass eStructuralFeature: eStructuralFeature
	| eContainingClass kind aName namespace allAttributes allElements result|
	(eClass getFeatureID: eStructuralFeature) >= 0 ifTrue: [ ^eStructuralFeature ].
	kind := self getFeatureKind: eStructuralFeature.
	kind == self ATTRIBUTE_FEATURE ifTrue: [
		eContainingClass := eStructuralFeature eContainingClass.
		(eContainingClass notNil & self isDocumentRoot: eContainingClass) ifTrue: [ 
			namespace := self getNamespace: eStructuralFeature.
			aName := self getName: eStructuralFeature.
			result := self getLocalAttribute: eClass namespace: namespace name: aName.
			result ifNotNil: [ ^result ].
			allAttributes := self getAllAttributes: eClass.
			allAttributes do: [ :att |
				(self matchesWithList: (self getWildcards: att) namespace: namespace) ifTrue: [ 
					^att 
				]
			]
		].
		^nil
	].
	kind == self ELEMENT_FEATURE ifTrue: [
		eContainingClass := eStructuralFeature eContainingClass.
		(eContainingClass notNil & self isDocumentRoot: eContainingClass) ifTrue: [ 
			
			namespace := self getNamespace: eStructuralFeature.
			aName := self getName: eStructuralFeature.
			result := self getLocalElement: eClass namespace: namespace name: aName.
			result ifNotNil: [ ^result ].
			XMLTypePackage eNS_URI == namespace ifTrue: [ ^ self getMixedFeature: eClass ]
			ifFalse: [ 
				allElements := self getAllElements: eClass.
				allElements do: [ :el |
					(self matchesWithList: (self getWildcards: el) namespace: namespace) ifTrue: [ 
						^el
					]
				]
			]
		].
		^nil
	].
	^nil
