as yet unclassified
eContainingFeature
	| eContainer eContainerFeatureID base |
	eContainer := self eInternalContainer.
	eContainer ifNil: [ ^nil ].
	base := BasicEObject EOPPOSITE_FEATURE_BASE.
	eContainerFeatureID := self eContainerFeatureID.
	eContainerFeatureID <= base ifTrue: [ 
		^eContainer eClass eStructuralFeature: base -eContainerFeatureID.
		 ]
	ifFalse: [ ^(self eClass eStructuralFeature:  eContainerFeatureID) eOpposite ]