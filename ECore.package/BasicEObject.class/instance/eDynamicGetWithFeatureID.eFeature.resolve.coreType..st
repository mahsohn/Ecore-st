as yet unclassified
eDynamicGetWithFeatureID: dynamicFeatureID eFeature: eFeature resolve: resolve coreType: coreType
	dynamicFeatureID < 0 ifTrue: [ ^ self eOpenGet:eFeature resolve: resolve ]
								ifFalse: [ ^(self eSettingDelegate: eFeature) dynamicGet:self settings: self eSettings dynamicFeatureID: dynamicFeatureID resolve: resolve coreType: coreType]