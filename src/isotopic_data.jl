# these are scraped from NIST
# maps atomic number to another dict mapping atomic weight to absolute abundance (abundances for an 
# element sum to 1)
# this isn't an array, because not every element is present
const isotopic_abundances = Dict(
    1 => Dict(1=>1.0, 2=>1e-10, ), #tiny non-zero number to avoid -Inf when you take the log
    2 => Dict(3=>1.34e-6, 4=>0.99999866, ),
    3 => Dict(6=>0.0759, 7=>0.9241, ),
    4 => Dict(9=>1.0, ),
    5 => Dict(10=>0.199, 11=>0.801, ),
    6 => Dict(12=>0.9893, 13=>0.0107, ),
    7 => Dict(14=>0.99636, 15=>0.00364, ),
    8 => Dict(16=>0.99757, 17=>0.00038, 18=>0.00205, ),
    9 => Dict(19=>1.0, ),
    10 => Dict(20=>0.9048, 21=>0.0027, 22=>0.0925, ),
    11 => Dict(23=>1.0, ),
    12 => Dict(24=>0.7899, 25=>0.1, 26=>0.1101, ),
    13 => Dict(27=>1.0, ),
    14 => Dict(28=>0.92223, 29=>0.04685, 30=>0.03092, ),
    15 => Dict(31=>1.0, ),
    16 => Dict(32=>0.9499, 33=>0.0075, 34=>0.0425, 36=>0.0001, ),
    17 => Dict(35=>0.7576, 37=>0.2424, ),
    18 => Dict(36=>0.003336, 38=>0.000629, 40=>0.996035, ),
    19 => Dict(39=>0.932581, 40=>0.000117, 41=>0.067302, ),
    20 => Dict(40=>0.96941, 42=>0.00647, 43=>0.00135, 44=>0.02086, 46=>4.0e-5, 48=>0.00187, ),
    21 => Dict(45=>1.0, ),
    22 => Dict(46=>0.0825, 47=>0.0744, 48=>0.7372, 49=>0.0541, 50=>0.0518, ),
    23 => Dict(50=>0.0025, 51=>0.9975, ),
    24 => Dict(50=>0.04345, 52=>0.83789, 53=>0.09501, 54=>0.02365, ),
    25 => Dict(55=>1.0, ),
    26 => Dict(54=>0.05845, 56=>0.91754, 57=>0.02119, 58=>0.00282, ),
    27 => Dict(59=>1.0, ),
    28 => Dict(58=>0.68077, 60=>0.26223, 61=>0.011399, 62=>0.036346, 64=>0.009255, ),
    29 => Dict(63=>0.6915, 65=>0.3085, ),
    30 => Dict(64=>0.4917, 66=>0.2773, 67=>0.0404, 68=>0.1845, 70=>0.0061, ),
    31 => Dict(69=>0.60108, 71=>0.39892, ),
    32 => Dict(70=>0.2057, 72=>0.2745, 73=>0.0775, 74=>0.365, 76=>0.0773, ),
    33 => Dict(75=>1.0, ),
    34 => Dict(74=>0.0089, 76=>0.0937, 77=>0.0763, 78=>0.2377, 80=>0.4961, 82=>0.0873, ),
    35 => Dict(79=>0.5069, 81=>0.4931, ),
    36 => Dict(78=>0.00355, 80=>0.02286, 82=>0.11593, 83=>0.115, 84=>0.56987, 86=>0.17279, ),
    37 => Dict(85=>0.7217, 87=>0.2783, ),
    38 => Dict(84=>0.0056, 86=>0.0986, 87=>0.07, 88=>0.8258, ),
    39 => Dict(89=>1.0, ),
    40 => Dict(90=>0.5145, 91=>0.1122, 92=>0.1715, 94=>0.1738, 96=>0.028, ),
    41 => Dict(93=>1.0, ),
    42 => Dict(92=>0.1453, 94=>0.0915, 95=>0.1584, 96=>0.1667, 97=>0.096, 98=>0.2439, 100=>0.0982, ),
    44 => Dict(96=>0.0554, 98=>0.0187, 99=>0.1276, 100=>0.126, 101=>0.1706, 102=>0.3155, 104=>0.1862, ),
    45 => Dict(103=>1.0, ),
    46 => Dict(102=>0.0102, 104=>0.1114, 105=>0.2233, 106=>0.2733, 108=>0.2646, 110=>0.1172, ),
    47 => Dict(107=>0.51839, 109=>0.48161, ),
    48 => Dict(106=>0.0125, 108=>0.0089, 110=>0.1249, 111=>0.128, 112=>0.2413, 113=>0.1222, 114=>0.2873, 116=>0.0749, ),
    49 => Dict(113=>0.0429, 115=>0.9571, ),
    50 => Dict(112=>0.0097, 114=>0.0066, 115=>0.0034, 116=>0.1454, 117=>0.0768, 118=>0.2422, 119=>0.0859, 120=>0.3258, 122=>0.0463, 124=>0.0579, ),
    51 => Dict(121=>0.5721, 123=>0.4279, ),
    52 => Dict(120=>0.0009, 122=>0.0255, 123=>0.0089, 124=>0.0474, 125=>0.0707, 126=>0.1884, 128=>0.3174, 130=>0.3408, ),
    53 => Dict(127=>1.0, ),
    54 => Dict(124=>0.000952, 126=>0.00089, 128=>0.019102, 129=>0.264006, 130=>0.04071, 131=>0.212324, 132=>0.269086, 134=>0.104357, 136=>0.088573, ),
    55 => Dict(133=>1.0, ),
    56 => Dict(130=>0.00106, 132=>0.00101, 134=>0.02417, 135=>0.06592, 136=>0.07854, 137=>0.11232, 138=>0.71698, ),
    57 => Dict(138=>0.0008881, 139=>0.9991119, ),
    58 => Dict(136=>0.00185, 138=>0.00251, 140=>0.8845, 142=>0.11114, ),
    59 => Dict(141=>1.0, ),
    60 => Dict(142=>0.27152, 143=>0.12174, 144=>0.23798, 145=>0.08293, 146=>0.17189, 148=>0.05756, 150=>0.05638, ),
    62 => Dict(144=>0.0307, 147=>0.1499, 148=>0.1124, 149=>0.1382, 150=>0.0738, 152=>0.2675, 154=>0.2275, ),
    63 => Dict(151=>0.4781, 153=>0.5219, ),
    64 => Dict(152=>0.002, 154=>0.0218, 155=>0.148, 156=>0.2047, 157=>0.1565, 158=>0.2484, 160=>0.2186, ),
    65 => Dict(159=>1.0, ),
    66 => Dict(156=>0.00056, 158=>0.00095, 160=>0.02329, 161=>0.18889, 162=>0.25475, 163=>0.24896, 164=>0.2826, ),
    67 => Dict(165=>1.0, ),
    68 => Dict(162=>0.00139, 164=>0.01601, 166=>0.33503, 167=>0.22869, 168=>0.26978, 170=>0.1491, ),
    69 => Dict(169=>1.0, ),
    70 => Dict(168=>0.00123, 170=>0.02982, 171=>0.1409, 172=>0.2168, 173=>0.16103, 174=>0.32026, 176=>0.12996, ),
    71 => Dict(175=>0.97401, 176=>0.02599, ),
    72 => Dict(174=>0.0016, 176=>0.0526, 177=>0.186, 178=>0.2728, 179=>0.1362, 180=>0.3508, ),
    73 => Dict(180=>0.0001201, 181=>0.9998799, ),
    74 => Dict(180=>0.0012, 182=>0.265, 183=>0.1431, 184=>0.3064, 186=>0.2843, ),
    75 => Dict(185=>0.374, 187=>0.626, ),
    76 => Dict(184=>0.0002, 186=>0.0159, 187=>0.0196, 188=>0.1324, 189=>0.1615, 190=>0.2626, 192=>0.4078, ),
    77 => Dict(191=>0.373, 193=>0.627, ),
    78 => Dict(190=>0.00012, 192=>0.00782, 194=>0.3286, 195=>0.3378, 196=>0.2521, 198=>0.07356, ),
    79 => Dict(197=>1.0, ),
    80 => Dict(196=>0.0015, 198=>0.0997, 199=>0.1687, 200=>0.231, 201=>0.1318, 202=>0.2986, 204=>0.0687, ),
    81 => Dict(203=>0.2952, 205=>0.7048, ),
    82 => Dict(204=>0.014, 206=>0.241, 207=>0.221, 208=>0.524, ),
    83 => Dict(209=>1.0, ),
    90 => Dict(232=>1.0, ),
    91 => Dict(231=>1.0, ),
    92 => Dict(234=>5.4e-5, 235=>0.007204, 238=>0.992742, ),
)

