return {
    --[[These value can be changed]]--
    Type = "Pegasus"; -- Used for the gate styling & animation.
    multiDHD = false; -- Allow the gate to have multiple DHD connected to it
    Address = "[1][2][3][4][5][6][7][78][9]"; -- Can be between 7 & 9 digit.
    randomAddress = false; -- Will the gate's address be randomly generated ?
	Galaxy = ""; -- The Galaxy the gate is part of.
    Network = ""; -- The network the gate is part of within the Galaxy.
    outgoingDial = 3; -- Mostly used by Remote DHD.
    incomingDial = 0; -- The incomingDial style this gate will use. Can be 0(), 1(), 2() or 3()
}