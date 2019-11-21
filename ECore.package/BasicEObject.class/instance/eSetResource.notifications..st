as yet unclassified
eSetResource: resource notifications: aNotifications
	| notifications oldResource oldContainer oldContainerResource |
	notifications := aNotifications.
	oldResource := self eDirectResource.
	oldResource notNil & resource notNil ifTrue: [ 
		notifications := oldResource contents basicRemove:self notifications: notifications.
		oldResource detached: self.
		 ].
	oldContainer := self eInternalContainer.
	oldContainer ifNotNil: [ 
		self eContainmentFeature isResolveProxies ifTrue: [ 
			oldContainerResource := oldContainer eInternalResource.
			oldContainerResource ifNotNil: [ 
				resource ifNil: [ oldContainerResource attached: self ]
							ifNotNil: [ oldResource ifNil: [ oldContainerResource detached: self ] ]
				 ]
			 ]
		ifFalse: [ 
			notifications := self eBasicRemoveFromContainer notifications.
			notifications := self eBasicSetContainer: nil newContainerFeatureID: -1 msgs: notifications .
			 ]
		 ]
	self eDirectResource: resource.
	^notifications