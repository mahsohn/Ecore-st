as yet unclassified
eGet: eFeature resolve: resolve coreType: coreType
	| featureID |
	featureID := self eDerivedStructuralFeatureID: eFeature.
	featureID >= 0 ifTrue: [ ^self eGet:featureID resolve: resolve coreType: coreType ]
	ifFalse: [ ^ self eOpenGet:eFeature resolve: resolve ]