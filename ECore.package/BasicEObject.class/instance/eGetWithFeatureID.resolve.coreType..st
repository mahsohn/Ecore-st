as yet unclassified
eGetWithFeatureID: featureID resolve: resolve coreType: coreType
	| eFeature dynamicFeatureID |
	eFeature := self eClass eStructuralFeature: featureID.
	self assert: [ eFeature notNil ].
	dynamicFeatureID := featureID - self eStaticFeatureCount.
	dynamicFeatureID < 0 ifTrue: [ ^self eGet: eFeature resolve: resolve ]
							  ifFalse: [ ^(self eSettingsDelegate: eFeature) dynamicGet: self settings:  self eSettings dynamicFeatureID:  dynamicFeatureID resolve: resolve coreType:coreType   ]