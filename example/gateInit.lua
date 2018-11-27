return {
    Type = "Pegasus"; -- Used for the gate styling & animation.
    multiDHD = false; -- Allow the gate to have multiple DHD connected to it
    Address = "[1][2][3][4][5][6][7][78][9]"; -- Can be between 7 & 9 digit.
    randomAddress = false; -- Will the gate's address be randomly generated ?
	Galaxy = ""; -- The Galaxy the gate is part of.
    Network = ""; -- The network the gate is part of within the Galaxy.
    outgoingDial = 3; -- Default outgoingDial animation if none given.
    incomingDial = 2; -- The incomingDial animation used by the gate. Can be 0, 1, 2 or 3
}