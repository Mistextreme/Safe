Config.Garages = {
    ['boat_sandy'] = {
        Type = "Boat",
        CenterOfZone = vec3(1446.8401, 3851.8652, 30.5954),
        SpawnCoords = vec4(1446.8401, 3851.8652, 30.5954, 35.7618),
        AccessCoords = vec4(1421.2910, 3824.1465, 30.8009, 192.8180),
        DisplayBlip = false, -- You can add this to all locations to disable marker and make location secret!
        DisablePed = true, -- You can add this to all peds support locations to disable ped only for this garage!
        Zone = function() -- Zone to hide boats.
            return PolyZone:Create({
                vector2(1430.3371582032, 3843.6975097656),
                vector2(1433.9084472656, 3862.3522949218),
                vector2(1460.7420654296, 3856.626953125),
                vector2(1459.5278320312, 3835.4538574218)
              }, {
                name="boat_sandy",
              })
        end,
    },
    ['boat_01'] = {
        Type = "Boat",
        CenterOfZone = vec3(-808.9336, -1507.7520, -0.0865),
        SpawnCoords = vec4(-797.7386, -1502.9159, -0.3923, 111.3077),
        AccessCoords = vec4(-787.8273, -1490.0138, 0.5952, 284.4504),
        Zone = function() -- To hide boats
            return PolyZone:Create({
                vector2(-810.30242919922, -1501.6666259766),
                vector2(-799.03936767578, -1497.6520996094),
                vector2(-795.13403320312, -1508.2467041016),
                vector2(-806.12774658204, -1512.168798828),
                vector2(-803.03295898438, -1521.4702148438),
                vector2(-815.2230834961, -1524.6854248046),
                vector2(-821.38208007812, -1505.1107177734)
              }, {
                name="boat_01",
                debugPoly=false,
              })
        end,
    },
    ['boat_molo'] = {
        Type = "Boat",
        CenterOfZone = vec3(-1649.4175, -1182.8441, 0.2585),
        SpawnCoords = vec4(-1649.4175, -1182.8441, 1.2585, 135.4835),
        AccessCoords = vec4(-1616.3324, -1122.0651, 1.5731, 102.9045),
        Zone = function() -- To hide boats
            return PolyZone:Create({
                vector2(-1626.441040039, -1178.545288086),
                vector2(-1649.2067871094, -1201.1876220704),
                vector2(-1672.7014160156, -1186.2346191406),
                vector2(-1646.8978271484, -1158.094116211)
              }, {
                name="boat_molo",
                minZ = -0.16617453098298,
                maxZ = 4.3936171531678
              })
        end,
    },
    ['helipad_boatscenter'] = {
        Type = "Helicopter",
        CenterOfZone = vec3(-724.7192, -1444.0061, 6.3536),
        SpawnCoords = vec4(-724.7192, -1444.0061, 6.3536, 234.7011),
        AccessCoords = vec4(-705.8762, -1394.0741, 4.1503, 91.4661),
        Zone = function() -- To hide planes
            return CircleZone:Create(vector3(-724.09, -1443.82, 5.0), 9.0, {
                name="helipad_boatscenter",
                useZ=false,
                --debugPoly=true
              })                     
        end,
    },
    ['sandy_helipad'] = {
        Type = "Helicopter",
        CenterOfZone = vec3(1770.3042, 3239.5020, 42.1354),
        SpawnCoords = vec4(1770.3042, 3239.5020, 42.1354, 333.7859),
        AccessCoords = vec4(1780.8346, 3235.5950, 41.3918, 341.0812),
        Zone = function() -- To hide planes
            return PolyZone:Create({
                vector2(1761.8009033204, 3245.2263183594),
                vector2(1776.1452636718, 3247.8637695312),
                vector2(1779.3111572266, 3233.8706054688),
                vector2(1765.4714355468, 3231.0581054688)
              }, {
                name="sandy_helipad",
                minZ = 41.80030822754,
                maxZ = 43.360664367676
              })      
        end,
    },
    ['airport_hangar'] = {
        Type = "Plane",
        CenterOfZone = vec3(-979.8603, -2999.8867, 13.9450),
        SpawnCoords = vec4(-979.8603, -2999.8867, 13.9450, 60.8329),
        AccessCoords = vec4(-941.1902, -2956.4246, 12.9451, 125.2828),
        Zone = function() -- To hide planes
            return PolyZone:Create({
                vector2(-936.9926147461, -2980.9899902344),
                vector2(-969.46514892578, -3043.4111328125),
                vector2(-1027.5487060546, -3012.435546875),
                vector2(-987.51989746094, -2958.5170898438)
              }, {
                name="airport_hangar",
                minZ = 13.945004463196,
                maxZ = 15.784552574158
              })   
        end,
    },
    ['beach_garage'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-1193.4565, -1489.9276, 4.3797),
        Zone = function()
            return PolyZone:Create({
                vector2(-1180.3287353516, -1495.6538085938),
                vector2(-1195.1118164062, -1474.7615966796),
                vector2(-1206.310546875, -1482.765991211),
                vector2(-1191.6154785156, -1503.4686279296)
            }, {
                name="beach_garage",
                minZ = 4.3655805587768,
                maxZ = 4.3796644210816
            })
        end,
    },
    ['ammu_01'] = {
        OneSpawn = true,
        SpawnCoords = vec4(-1336.1306, -395.4825, 35.5545, 298.1131),
        AccessCoords = vec4(-1328.9280, -401.4549, 35.5988, 21.9894),
        Type = "Vehicle",
        CenterOfZone = vec3(-1332.7397, -393.8478, 36.5536),
        AlternativeSpawnCoords = {
          vec4(-1345.2596, -399.7505, 36.0989, 294.8187),
          vec4(-1333.4955, -393.4689, 36.1675, 296.8273)
        },
        Zone = function()
            return PolyZone:Create({
                vector2(-1345.0607910156, -409.23037719726),
                vector2(-1350.7904052734, -398.9833984375),
                vector2(-1322.5408935546, -381.3434753418),
                vector2(-1317.9185791016, -389.7082824707),
                vector2(-1319.2091064454, -394.16201782226)
            }, {
                name="ammu_01",
                debugPoly=false,
            })
        end,
    },
    ['docs01'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(1489.8910, 3745.5564, 33.8227),
        Zone = function()
            return PolyZone:Create({
                vector2(1504.7147216796, 3767.9760742188),
                vector2(1443.2393798828, 3733.5693359375),
                vector2(1450.7098388672, 3713.0070800782),
                vector2(1528.6862792968, 3754.0263671875),
                vector2(1529.9656982422, 3761.12890625),
                vector2(1528.6497802734, 3767.3310546875),
                vector2(1523.836303711, 3771.7900390625)
            }, {
                name="garage_sand01",
                debugPoly=false,
            })
        end,
    },
    ['delperro_01'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-1520.3113, -557.6459, 25.7079),
        Zone = function()
            return PolyZone:Create({
                vector2(-1543.564819336, -559.9599609375),
                vector2(-1513.00390625, -539.66241455078),
                vector2(-1501.197265625, -557.4428100586),
                vector2(-1523.0111083984, -571.72344970704),
                vector2(-1526.6048583984, -566.07873535156),
                vector2(-1532.5773925782, -559.93103027344),
                vector2(-1539.771484375, -564.25274658204)
              }, {
                name="garage_delperro",
                debugPoly=false,
              })              
        end,
    },
    ['casino'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(866.5560, -30.9815, 78.7642),
        Zone = function()
            return PolyZone:Create({
                vector2(870.0814819336, -6.8248472213746),
                vector2(850.69409179688, -38.676990509034),
                vector2(862.01403808594, -49.966125488282),
                vector2(883.79858398438, -17.774341583252)
              }, {
                name="casino",
                minZ = 78.760353088378,
                maxZ = 78.76416015625
              })          
        end,
    },
    ['vinewood_bank'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(699.4311, 243.1379, 93.0128),
        Zone = function()
            return PolyZone:Create({
                vector2(667.37762451172, 231.72360229492),
                vector2(688.63897705078, 267.0578918457),
                vector2(711.73345947266, 254.22463989258),
                vector2(696.1967163086, 223.89498901368)
              }, {
                name="vinewood_bank",
                minZ = 92.478355407714,
                maxZ = 94.21484375
              })      
        end,
    },
    ['hotel_garage_eclipse'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-610.7391, 188.6012, 69.8990),
        Zone = function()
            return PolyZone:Create({
                vector2(-630.44073486328, 182.16981506348),
                vector2(-587.4306640625, 181.90072631836),
                vector2(-587.55364990234, 203.32598876954),
                vector2(-634.85870361328, 202.47143554688)
              }, {
                name="hotel_garage_eclipse",
                minZ = 66.194396972656,
                maxZ = 71.54182434082
              })  
        end,
    },
    ['mirror_park'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(1026.0629, -776.4194, 58.0325),
        Zone = function()
            return PolyZone:Create({
                vector2(1014.1467895508, -766.9732055664),
                vector2(1023.2966918946, -756.1156616211),
                vector2(1031.587524414, -761.81146240234),
                vector2(1027.6463623046, -769.70220947266),
                vector2(1042.3239746094, -777.7603149414),
                vector2(1042.6549072266, -786.96459960938),
                vector2(1024.396484375, -784.99505615234)
              }, {
                name="mirror_park",
                minZ = 57.856304168702,
                maxZ = 58.011577606202
              })              
        end,
    },
    ['mission_row'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(495.3409, -1330.1674, 29.3390),
        Zone = function()
            return PolyZone:Create({
                vector2(501.54037475586, -1337.34765625),
                vector2(484.6036682129, -1336.4100341796),
                vector2(483.3249206543, -1333.8431396484),
                vector2(492.10006713868, -1325.978515625),
                vector2(490.13928222656, -1315.5903320312),
                vector2(494.15216064454, -1314.2087402344),
                vector2(498.4910583496, -1319.9489746094)
              }, {
                name="mission_row",
                minZ = 29.193019866944,
                maxZ = 29.31869506836
              })          
        end,
    },
    ['square_center'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(125.9277, -1067.1901, 29.1924),
        Zone = function()
            return PolyZone:Create({
                vector2(146.98921203614, -1063.5876464844),
                vector2(156.32815551758, -1081.469116211),
                vector2(112.55073547364, -1082.2276611328),
                vector2(104.24295043946, -1080.1257324218),
                vector2(109.75745391846, -1050.176147461)
              }, {
                name="square_center",
                minZ = 29.033863067626,
                maxZ = 29.232782363892
              })        
        end,
    },
    ['square_center_02'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(41.7317, -872.1757, 30.4324),
        Zone = function()
            return PolyZone:Create({
                vector2(33.835067749024, -842.65441894532),
                vector2(64.979766845704, -856.50177001954),
                vector2(59.28296661377, -872.26733398438),
                vector2(53.389045715332, -870.6810913086),
                vector2(51.00632095337, -878.06225585938),
                vector2(56.001667022706, -880.3402709961),
                vector2(48.47452545166, -902.30017089844),
                vector2(20.860105514526, -890.4878540039)
              }, {
                name="square_center_02",
                minZ = 29.833974838256,
                maxZ = 30.858846664428
              }) 
        end,
    },
    ['uwu_cafe'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-583.9371, -1118.7162, 22.1781),
        Zone = function()
            return PolyZone:Create({
                vector2(-562.10809326172, -1091.3386230468),
                vector2(-594.86572265625, -1089.355102539),
                vector2(-593.28491210938, -1140.5736083984),
                vector2(-570.14434814454, -1141.064819336)
              }, {
                name="uwu_cafe",
                minZ = 22.13484954834,
                maxZ = 22.324422836304
              })
        end,
    },
    ['airport'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-974.1680, -2700.0845, 13.8565),
        Zone = function()
            return PolyZone:Create({
                vector2(-988.07836914062, -2702.9077148438),
                vector2(-963.62316894532, -2711.595703125),
                vector2(-950.1098022461, -2707.7202148438),
                vector2(-980.1264038086, -2691.7353515625)
              }, {
                name="airport",
                minZ = 13.768326759338,
                maxZ = 13.830560684204
              })
        end,
    },
    ['vespucci_boats'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-804.4289, -1305.1119, 5.0003),
        Zone = function()
            return PolyZone:Create({
                vector2(-812.77825927734, -1272.5573730468),
                vector2(-769.87799072266, -1280.3099365234),
                vector2(-770.48724365234, -1293.8358154296),
                vector2(-782.94329833984, -1292.2525634766),
                vector2(-782.49755859375, -1298.5014648438),
                vector2(-798.77844238282, -1316.9323730468),
                vector2(-802.76586914062, -1323.0805664062),
                vector2(-816.32696533204, -1319.4497070312)
              }, {
                name="vespucci_boats",
                minZ = 4.9941687583924,
                maxZ = 9.614881515503
              })
        end,
    },
    ['redparking'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-329.9109, -758.9215, 33.9617),
        Zone = function()
            return PolyZone:Create({
                vector2(-352.9308166504, -731.62896728516),
                vector2(-278.34912109375, -758.3486328125),
                vector2(-288.49700927734, -772.21087646484),
                vector2(-318.0859375, -767.22723388672),
                vector2(-331.55487060546, -778.36932373046),
                vector2(-353.26336669922, -780.23614501954)
              }, {
                name="redparking",
                minZ = 32.964389801026,
                maxZ = 36.02554321289
              })
        end,
    },
    ['ammu_docs'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(824.8769, -2128.4355, 29.2886),
        Zone = function()
            return PolyZone:Create({
                vector2(839.35766601562, -2130.787109375),
                vector2(839.9691772461, -2120.8562011718),
                vector2(811.9692993164, -2118.6291503906),
                vector2(810.49157714844, -2135.0632324218),
                vector2(811.14166259766, -2144.5830078125),
                vector2(824.14343261718, -2144.7836914062),
                vector2(825.5546875, -2134.9279785156)
              }, {
                name="ammu_docs",
                minZ = 29.706657409668,
                maxZ = 31.348268508912
              })
        end,
    },
    ['dollarpills'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(58.5516, -1563.6105, 29.4601),
        Zone = function()
            return PolyZone:Create({
                vector2(58.740287780762, -1573.484741211),
                vector2(36.75782775879, -1599.3889160156),
                vector2(21.635528564454, -1590.8928222656),
                vector2(41.058917999268, -1567.228515625),
                vector2(44.832962036132, -1570.0194091796),
                vector2(55.64478302002, -1555.398071289),
                vector2(55.08014678955, -1548.3330078125),
                vector2(69.161590576172, -1532.9647216796),
                vector2(84.717262268066, -1543.9669189454)
              }, {
                name="dollarpills",
                minZ = 29.460248947144,
                maxZ = 31.20481300354
              })
        end,
    },
    ['wine_01'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(-1897.5251, 2022.3728, 140.7756),
        Zone = function()
            return PolyZone:Create({
                vector2(-1902.3635253906, 1999.3663330078),
                vector2(-1908.8793945312, 1998.8205566406),
                vector2(-1909.1398925782, 2021.9152832032),
                vector2(-1923.1987304688, 2036.1044921875),
                vector2(-1920.1123046875, 2045.4499511718),
                vector2(-1884.318359375, 2032.5087890625),
                vector2(-1885.8475341796, 2011.3209228516)
              }, {
                name="wine_01",
                minZ = 141.9054260254,
                maxZ = 144.63801574708
              })
        end,
    },
    ['grapeseed_station'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(1683.2842, 4921.4990, 42.0781),
        Zone = function()
            return PolyZone:Create({
                vector2(1675.5782470704, 4921.6455078125),
                vector2(1686.6359863282, 4914.9794921875),
                vector2(1691.4401855468, 4920.0981445312),
                vector2(1680.014038086, 4928.6899414062)
              }, {
                name="grapeseed_station",
                minZ = 42.055362701416,
                maxZ = 43.260334014892
              })
        end,
    },
    ['prison'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(1872.5712, 2589.0386, 45.6720),
        Zone = function()
            return PolyZone:Create({
                vector2(1878.0809326172, 2674.6181640625),
                vector2(1866.7685546875, 2676.6027832032),
                vector2(1866.718383789, 2534.9506835938),
                vector2(1878.0456542968, 2534.1516113282)
              }, {
                name="prison",
                minZ = 45.67179107666,
                maxZ = 47.08419418335
              })
        end,
    },
    ['paleto_station'] = {
        Type = "Vehicle",
        CenterOfZone = vec3(141.5692, 6588.5576, 31.8642),
        Zone = function()
            return PolyZone:Create({
                vector2(118.63697814942, 6588.5502929688),
                vector2(152.04232788086, 6561.6860351562),
                vector2(168.39141845704, 6570.0615234375),
                vector2(135.33515930176, 6614.0830078125)
              }, {
                name="paleto_station",
                minZ = 29.46438407898,
                maxZ = 34.408405303956
              })
        end,
    },
}