SECTIONS {
	/* First we need the .init section, containing the code to 
       be run first. We allow room for the ATAGs and stack and conform to 
       the bootloader's expectation by putting this code at 0x8000. */
	.init 0x8000 : {
		*(.init)
	}
	
	/* Next we put the rest of the code and data. */
	.text : {
		*(.text)
	}
	
	.data : {
		*(.data)
	}

	/* Finally comes everything else. A fun trick here is to put all other
	   sections into this section, which will be discarded by default. */
	/DISCARD/ : {
		*(*)
	}
}
