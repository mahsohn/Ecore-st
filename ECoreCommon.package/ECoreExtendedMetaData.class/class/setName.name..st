initialization
setName: eClassifier name: name
	| eAnnotation ePackage |
	eAnnotation := self getAnnotation: eClassifier demandCreate: true.
	(eAnnotation getDetails) put: name at: 'name'.
	(self getExtendedMetaData: eClassifier) setName: name.
	ePackage := eClassifier getEPackage.
	ePackage ifNil: [ (self getExtendedMetaData: ePackage) rename: eClassifier name: name ]