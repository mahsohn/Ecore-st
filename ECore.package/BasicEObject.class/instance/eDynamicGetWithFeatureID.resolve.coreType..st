as yet unclassified
eDynamicGetWithFeatureID: featureID resolve: resolve coreType: coreType
	^ self eDynamicGetWithFeatureID: featureID - self eStaticFeatureCount   
	eFeature: self  eClass 
	 resolve: resolve
	  coreType:  coreType