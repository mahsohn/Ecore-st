as yet unclassified
getLocalElement: eClass namespace: namespace name: name
	| result allElements featureNamespace eStructuralFeature kind |
	self isFeatureKindSpecific ifTrue: [ 
		allElements := self getAllElements: eClass.
		allElements do: [ :element |
			(name == (self getName: element)) ifTrue: [ 
				featureNamespace := self getNamespace: element.
				namespace ifNil: [ 
					featureNamespace ifNil: [ ^element ] .
					result ifNil: [ result := element  ]
					]
				ifNotNil: [ namespace == featureNamespace ifTrue: [ ^element ].
					(featureNamespace isNil & result isNil) ifTrue: [ result := element ] ]
				 ]
			 ]
		 ]
	ifFalse: [ 
		1 to: eClass getFeatureCount do: [ :i |
			eStructuralFeature := eClass getEStructuralFeature: i.
			kind := self getFeatureKind: eStructuralFeature.
			((kind == ECoreExtendedMetaData UNSPECIFIED_FEATURE) | 
			(kind == ECoreExtendedMetaData GROUP_FEATURE) |
			(kind == ECoreExtendedMetaData ELEMENT_FEATURE)) ifTrue: [ 
				(name == (self getName: eStructuralFeature)) ifTrue: [ 
					featureNamespace := self getNamespace: eStructuralFeature.
					namespace ifNil: [  
						featureNamespace ifNil: [ ^eStructuralFeature ].
						result ifNil: [ result := eStructuralFeature  ]
					]
					ifNotNil: [ 
						(namespace == featureNamespace) ifTrue: [ ^eStructuralFeature ].
						(featureNamespace isNil & result isNil) ifTrue: [ result := eStructuralFeature ]
					]
				]
			]
		]
	].
	(self isFeatureNamespaceMatchingLax) ifTrue: [ ^result ] ifFalse: [ ^nil ]