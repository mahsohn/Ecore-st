as yet unclassified
getLocalAttribute: eClass namespace: namespace name: name
	| result allAttributes featureNamespace eStructuralFeature kind |
	self isFeatureKindSpecific ifTrue: [ 
		allAttributes := self getAllAttributes: eClass.
		allAttributes do: [ :attribute |
			(name == (self getName: attribute)) ifTrue: [ 
				featureNamespace := self getNamespace: attribute.
				namespace ifNil: [ 
					featureNamespace ifNil: [ ^attribute ] .
					result ifNil: [ result := attribute  ]
					]
				ifNotNil: [ namespace == featureNamespace ifTrue: [ ^attribute ].
					(featureNamespace isNil & result isNil) ifTrue: [ result := attribute ] ]
				 ]
			 ]
		 ]
	ifFalse: [ 
		1 to: eClass getFeatureCount do: [ :i |
			eStructuralFeature := eClass getEStructuralFeature: i.
			kind := self getFeatureKind: eStructuralFeature.
			((kind == ECoreExtendedMetaData UNSPECIFIED_FEATURE) | 
			(kind == ECoreExtendedMetaData UNSPECIFIED_FEATURE)) ifTrue: [ 
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