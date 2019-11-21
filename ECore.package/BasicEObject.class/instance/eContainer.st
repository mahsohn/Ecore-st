as yet unclassified
eContainer
	| result resolved eContainerFeatureID notificationChain|
	result := self eInternalContainer.
	result ifNotNil: [ 
		result eIsProxy ifTrue: [ 
			resolved := self eResolveProxy: result.
			resolved == result ifFalse: [ 
				eContainerFeatureID := self eContainerFeatureID.
				notificationChain := self eBasicRemoveFromContainer: nil.
				self eBasicContainer: resolved id: eContainerFeatureID.
				notificationChain ifNotNil: [ notificationChain dispatch ].
				self eNotificationRequired & (eContainerFeatureID > BasicEObject EOPPOSITE_FEATURE_BASE) ifTrue: [ self eNotify: (ENotification new: self a: ECoreNotification RESOLVE b: eContainerFeatureID c: result d: resolved) ].
				^resolved.
				 ]
			 ]
		 ].
	 ^result