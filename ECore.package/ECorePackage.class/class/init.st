private-initialization
init
	"Creates,registers and initializes the Package for this model, and for any others upon which it depends."

	| registeredEcorePackage theEcorePackage |
	isInited := true.