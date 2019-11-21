as yet unclassified
getAttributes: eClass
	| eStructuralFeatures result |
	eStructuralFeatures := eClass getEStructuralFeatures.
	eStructuralFeatures do: [ :eStructuralFeature | 
		((eStructuralFeature == ECoreExtendedMetaData ATTRIBUTE_FEATURE) |
		(eStructuralFeature == ECoreExtendedMetaData ATTRIBUTE_WILDCARD_FEATURE)) ifTrue: [ 
			result ifNil: [ result := OrderedCollection new. ].
			result add: eStructuralFeature.	
		]
	].
	result ifNil: [ ^EStructuralFeature emptyList ] ifNotNil: [ ^result ]