as yet unclassified
getElements: eClass
	| eStructuralFeatures result |
	eStructuralFeatures := eClass getEStructuralFeatures.
	eStructuralFeatures do: [ :eStructuralFeature | 
		((eStructuralFeature == ECoreExtendedMetaData ELEMENT_FEATURE) |
		(eStructuralFeature == ECoreExtendedMetaData GROUP_FEATURE) |
		(eStructuralFeature == ECoreExtendedMetaData ELEMENT_WILDCARD_FEATURE)) ifTrue: [ 
			result ifNil: [ result := OrderedCollection new. ].
			result add: eStructuralFeature.	
		]
	].
	result ifNil: [ ^EStructuralFeature emptyList ] ifNotNil: [ ^result ]