const isotopic_nuclear_spin_degeneracies = Dict(
    1 => Dict(1=>2, 2=>3, 3=>2, 4=>5),
    2 => Dict(3=>2, 4=>1, 5=>4, 6=>1, 8=>1, 9=>2, 10=>1),
    3 => Dict(4=>5, 5=>4, 6=>3, 7=>4, 8=>5, 9=>4, 11=>4),
    4 => Dict(6=>1, 7=>4, 8=>1, 9=>4, 10=>1, 11=>2, 12=>1, 14=>1),
    5 => Dict(8=>5, 9=>4, 10=>7, 11=>4, 12=>3, 13=>4, 14=>5, 16=>1),
    6 => Dict(8=>1, 10=>1, 11=>4, 12=>1, 13=>2, 14=>1, 15=>2, 16=>1, 17=>4, 18=>1, 19=>2, 20=>1, 22=>1),
    7 => Dict(11=>2, 12=>3, 13=>2, 14=>3, 15=>2, 16=>5, 17=>2, 18=>3),
    8 => Dict(12=>1, 14=>1, 15=>2, 16=>1, 17=>6, 18=>1, 19=>6, 20=>1, 22=>1, 23=>2, 24=>1, 26=>1),
    9 => Dict(14=>5, 15=>2, 16=>1, 17=>6, 18=>3, 19=>2, 20=>5, 21=>6, 23=>6, 25=>6, 26=>3),
    10 => Dict(16=>1, 17=>2, 18=>1, 19=>2, 20=>1, 21=>4, 22=>1, 23=>6, 24=>1, 25=>2, 26=>1, 28=>1, 30=>1, 32=>1, 34=>1),
    11 => Dict(18=>3, 20=>5, 21=>4, 22=>7, 23=>4, 24=>9, 25=>6, 26=>7, 27=>6, 28=>3, 29=>4, 30=>5),
    12 => Dict(20=>1, 21=>6, 22=>1, 23=>4, 24=>1, 25=>6, 26=>1, 27=>2, 28=>1, 29=>4, 30=>1, 32=>1, 34=>1, 36=>1, 38=>1, 40=>1),
    13 => Dict(22=>9, 23=>6, 24=>9, 25=>6, 26=>11, 27=>6, 28=>7, 29=>6, 30=>7, 32=>3),
    14 => Dict(22=>1, 24=>1, 25=>6, 26=>1, 27=>6, 28=>1, 29=>2, 30=>1, 31=>4, 32=>1, 33=>4, 34=>1, 36=>1, 38=>1, 40=>1, 42=>1, 44=>1),
    15 => Dict(27=>2, 28=>7, 29=>2, 30=>3, 31=>2, 32=>3, 33=>2, 34=>3, 35=>2, 36=>9),
    16 => Dict(26=>1, 28=>1, 29=>6, 30=>1, 31=>2, 32=>1, 33=>4, 34=>1, 35=>4, 36=>1, 37=>8, 38=>1, 40=>1, 42=>1, 44=>1, 46=>1, 48=>1),
    17 => Dict(32=>3, 33=>4, 34=>1, 35=>4, 36=>5, 37=>4, 38=>5, 39=>4, 40=>5),
    18 => Dict(30=>1, 31=>6, 32=>1, 33=>2, 34=>1, 35=>4, 36=>1, 37=>4, 38=>1, 39=>8, 40=>1, 41=>8, 42=>1, 44=>1, 46=>1, 48=>1, 50=>1, 52=>1),
    19 => Dict(35=>4, 36=>5, 37=>4, 38=>7, 39=>4, 40=>9, 41=>4, 42=>5, 43=>4, 44=>5, 45=>4, 47=>2),
    20 => Dict(34=>1, 36=>1, 37=>4, 38=>1, 39=>4, 40=>1, 41=>8, 42=>1, 43=>8, 44=>1, 45=>8, 46=>1, 47=>8, 48=>1, 49=>4, 50=>1, 52=>1, 54=>1, 56=>1),
    21 => Dict(40=>9, 41=>8, 42=>1, 43=>8, 44=>5, 45=>8, 46=>9, 47=>8, 48=>13, 49=>8, 50=>11),
    22 => Dict(38=>1, 40=>1, 41=>4, 42=>1, 43=>8, 44=>1, 45=>8, 46=>1, 47=>6, 48=>1, 49=>8, 50=>1, 51=>4, 52=>1, 54=>1, 56=>1, 58=>1, 60=>1, 62=>1),
    23 => Dict(45=>8, 46=>1, 47=>4, 48=>9, 49=>8, 50=>13, 51=>8, 52=>7, 53=>8, 54=>7, 56=>3, 63=>8),
    24 => Dict(42=>1, 44=>1, 46=>1, 47=>4, 48=>1, 49=>6, 50=>1, 51=>8, 52=>1, 53=>4, 54=>1, 55=>4, 56=>1, 58=>1, 60=>1, 62=>1, 63=>2, 64=>1, 66=>1, 68=>1),
    25 => Dict(48=>9, 49=>6, 50=>1, 51=>6, 52=>13, 53=>8, 54=>7, 55=>6, 56=>7, 57=>6, 58=>3, 60=>3, 63=>6, 69=>6),
    26 => Dict(46=>1, 48=>1, 50=>1, 51=>6, 52=>1, 53=>8, 54=>1, 55=>4, 56=>1, 57=>2, 58=>1, 59=>4, 60=>1, 62=>1, 64=>1, 66=>1, 68=>1, 69=>2, 70=>1, 72=>1, 74=>1),
    27 => Dict(54=>1, 55=>8, 56=>9, 57=>8, 58=>5, 59=>8, 60=>11, 61=>8, 62=>5, 63=>8, 64=>3, 69=>8, 74=>1),
    28 => Dict(48=>1, 50=>1, 52=>1, 54=>1, 55=>8, 56=>1, 57=>4, 58=>1, 59=>4, 60=>1, 61=>4, 62=>1, 63=>2, 64=>1, 65=>6, 66=>1, 68=>1, 69=>10, 70=>1, 72=>1, 74=>1, 76=>1, 78=>1),
    29 => Dict(57=>4, 58=>3, 59=>4, 60=>5, 61=>4, 62=>3, 63=>4, 64=>3, 65=>4, 66=>3, 67=>4, 68=>3, 69=>4),
    30 => Dict(54=>1, 56=>1, 58=>1, 59=>4, 60=>1, 61=>4, 62=>1, 63=>4, 64=>1, 65=>6, 66=>1, 67=>6, 68=>1, 69=>2, 70=>1, 71=>2, 72=>1, 74=>1, 76=>1, 78=>1, 80=>1, 82=>1, 84=>1),
    31 => Dict(61=>4, 62=>1, 63=>4, 64=>1, 65=>4, 66=>1, 67=>4, 68=>3, 69=>4, 70=>3, 71=>4, 72=>7, 73=>4, 75=>4, 76=>5, 77=>4, 78=>5, 80=>7, 81=>6),
    32 => Dict(58=>1, 60=>1, 62=>1, 63=>4, 64=>1, 65=>4, 66=>1, 67=>2, 68=>1, 69=>6, 70=>1, 71=>2, 72=>1, 73=>10, 74=>1, 75=>2, 76=>1, 77=>8, 78=>1, 80=>1, 82=>1, 84=>1, 86=>1, 88=>1, 90=>1),
    33 => Dict(63=>4, 68=>7, 69=>6, 70=>9, 71=>6, 72=>5, 73=>4, 74=>5, 75=>4, 76=>5, 77=>4, 78=>5, 79=>4, 80=>3, 81=>4),
    34 => Dict(64=>1, 66=>1, 68=>1, 69=>2, 70=>1, 72=>1, 73=>10, 74=>1, 75=>6, 76=>1, 77=>2, 78=>1, 79=>8, 80=>1, 81=>2, 82=>1, 83=>10, 84=>1, 86=>1, 88=>1, 90=>1, 92=>1, 94=>1),
    35 => Dict(70=>1, 72=>3, 73=>2, 75=>4, 76=>3, 77=>4, 78=>3, 79=>4, 80=>3, 81=>4, 82=>11, 83=>4, 84=>5, 85=>4, 87=>4),
    36 => Dict(70=>1, 72=>1, 73=>4, 74=>1, 75=>6, 76=>1, 77=>6, 78=>1, 79=>2, 80=>1, 81=>8, 82=>1, 83=>10, 84=>1, 85=>10, 86=>1, 87=>6, 88=>1, 90=>1, 92=>1, 93=>2, 94=>1, 96=>1, 98=>1, 100=>1),
    37 => Dict(77=>4, 79=>6, 80=>3, 81=>4, 82=>3, 83=>6, 84=>5, 85=>6, 86=>5, 87=>4, 88=>5, 89=>4, 90=>1, 92=>1, 93=>6, 95=>6, 97=>4),
    38 => Dict(74=>1, 76=>1, 77=>6, 78=>1, 80=>1, 81=>2, 82=>1, 83=>8, 84=>1, 85=>10, 86=>1, 87=>10, 88=>1, 89=>6, 90=>1, 91=>6, 92=>1, 93=>6, 94=>1, 95=>2, 96=>1, 97=>2, 98=>1, 99=>4, 100=>1, 102=>1, 104=>1, 106=>1),
    39 => Dict(82=>3, 83=>10, 86=>9, 87=>2, 88=>9, 89=>2, 90=>5, 91=>2, 92=>5, 93=>2, 94=>5, 95=>2, 96=>1),
    40 => Dict(78=>1, 80=>1, 82=>1, 84=>1, 86=>1, 87=>10, 88=>1, 89=>10, 90=>1, 91=>6, 92=>1, 93=>6, 94=>1, 95=>6, 96=>1, 97=>2, 98=>1, 100=>1, 102=>1, 104=>1, 106=>1, 108=>1, 110=>1, 112=>1),
    41 => Dict(90=>17, 91=>10, 93=>10, 94=>13, 95=>10, 96=>13, 97=>10, 98=>3, 99=>10, 100=>3, 102=>3),
    42 => Dict(84=>1, 86=>1, 87=>8, 88=>1, 90=>1, 91=>10, 92=>1, 93=>6, 94=>1, 95=>6, 96=>1, 97=>6, 98=>1, 99=>2, 100=>1, 101=>2, 102=>1, 104=>1, 106=>1, 108=>1, 110=>1, 112=>1, 114=>1, 116=>1),
    43 => Dict(90=>3, 93=>10, 94=>15, 95=>10, 96=>15, 97=>10, 99=>10, 100=>3, 101=>10, 102=>3, 103=>6),
    44 => Dict(88=>1, 90=>1, 92=>1, 94=>1, 95=>6, 96=>1, 97=>6, 98=>1, 99=>6, 100=>1, 101=>6, 102=>1, 103=>4, 104=>1, 105=>4, 106=>1, 108=>1, 110=>1, 111=>6, 112=>1, 114=>1, 116=>1, 118=>1, 120=>1, 122=>1, 124=>1),
    45 => Dict(95=>10, 97=>10, 99=>2, 100=>3, 101=>2, 103=>2, 104=>3, 105=>8, 106=>3, 107=>8, 108=>3, 109=>8, 110=>3, 114=>3, 116=>3),
    46 => Dict(92=>1, 94=>1, 96=>1, 98=>1, 100=>1, 101=>6, 102=>1, 103=>6, 104=>1, 105=>6, 106=>1, 107=>6, 108=>1, 109=>6, 110=>1, 111=>6, 112=>1, 114=>1, 116=>1, 118=>1, 120=>1, 122=>1, 124=>1, 126=>1, 128=>1),
    47 => Dict(101=>10, 103=>8, 104=>11, 105=>2, 106=>3, 107=>2, 108=>3, 109=>2, 110=>3, 111=>2, 113=>2, 114=>3, 115=>2),
    48 => Dict(96=>1, 98=>1, 100=>1, 102=>1, 104=>1, 105=>6, 106=>1, 107=>6, 108=>1, 109=>6, 110=>1, 111=>2, 112=>1, 113=>2, 114=>1, 115=>2, 116=>1, 117=>2, 118=>1, 119=>4, 120=>1, 122=>1, 124=>1, 126=>1, 128=>1, 129=>4, 130=>1, 132=>1, 134=>1),
    49 => Dict(105=>10, 106=>15, 107=>10, 108=>15, 109=>10, 110=>15, 111=>10, 112=>3, 113=>10, 114=>3, 115=>10, 116=>3, 117=>10, 118=>3, 119=>10, 120=>3, 121=>10, 122=>3, 125=>10),
    50 => Dict(100=>1, 102=>1, 104=>1, 106=>1, 108=>1, 109=>6, 110=>1, 111=>8, 112=>1, 113=>2, 114=>1, 115=>2, 116=>1, 117=>2, 118=>1, 119=>2, 120=>1, 121=>4, 122=>1, 123=>12, 124=>1, 125=>12, 126=>1, 128=>1, 129=>4, 130=>1, 132=>1, 133=>8, 134=>1, 136=>1, 138=>1),
    51 => Dict(112=>7, 113=>6, 114=>7, 115=>6, 116=>7, 117=>6, 118=>3, 119=>6, 120=>17, 121=>6, 122=>5, 123=>8, 124=>7, 125=>8, 127=>8, 128=>11, 129=>8, 136=>3),
    52 => Dict(106=>1, 108=>1, 110=>1, 112=>1, 114=>1, 115=>8, 116=>1, 117=>2, 118=>1, 119=>2, 120=>1, 121=>2, 122=>1, 123=>2, 124=>1, 125=>2, 126=>1, 127=>4, 128=>1, 129=>4, 130=>1, 131=>4, 132=>1, 134=>1, 136=>1, 138=>1, 140=>1, 142=>1),
    53 => Dict(109=>2, 113=>6, 114=>3, 116=>3, 118=>5, 119=>6, 120=>5, 121=>6, 122=>3, 123=>6, 124=>5, 125=>6, 126=>5, 127=>6, 128=>3, 129=>8, 130=>11, 131=>8, 132=>9, 133=>8, 135=>8),
    54 => Dict(110=>1, 112=>1, 114=>1, 116=>1, 118=>1, 120=>1, 122=>1, 124=>1, 126=>1, 127=>2, 128=>1, 129=>2, 130=>1, 131=>4, 132=>1, 133=>4, 134=>1, 135=>4, 136=>1, 137=>8, 138=>1, 139=>4, 140=>1, 142=>1, 143=>6, 144=>1, 146=>1, 148=>1),
    55 => Dict(118=>5, 119=>10, 122=>3, 123=>2, 124=>3, 126=>3, 127=>2, 128=>3, 129=>2, 130=>3, 131=>6, 132=>5, 133=>8, 134=>9, 135=>8, 136=>11, 137=>8, 138=>7, 139=>8, 140=>3, 141=>8, 142=>1, 143=>4, 145=>4, 146=>3),
    56 => Dict(114=>1, 116=>1, 118=>1, 120=>1, 122=>1, 124=>1, 126=>1, 127=>2, 128=>1, 129=>2, 130=>1, 131=>2, 132=>1, 133=>2, 134=>1, 135=>4, 136=>1, 137=>4, 138=>1, 139=>8, 140=>1, 141=>4, 142=>1, 143=>6, 144=>1, 145=>6, 146=>1, 148=>1, 150=>1, 152=>1),
    57 => Dict(131=>4, 132=>5, 133=>6, 134=>3, 135=>6, 136=>3, 137=>8, 138=>11, 139=>8, 140=>7, 142=>5, 146=>5),
    58 => Dict(122=>1, 124=>1, 126=>1, 128=>1, 129=>6, 130=>1, 131=>8, 132=>1, 133=>2, 134=>1, 136=>1, 137=>4, 138=>1, 139=>4, 140=>1, 141=>8, 142=>1, 143=>4, 144=>1, 146=>1, 148=>1, 150=>1, 152=>1, 154=>1),
    59 => Dict(134=>5, 136=>5, 137=>6, 138=>3, 139=>6, 140=>3, 141=>6, 142=>5, 143=>8, 144=>1, 145=>8, 148=>3),
    60 => Dict(126=>1, 128=>1, 130=>1, 132=>1, 134=>1, 136=>1, 137=>2, 138=>1, 139=>4, 140=>1, 141=>4, 142=>1, 143=>8, 144=>1, 145=>8, 146=>1, 147=>6, 148=>1, 149=>6, 150=>1, 151=>4, 152=>1, 154=>1, 156=>1, 158=>1, 160=>1),
    61 => Dict(137=>12, 140=>17, 141=>6, 142=>3, 143=>6, 144=>11, 145=>6, 146=>7, 147=>8, 148=>3, 149=>8, 151=>6, 152=>3, 153=>6, 155=>6, 156=>9),
    62 => Dict(130=>1, 132=>1, 134=>1, 136=>1, 138=>1, 139=>2, 140=>1, 141=>2, 142=>1, 143=>4, 144=>1, 145=>8, 146=>1, 147=>8, 148=>1, 149=>8, 150=>1, 151=>6, 152=>1, 153=>4, 154=>1, 155=>4, 156=>1, 158=>1, 159=>6, 160=>1, 162=>1, 164=>1),
    63 => Dict(131=>4, 140=>3, 141=>6, 142=>17, 143=>6, 144=>3, 145=>6, 146=>9, 147=>6, 148=>11, 149=>6, 150=>11, 151=>6, 152=>7, 153=>6, 154=>7, 155=>6, 156=>1, 157=>6, 159=>6, 160=>3),
    64 => Dict(134=>1, 136=>1, 138=>1, 140=>1, 141=>2, 142=>1, 144=>1, 145=>2, 146=>1, 147=>8, 148=>1, 149=>8, 150=>1, 151=>8, 152=>1, 153=>4, 154=>1, 155=>4, 156=>1, 157=>4, 158=>1, 159=>4, 160=>1, 161=>6, 162=>1, 164=>1, 166=>1, 168=>1),
    65 => Dict(142=>3, 144=>3, 146=>11, 148=>5, 149=>2, 152=>5, 153=>6, 154=>7, 155=>4, 156=>7, 157=>4, 158=>7, 159=>4, 160=>7, 161=>4, 162=>3, 163=>4),
    66 => Dict(140=>1, 142=>1, 144=>1, 146=>1, 148=>1, 150=>1, 152=>1, 154=>1, 155=>4, 156=>1, 157=>4, 158=>1, 159=>4, 160=>1, 161=>6, 162=>1, 163=>6, 164=>1, 165=>8, 166=>1, 168=>1, 170=>1, 172=>1),
    67 => Dict(152=>5, 153=>12, 154=>17, 155=>6, 156=>9, 157=>8, 158=>11, 159=>8, 160=>11, 161=>8, 162=>3, 163=>8, 164=>3, 165=>8, 166=>1, 167=>8, 168=>7, 169=>8),
    68 => Dict(144=>1, 146=>1, 148=>1, 150=>1, 152=>1, 154=>1, 155=>8, 156=>1, 157=>4, 158=>1, 159=>4, 160=>1, 161=>4, 162=>1, 163=>6, 164=>1, 165=>6, 166=>1, 167=>8, 168=>1, 169=>2, 170=>1, 171=>6, 172=>1, 174=>1, 176=>1, 178=>1),
    69 => Dict(147=>12, 154=>19, 155=>12, 156=>5, 157=>2, 158=>5, 159=>6, 160=>3, 161=>8, 162=>11, 163=>2, 164=>13, 165=>2, 166=>5, 167=>2, 168=>7, 169=>2, 170=>3, 171=>2, 172=>5),
    70 => Dict(148=>1, 150=>1, 152=>1, 153=>8, 154=>1, 156=>1, 157=>8, 158=>1, 160=>1, 161=>4, 162=>1, 163=>4, 164=>1, 165=>6, 166=>1, 167=>6, 168=>1, 169=>8, 170=>1, 171=>2, 172=>1, 173=>6, 174=>1, 176=>1, 178=>1, 180=>1),
    71 => Dict(151=>12, 153=>12, 155=>12, 156=>19, 161=>2, 162=>3, 165=>2, 166=>13, 167=>2, 169=>8, 170=>1, 171=>8, 172=>9, 173=>8, 175=>8, 176=>15, 177=>8, 179=>8, 180=>11),
    72 => Dict(154=>1, 156=>1, 157=>8, 158=>1, 159=>8, 160=>1, 162=>1, 164=>1, 166=>1, 168=>1, 169=>6, 170=>1, 171=>8, 172=>1, 173=>2, 174=>1, 176=>1, 177=>8, 178=>1, 179=>10, 180=>1, 181=>2, 182=>1, 184=>1, 186=>1, 188=>1, 190=>1),
    73 => Dict(155=>12, 157=>2, 159=>2, 162=>2, 173=>6, 174=>7, 175=>8, 177=>8, 178=>15, 179=>8, 180=>3, 181=>8, 182=>7, 183=>8),
    74 => Dict(158=>1, 160=>1, 162=>1, 163=>8, 164=>1, 166=>1, 168=>1, 170=>1, 172=>1, 173=>6, 174=>1, 176=>1, 177=>2, 178=>1, 179=>8, 180=>1, 181=>10, 182=>1, 183=>2, 184=>1, 185=>4, 186=>1, 187=>4, 188=>1, 190=>1, 192=>1, 194=>1, 196=>1, 197=>1),
    75 => Dict(161=>2, 163=>2, 177=>6, 179=>6, 181=>6, 182=>5, 183=>6, 185=>6, 186=>3, 187=>6, 188=>3, 189=>6),
    76 => Dict(162=>1, 164=>1, 166=>1, 168=>1, 170=>1, 172=>1, 173=>6, 174=>1, 176=>1, 177=>2, 178=>1, 179=>2, 180=>1, 181=>2, 182=>1, 183=>10, 184=>1, 185=>2, 186=>1, 187=>2, 188=>1, 189=>4, 190=>1, 191=>10, 192=>1, 193=>4, 194=>1, 196=>1, 198=>1, 200=>1, 202=>1),
    77 => Dict(167=>2, 177=>6, 181=>6, 182=>7, 183=>6, 184=>11, 185=>6, 186=>5, 187=>4, 188=>3, 189=>4, 190=>9, 191=>4, 192=>9, 193=>4, 194=>3, 195=>4, 197=>4),
    78 => Dict(166=>1, 168=>1, 170=>1, 172=>1, 174=>1, 175=>8, 176=>1, 177=>6, 178=>1, 179=>2, 180=>1, 181=>2, 182=>1, 183=>2, 184=>1, 185=>10, 186=>1, 187=>4, 188=>1, 189=>4, 190=>1, 191=>4, 192=>1, 193=>2, 194=>1, 195=>2, 196=>1, 197=>2, 198=>1, 199=>6, 200=>1, 202=>1, 204=>1),
    79 => Dict(184=>11, 185=>6, 186=>7, 189=>2, 190=>3, 191=>4, 192=>3, 193=>4, 194=>3, 195=>4, 196=>5, 197=>4, 198=>5, 199=>4, 201=>4, 203=>4),
    80 => Dict(172=>1, 174=>1, 176=>1, 178=>1, 180=>1, 181=>2, 182=>1, 183=>2, 184=>1, 185=>2, 186=>1, 188=>1, 189=>14, 190=>1, 192=>1, 194=>1, 195=>2, 196=>1, 197=>2, 198=>1, 199=>2, 200=>1, 201=>4, 202=>1, 203=>6, 204=>1, 205=>2, 206=>1, 208=>1, 210=>1, 212=>1, 214=>1, 216=>1),
    81 => Dict(194=>5, 195=>2, 196=>5, 197=>2, 198=>5, 199=>2, 200=>5, 201=>2, 202=>5, 203=>2, 204=>5, 205=>2, 206=>1, 207=>2, 208=>11, 209=>2),
    82 => Dict(178=>1, 180=>1, 182=>1, 184=>1, 185=>14, 186=>1, 188=>1, 190=>1, 192=>1, 194=>1, 195=>4, 196=>1, 197=>4, 198=>1, 199=>4, 200=>1, 201=>6, 202=>1, 203=>6, 204=>1, 205=>6, 206=>1, 207=>2, 208=>1, 209=>10, 210=>1, 211=>10, 212=>1, 214=>1, 216=>1, 218=>1, 220=>1),
    83 => Dict(185=>2, 199=>10, 200=>15, 201=>10, 202=>11, 203=>10, 204=>13, 205=>10, 206=>13, 207=>10, 208=>11, 209=>10, 210=>3, 211=>10, 213=>10, 214=>3),
    84 => Dict(186=>1, 188=>1, 190=>1, 192=>1, 194=>1, 196=>1, 198=>1, 200=>1, 201=>4, 202=>1, 203=>6, 204=>1, 205=>6, 206=>1, 207=>6, 208=>1, 209=>2, 210=>1, 211=>10, 212=>1, 213=>10, 214=>1, 215=>10, 216=>1, 218=>1, 220=>1, 222=>1, 224=>1, 226=>1),
    85 => Dict(203=>10, 204=>15, 205=>10, 207=>10, 208=>13, 209=>10, 211=>10, 213=>10, 214=>3, 215=>10, 216=>3, 217=>10, 220=>7),
    86 => Dict(194=>1, 195=>4, 196=>1, 198=>1, 200=>1, 202=>1, 204=>1, 205=>6, 206=>1, 207=>6, 208=>1, 209=>6, 210=>1, 211=>2, 212=>1, 214=>1, 215=>10, 216=>1, 217=>10, 218=>1, 219=>6, 220=>1, 221=>8, 222=>1, 223=>8, 224=>1, 225=>8, 226=>1, 228=>1, 230=>1),
    87 => Dict(207=>10, 208=>15, 209=>10, 210=>13, 211=>10, 212=>11, 213=>10, 215=>10, 217=>10, 218=>3, 219=>10, 220=>3, 221=>6, 222=>5, 224=>3, 225=>4, 226=>3, 227=>2, 228=>5),
    88 => Dict(202=>1, 204=>1, 206=>1, 208=>1, 209=>6, 210=>1, 212=>1, 213=>2, 214=>1, 216=>1, 218=>1, 220=>1, 221=>6, 222=>1, 223=>4, 224=>1, 225=>2, 226=>1, 227=>4, 228=>1, 229=>6, 230=>1, 232=>1, 234=>1),
    89 => Dict(215=>10, 217=>10, 219=>10, 222=>3, 224=>1, 227=>4, 228=>7, 231=>2),
    90 => Dict(208=>1, 210=>1, 212=>1, 214=>1, 216=>1, 218=>1, 220=>1, 222=>1, 224=>1, 226=>1, 228=>1, 229=>6, 230=>1, 231=>6, 232=>1, 233=>2, 234=>1, 236=>1, 238=>1),
    91 => Dict(219=>10, 221=>10, 228=>7, 231=>4, 233=>4, 234=>9),
    92 => Dict(216=>1, 218=>1, 220=>1, 222=>1, 224=>1, 226=>1, 228=>1, 230=>1, 232=>1, 233=>6, 234=>1, 235=>8, 236=>1, 237=>2, 238=>1, 239=>6, 240=>1, 242=>1)
)