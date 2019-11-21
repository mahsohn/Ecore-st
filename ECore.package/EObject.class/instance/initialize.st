initialization
initialize
	super initialize.
	EDELIVER := 1.
	EDYNAMIC_CLASS := 2.
	EPROXY := 4.
	ELAST_NOTIFIER_FLAG := EPROXY.
	ELAST_EOBJECT_FLAG  := ELAST_NOTIFIER_FLAG .
	eflags := EDELIVER.