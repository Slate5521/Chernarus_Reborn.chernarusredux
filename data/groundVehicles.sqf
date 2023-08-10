private _APCText   = "<t color='#ff0000'>APC</t>";
private _AAText    = "<t color='#ff7f00'>AA</t>"; 
private _CarText   = "<t color='#ffff00'>Car</t>";
private _TruckText = "<t color='#00ff00'>Truck</t>";

[
    // ================
    // APCs

    [   "Boxer (GMG)", _APCText, 1,
        "CUP_B_Boxer_GMG_GER_WDL",
        "NATO_Tropical",
        ["hide_camonet",0,"hide_mirror_1_3",0,"hide_long_antenna",0,"hide_short_antenna",0,"show_beacon_light",0,"beacon_light_on",0,"hide_mirror_1_1",0,"hide_mirror_1_2",0,"hide_mirror_2_1",0,"hide_mirror_2_2",0]
    ],
    
    [   "Boxer (HMG)", _APCText, 1,
        "CUP_B_Boxer_HMG_GER_WDL",
        "NATO_Tropical",
        ["hide_camonet",0,"hide_mirror_1_3",0,"hide_long_antenna",0,"hide_short_antenna",0,"show_beacon_light",0,"beacon_light_on",0,"hide_mirror_1_1",0,"hide_mirror_1_2",0,"hide_mirror_2_1",0,"hide_mirror_2_2",0]
    ],
    
    [   "M113A3", _APCText, 1,
        "CUP_B_M113A3_GER",
        "OliveDrab",
        ["hide_CIP_panels",1,"hide_Platoon_Markers",1,"hide_Deployment",1]
    ],
    
    [   "M113A3 (Ammo)", _APCText, 1,
        "CUP_B_M113A3_Reammo_GER",
        "OliveDrab",
        ["hide_CIP_panels",1,"hide_Platoon_Markers",1,"hide_Deployment",1]
    ],
    
    [   "M113A3 (Repair)", _APCText, 1,
        "CUP_B_M113A3_Repair_GER",
        "OliveDrab",
        ["hide_CIP_panels",1,"hide_Platoon_Markers",1,"hide_Deployment",1]
    ],
    
    [   "M113A3 (MEV)", _APCText, 1,
        "CUP_B_M113A3_Med_GER",
        "OliveDrab",
        ["hide_CIP_panels",1,"hide_Platoon_Markers",1,"hide_Deployment",1]
    ],

    [   "BRDM-2", _APCText, 2,
        "CUP_O_BRDM2_RUS",
        "NAPA",
        true
    ],

    [   "BRDM-2 (ATGM)", _APCText, 2,
        "CUP_O_BRDM2_ATGM_RUS",
        "NAPA",
        true
    ],

    [   "BTR-80A", _APCText, 2,
        "CUP_O_BTR80A_GREEN_RU",
        "RU_Green",
        true
    ],

    [   "T-34", _APCText, 2,
        "CUP_I_T34_NAPA",
        "NAPA",
        true
    ],

    // ================
    // Anti-Air
    
    [   "M1097 (Avenger)", _AAText, 1,
        "CUP_B_M1097_AVENGER_NATO",
        "NATOGreen",
        ["hide_rear_left_antenna",1,"hide_rear_right_antenna",0,"hide_left_mirror",0,"hide_right_mirror",0,"hide_brushguard",0,"hide_blue_force_tracker",1,"hide_door_front_left",1,"hide_door_front_right",0,"hide_door_rear_left",0,"hide_door_rear_right",0,"hide_cip",1,"hide_rear_view_camera",0,"hide_radio_small",0,"hide_radio_large",1,"hide_old_front_bumper",0,"hide_old_rear_bumper",0,"hide_rear_ammo_box",0]
    ],

    [
        "ZSU-23-4", _AAText, 2,
        "CUP_O_ZSU23_ChDKZ",
        "SLA",
        true
    ],

    // ================
    // Cars

    [
        "HMMWV (HMG)", _CarText, 1,
        "CUP_B_M1151_M2_USA",
        "NatoGreen",
        ["detailHide",1]
    ],

    [
        "HMMWV (GMG)", _CarText, 1,
        "CUP_B_M1151_Mk19_USA",
        "NatoGreen",
        true
    ],
    
    [
        "Nyala (HMG)", _CarText, 1,
        "CUP_B_RG31_M2_OD_USA",
        "Woodland",
        ["vs17",1,"netting",1,"SYS_crewduke",1,"SYS_boomerang",1,"SYS_satcom",1,"left_spare",0,"right_spare",0]
    ],
    
    [
        "Nyala (GMG)", _CarText, 1,
        "CUP_B_RG31_Mk19_OD_USA",
        "Woodland",
        ["vs17",1,"netting",1,"SYS_crewduke",1,"SYS_boomerang",1,"SYS_satcom",1,"left_spare",0,"right_spare",0]
    ],

    // ================
    // Trucks

    [
        "Ural", _TruckText, 2,
        "CUP_O_Ural_RU",
        "RU",
        true
    ],

    [
        "Ural (Ammo)", _TruckText, 2,
        "CUP_O_Ural_Reammo_RU",
        "RU",
        true
    ],
    
    [
        "Ural (Repair)", _TruckText, 2,
        "CUP_O_Ural_Repair_RU",
        "RU",
        true
    ],
    
    [
        "Ural (Refuel)", _TruckText, 2,
        "CUP_O_Ural_Refuel_RU",
        "RU",
        true
    ]
]