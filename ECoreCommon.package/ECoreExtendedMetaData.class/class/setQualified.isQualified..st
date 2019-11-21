initialization
setQualified: ePackage isQualified: isQualified
	| eAnnotation |
	isQualified ifTrue: [ 
			eAnnotation := self getAnnotation: ePackage demandCreate: false.
			(eAnnotation getDetails) removeKey: 'qualified'
		 ]
	ifFalse: [ 
		eAnnotation := self getAnnotation: ePackage demandCreate: true.
		eAnnotation getDetails put: false at: 'qualified' 
		 ].
	(self getExtendedMetaData: ePackage) setQualified: isQualified