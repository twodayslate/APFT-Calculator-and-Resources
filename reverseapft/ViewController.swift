//
//  ViewController.swift
//  reverseapft
//
//  Created by twodayslate on 10/14/14.
//  Copyright (c) 2014 twodayslate. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var situpPicker : UIPickerView! = nil
    var pushupPicker : UIPickerView! = nil
    var runPicker : UIPickerView! = nil
    var valueLabel : UILabel! = nil
    var segment : UISegmentedControl! = nil
    var runLabel : UILabel! = nil
     var pushupLabel : UILabel! = nil
     var situpLabel : UILabel! = nil
    var inputAge : UITextField! = nil
    
    
                                  // This is the score 30-100
                                  //[30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,
                                  // 45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
                                  // 60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,
                                  // 75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,
                                  // 90,91,92,93,94,95,96,97,98,99,100]
    
                                  // Then these are the reps/time given the score above
    let malePushup21 : Array<Int> = [20,21,22,22,23,24,24,25,26,27,27,28,29,30,30,
                                     31,32,32,33,34,35,34,36,37,38,38,39,40,40,41,
                                     42,43,43,44,45,45,46,47,48,48,49,50,51,51,52,
                                     53,53,54,55,56,56,57,58,59,59,60,61,61,62,63,
                                     64,64,65,66,67,67,68,69,69,70,71];

    let malePushup26 : Array<Int> = [14,15,16,16,17,18,19,20,21,22,23,23,24,25,26,
                                     27,28,29,30,30,31,32,33,34,35,36,37,37,38,39,
                                     40,41,42,43,44,44,45,46,47,48,49,50,51,51,52,
                                     53,54,55,56,57,58,58,59,60,61,62,63,64,65,65,
                                     66,67,68,69,70,71,72,72,73,74,75];
    
    let malePushup31 : Array<Int> = [11,11,12,13,14,15,16,17,18,19,20,21,22,23,24,
                                     25,26,27,28,29,30,31,31,32,33,34,35,36,37,38,
                                     39,40,41,42,43,44,45,46,47,48,49,49,50,51,52,
                                     53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,
                                     68,68,69,70,71,72,73,74,75,76,77];
    
    let malePushup36 : Array<Int> = [07,08,09,10,11,12,13,14,15,16,17,17,18,19,20,
                                     21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,
                                     36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,
                                     51,52,53,54,55,56,56,57,58,59,60,61,62,63,64,
                                     65,66,67,68,69,70,71,72,73,74,75];
    
    let malePushup41 : Array<Int> = [05,06,07,08,09,10,11,12,13,14,15,15,16,17,18,
                                     19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,
                                     34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,
                                     49,50,51,52,53,54,54,55,56,57,58,59,60,61,62,
                                     63,64,65,66,67,68,69,70,71,72,73];
    
    
    let malePushup46 : Array<Int> = [05,05,05,06,07,08,08,09,10,11,12,13,14,15,16,
                                     16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
                                     30,31,32,33,34,34,35,36,37,38,39,40,41,42,43,
                                     43,44,45,46,47,48,49,50,51,52,52,53,54,55,56,
                                     57,58,59,60,61,61,62,63,64,65,66];
    
    let malePushup51 : Array<Int> = [05,05,05,05,05,05,05,06,06,07,08,09,10,11,11,
                                     12,13,14,15,16,17,17,18,19,20,21,22,23,23,24,
                                     25,26,27,28,28,29,30,31,32,33,34,34,35,36,37,
                                     38,39,40,40,41,42,43,44,45,45,46,47,48,49,50,
                                     51,51,52,53,54,55,56,57,57,58,59];
    
    let malePushup56 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,06,
                                     07,07,08,09,10,11,12,13,14,15,16,16,17,18,19,
                                     20,21,22,23,24,25,25,26,27,28,29,30,31,32,33,
                                     34,34,35,36,37,38,39,40,41,42,43,43,44,45,46,
                                     47,48,49,50,51,52,52,53,54,55,56];
    
    let malePushup61 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
                                     05,06,07,08,08,09,10,11,12,13,14,15,15,16,17,
                                     18,19,20,21,22,22,23,24,25,26,27,28,29,29,30,
                                     31,32,33,34,35,36,36,37,38,39,40,41,42,43,43,
                                     44,45,46,47,48,49,50,50,51,52,53];
    
    let malePushup: Array<Int> =    [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
                                     05,05,05,06,07,08,08,09,10,11,12,13,14,14,15,
                                     16,17,18,19,19,20,21,22,23,24,25,25,26,27,28,
                                     29,30,31,31,32,33,34,35,36,36,37,38,39,40,41,
                                     42,42,43,44,45,46,47,48,48,49,50];
    
    
    
    
    
    let maleSitup21 : Array<Int> = [34,35,36,36,37,38,38,39,39,40,41,41,42,43,43,
                                    44,44,45,46,46,47,48,48,49,49,50,51,51,52,53,
                                    53,54,54,55,56,56,57,58,58,59,59,60,61,61,62,
                                    63,63,64,64,65,66,66,67,68,68,69,69,70,71,71,
                                    72,73,73,74,74,75,76,76,77,78,78];
    
    let maleSitup26 : Array<Int> = [28,28,29,30,31,31,32,33,34,34,35,36,37,37,38,
                                    39,40,40,41,42,43,44,44,45,46,46,47,48,49,49,
                                    50,51,52,52,53,54,55,55,56,57,58,58,59,60,61,
                                    61,62,63,64,64,65,66,67,67,68,69,70,70,71,72,
                                    73,73,74,75,76,76,77,78,79,79,80];
    
    let maleSitup31 : Array<Int> = [21,21,21,21,21,22,23,24,25,26,27,27,28,29,30,
                                    31,32,33,34,35,36,37,38,39,39,40,41,42,43,44,
                                    45,46,47,48,49,50,51,52,52,53,54,55,56,57,58,
                                    59,60,61,62,63,64,64,65,66,67,68,69,70,71,72,
                                    73,74,75,76,76,77,78,79,80,81,82];
    
    let maleSitup36 : Array<Int> = [21,21,21,21,21,21,22,23,23,24,25,26,27,28,28,
                                    29,30,31,32,33,34,35,35,36,37,38,39,40,40,41,
                                    42,43,44,45,45,46,47,48,49,50,51,51,52,53,54,
                                    55,56,57,57,58,59,60,61,62,62,63,64,65,66,67,
                                    68,68,69,70,71,72,73,74,74,75,76];
    
    let maleSitup41 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,22,23,
                                    24,25,26,27,28,29,30,30,31,32,33,34,35,36,37,
                                    38,39,40,41,42,43,44,45,46,47,48,48,49,50,51,
                                    52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,
                                    67,67,68,69,70,71,72,73,74,75,76];
    
    let maleSitup46 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
                                    21,21,21,21,21,22,23,24,25,26,27,28,29,30,31,
                                    32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,
                                    47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,
                                    62,63,64,65,66,67,68,69,70,71,72];
    
    let maleSitup51 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
                                    21,21,21,21,21,21,22,23,24,25,26,26,27,28,29,
                                    30,31,32,33,34,35,35,36,37,38,39,40,41,42,43,
                                    44,44,45,46,47,48,49,50,51,52,53,53,54,55,56,
                                    57,58,59,60,61,62,62,63,64,65,66];
    
    let maleSitup56 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
                                    21,21,21,21,21,21,21,21,21,22,23,24,25,26,27,
                                    28,29,30,31,32,33,34,35,36,37,38,38,39,40,41,
                                    42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,
                                    57,57,58,59,60,61,62,63,64,65,66];
    
    let maleSitup61 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
                                    21,21,21,21,21,21,21,21,21,21,22,23,24,25,26,
                                    27,28,29,30,31,32,33,34,34,35,36,37,38,39,40,
                                    41,42,43,44,45,46,46,47,48,49,50,51,52,53,54,
                                    55,56,57,58,58,59,60,61,62,63,64];
    
    let maleSitup : Array<Int> =   [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
                                    21,21,21,21,21,21,21,21,21,21,21,22,23,24,25,
                                    26,27,28,29,30,31,32,33,33,34,35,36,37,38,39,
                                    40,41,42,43,44,45,45,46,47,48,49,50,51,52,53,
                                    54,55,56,57,57,58,59,60,61,62,63];
    
    
    
    let maleRun21 : Array<Int> = [1801,1755,1749,1743,1743,1737,1731,1731,1725,1719,1713,1713,1707,1701,1655,
                                  1655,1649,1643,1643,1637,1631,1625,1625,1619,1613,1607,1607,1601,1555,1555,
                                  1549,1543,1537,1537,1531,1525,1525,1519,1513,1507,1507,1501,1455,1449,1449,
                                  1443,1437,1437,1431,1425,1419,1419,1413,1407,1401,1401,1355,1349,1349,1343,
                                  1337,1331,1331,1325,1319,1313,1313,1307,1301,1301,1300];
    
    
    let maleRun26 : Array<Int> = [1913,1907,1901,1855,1849,1843,1843,1837,1831,1825,1819,1813,1807,1801,1755,
                                  1749,1749,1743,1737,1731,1725,1719,1713,1707,1701,1655,1655,1649,1643,1637,
                                  1631,1625,1619,1613,1607,1601,1601,1555,1549,1543,1537,1531,1525,1519,1513,
                                  1507,1507,1501,1455,1449,1443,1437,1431,1425,1419,1413,1413,1407,1401,1355,
                                  1349,1343,1337,1331,1325,1319,1319,1313,1307,1301,1300];
    
    let maleRun31 : Array<Int> = [1943,1937,1931,1925,1919,1913,1907,1901,1855,1849,1843,1843,1837,1831,1825,
                                  1819,1813,1807,1801,1755,1749,1743,1737,1731,1731,1725,1719,1713,1707,1701,
                                  1655,1649,1643,1637,1631,1625,1619,1613,1613,1607,1601,1555,1549,1543,1537,
                                  1531,1525,1519,1513,1507,1501,1501,1455,1449,1443,1437,1431,1425,1419,1413,
                                  1407,1401,1355,1349,1349,1343,1337,1331,1325,1319,1313];
    
    let maleRun36 : Array<Int> = [2055,2049,2043,2037,2031,2025,2013,2007,2001,1955,1949,1943,1937,1931,1925,
                                  1919,1907,1901,1855,1849,1843,1837,1831,1825,1819,1813,1801,1755,1749,1743,
                                  1737,1731,1725,1719,1713,1707,1655,1649,1643,1637,1631,1625,1619,1613,1607,
                                  1601,1549,1543,1537,1531,1525,1519,1513,1507,1501,1455,1443,1437,1431,1425,
                                  1419,1413,1407,1401,1355,1349,1337,1331,1325,1319,1313];
    
    let maleRun41 : Array<Int> = [2143,2137,2131,2125,2119,2107,2101,2055,2049,2043,2037,2025,2019,2013,2007,
                                  2001,1955,1943,1937,1931,1925,1919,1907,1901,1855,1849,1843,1837,1825,1819,
                                  1813,1807,1801,1755,1743,1737,1731,1725,1719,1713,1701,1655,1649,1643,1637,
                                  1625,1619,1613,1607,1601,1555,1543,1537,1531,1525,1519,1513,1501,1455,1449,
                                  1443,1437,1425,1419,1413,1407,1401,1355,1343,1337,1331];
    
    let maleRun46 : Array<Int> = [2207,2155,2149,2143,2137,2131,2125,2119,2107,2101,2055,2049,2043,2037,2025,
                                  2019,2013,2007,2001,1955,1949,1937,1931,1925,1919,1913,1907,1901,1849,1843,
                                  1837,1831,1825,1819,1807,1801,1755,1749,1743,1737,1731,1719,1713,1707,1701,
                                  1655,1649,1643,1631,1625,1619,1613,1607,1601,1549,1543,1537,1531,1525,1519,
                                  1513,1501,1455,1449,1443,1437,1431,1425,1413,1407,1401];
    
    let maleRun51 : Array<Int> = [2313,2307,2301,2255,2243,2237,2231,2219,2213,2207,2201,2149,2143,2137,2131,
                                  2119,2113,2107,2055,2049,2043,2037,2025,2019,2013,2007,1955,1949,1943,1931,
                                  1925,1919,1913,1901,1855,1849,1837,1831,1825,1819,1807,1801,1755,1749,1737,
                                  1731,1725,1713,1707,1701,1655,1643,1637,1631,1625,1613,1607,1601,1549,1543,
                                  1537,1531,1519,1513,1507,1501,1449,1443,1437,1425,1419];
    
    let maleRun56 : Array<Int> = [2331,2325,2319,2313,2301,2255,2249,2237,2231,2225,2219,2207,2201,2155,2149,
                                  2137,2131,2125,2113,2107,2101,2055,2043,2037,2031,2025,2013,2007,2001,1949,
                                  1943,1937,1931,1919,1913,1907,1855,1849,1843,1837,1825,1819,1813,1807,1755,
                                  1749,1743,1731,1725,1719,1713,1701,1655,1649,1643,1631,1625,1619,1607,1601,
                                  1555,1549,1537,1531,1525,1519,1507,1501,1455,1443,1437];
    
    let maleRun61 : Array<Int> = [2319,2307,2301,2255,2249,2243,2237,2231,2219,2213,2207,2201,2155,2149,2137,
                                  2131,2125,2119,2113,2107,2101,2049,2043,2037,2031,2025,2019,2013,2001,1955,
                                  1949,1943,1937,1931,1919,1913,1907,1901,1855,1849,1843,1831,1825,1819,1813,
                                  1807,1801,1755,1743,1737,1731,1725,1719,1713,1701,1655,1649,1643,1637,1631,
                                  1625,1613,1607,1601,1555,1549,1543,1537,1525,1519,1513];
    
    let maleRun : Array<Int> =   [2307,2301,2255,2249,2243,2237,2231,2225,2219,2213,2207,2155,2149,2143,2137,
                                  2131,2125,2119,2113,2107,2101,2055,2049,2043,2031,2025,2019,2013,2007,2001,
                                  1955,1949,1943,1937,1931,1925,1919,1913,1901,1855,1849,1843,1837,1831,1825,
                                  1819,1813,1807,1801,1755,1749,1737,1731,1725,1719,1713,1707,1701,1655,1649,
                                  1643,1637,1631,1625,1613,1607,1601,1555,1549,1543,1537];
    let femalePushup21 : Array<Int> = [05,05,05,05,05,05,05,06,07,07,08,08,09,09,10,
        11,11,12,12,13,13,14,15,15,16,16,17,17,18,19,
        19,20,20,21,22,22,23,23,24,24,25,26,26,27,27,
        28,28,29,30,30,31,31,32,32,33,34,34,35,35,36,
        36,37,38,38,39,39,40,40,41,42,42];
    
    let femalePushup26 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,06,
        06,07,08,08,10,11,12,12,13,13,14,14,15,16,16,
        17,18,19,19,20,21,21,22,23,24,24,25,26,27,27,
        28,29,29,30,31,32,32,33,34,35,35,36,37,37,38,
        39,40,40,41,42,43,43,44,45,45,46];
    
    let femalePushup31 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
        05,06,06,07,09,10,11,11,12,12,13,14,15,15,16,
        17,18,19,20,20,21,22,23,24,25,25,26,27,28,29,
        29,30,31,32,33,34,34,35,36,37,38,39,39,40,41,
        42,43,43,44,45,46,47,48,48,49,50];
    
    let femalePushup36 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
        05,05,05,06,08,09,10,10,11,11,12,12,13,13,14,
        15,16,17,17,18,19,20,20,21,22,23,23,24,25,26,
        26,27,28,29,29,30,31,32,32,33,34,35,35,36,37,
        38,38,39,40,41,41,42,43,44,44,45];
    
    let femalePushup41 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
        05,05,05,05,06,06,07,08,08,09,10,10,11,12,12,
        13,14,15,15,16,17,17,18,19,19,20,21,21,22,23,
        23,24,25,25,26,27,27,28,29,29,30,31,31,32,33,
        33,34,35,35,36,37,37,38,39,39,40];
    
    
    let femalePushup46 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
        05,05,05,05,05,06,07,07,08,08,09,10,10,11,12,
        12,13,13,14,15,15,16,17,17,18,18,19,20,20,21,
        22,22,23,23,24,25,25,26,27,27,28,28,29,30,30,
        31,32,32,33,33,34,35,35,36,37,37];
    
    let femalePushup51 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
        05,05,05,05,05,05,05,05,06,07,07,08,08,09,10,
        10,11,11,12,13,13,14,14,15,16,16,17,17,18,19,
        19,20,20,21,22,22,23,23,24,25,25,26,26,27,28,
        28,29,29,30,31,31,32,32,33,34,34];
    
    let femalePushup56 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
        05,05,05,05,05,05,05,05,05,06,06,07,08,08,09,
        09,10,10,11,11,12,13,13,14,14,15,15,16,16,17,
        17,18,19,19,20,20,21,21,22,22,23,24,24,25,25,
        26,26,27,27,28,28,29,30,30,31,31];
    
    let femalePushup61 : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
        05,05,05,05,05,05,05,05,05,05,06,06,07,07,08,
        08,09,09,10,10,11,11,12,12,13,13,14,14,15,15,
        16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,
        23,24,24,25,25,26,26,27,27,28,28];
    
    let femalePushup : Array<Int> = [05,05,05,05,05,05,05,05,05,05,05,05,05,05,05,
    05,05,05,05,05,05,05,05,05,05,05,05,06,06,07,
    07,08,08,09,09,10,10,10,11,11,12,12,13,13,14,
    14,14,15,15,16,16,17,17,18,18,19,19,19,20,20,
    21,21,22,22,23,23,23,24,24,25,25];
    
    // This is the score 30-100
    //[30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,
    // 45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
    // 60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,
    // 75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,
    // 90,91,92,93,94,95,96,97,98,99,100]
    
    // Then these are the reps/time given the score above
    
    let femaleSitup21 : Array<Int> = [34,35,36,36,37,38,38,39,39,40,41,41,42,43,43,
        44,44,45,46,46,47,48,48,49,49,50,51,51,52,53,
        53,54,54,55,56,56,57,58,58,59,59,60,61,61,62,
        63,63,64,64,65,66,66,67,68,68,69,69,70,71,71,
        72,73,73,74,74,75,76,76,77,78,78];
    
    let femaleSitup26 : Array<Int> = [28,28,29,30,31,31,32,33,34,34,35,36,37,37,38,
        39,40,40,41,42,43,44,44,45,46,46,47,48,49,49,
        50,51,52,52,53,54,55,55,56,57,58,58,59,60,61,
        61,62,63,64,64,65,66,67,67,68,69,70,70,71,72,
        73,73,74,75,76,76,77,78,79,79,80];
    
    let femaleSitup31 : Array<Int> = [21,21,21,21,21,22,23,24,25,26,27,27,28,29,30,
        31,32,33,34,35,36,37,38,39,39,40,41,42,43,44,
        45,46,47,48,49,50,51,51,52,52,53,54,55,56,57,
        58,59,60,61,62,63,64,64,65,66,67,68,69,70,71,
        72,73,74,75,76,77,78,79,80,81,82];
    
    
    let femaleSitup36 : Array<Int> = [21,21,21,21,21,21,22,23,23,24,25,26,27,28,28,
        29,30,31,32,33,34,35,35,36,37,38,39,40,40,41,
        42,43,44,45,45,46,47,48,49,50,51,51,52,53,54,
        55,56,57,57,58,59,60,61,62,62,63,64,65,66,67,
        68,68,69,70,71,72,73,74,74,75,76];
    
    let femaleSitup41 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,22,23,
        24,25,26,27,28,29,30,30,31,32,33,34,35,36,37,
        38,39,40,41,42,43,44,45,46,47,48,48,49,50,51,
        55,56,57,58,59,60,61,62,63,52,53,54,64,65,66,
        67,67,68,69,70,71,72,73,74,75,76];
    
    let femaleSitup46 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
        21,21,21,21,21,22,23,24,25,26,27,28,29,30,31,
        32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,
        47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,
        62,63,64,65,66,67,68,69,70,71,72];
    
    
    let femaleSitup51 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
        21,21,21,21,21,21,22,23,24,25,26,26,27,28,29,
        30,31,32,33,34,35,35,36,37,38,39,40,41,42,43,
        44,44,45,46,47,48,49,50,51,52,53,53,54,55,56,
        57,58,59,60,61,62,62,63,64,65,66];
    
    let femaleSitup56 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
        21,21,21,21,21,21,21,21,21,22,23,24,25,26,27,
        28,29,30,31,32,33,34,35,36,37,38,38,39,40,41,
        42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,
        57,57,58,59,60,61,62,63,64,65,66];
    
    
    let femaleSitup61 : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
        21,21,21,21,21,21,21,21,21,21,22,23,24,25,26,
        27,28,29,30,31,32,33,34,34,35,36,37,38,39,40,
        41,42,43,44,45,46,46,47,48,49,50,51,52,53,54,
        55,56,57,58,58,59,60,61,62,63,64];
    
    
    let femaleSitup : Array<Int> = [21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,
    21,21,21,21,21,21,21,21,21,21,21,22,23,24,25,
    26,27,28,29,30,31,32,33,33,34,35,36,37,38,39,
    40,41,42,43,44,45,45,46,47,48,49,50,51,52,53,
    54,55,56,57,57,58,59,60,61,62,63];
    
    // This is the score 30-100
    //[30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,
    // 45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
    // 60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,
    // 75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,
    // 90,91,92,93,94,95,96,97,98,99,100]
    
    // Then these are the reps/time given the score above
    
    
    let femaleRun21 : Array<Int> = [2119,2113,2107,2101,2055,2055,2049,2043,2037,2031,2025,2025,2019,2013,2007,
        2001,1955,1955,1949,1943,1937,1931,1931,1925,1919,1913,1907,1901,1901,1855,
        1849,1843,1837,1831,1831,1825,1819,1813,1807,1801,1801,1755,1749,1743,1737,
        1737,1731,1725,1719,1713,1707,1707,1701,1655,1649,1643,1637,1637,1631,1625,
        1619,1613,1613,1607,1601,1555,1549,1543,1543,1537,1531];
    
    let femaleRun26 : Array<Int> = [2231,2225,2219,2213,2207,2201,2155,2149,2143,2137,2131,2125,2119,2113,2107,
        2101,2055,2049,2043,2037,2031,2025,2019,2013,2007,2001,1955,1949,1943,1937,
        1931,1925,1919,1913,1907,1901,1855,1849,1843,1837,1831,1825,1819,1813,1807,
        1801,1755,1749,1743,1737,1731,1725,1719,1713,1707,1701,1655,1649,1643,1637,
        1631,1625,1619,1613,1607,1601,1555,1549,1543,1537,1531];
    
    
    let femaleRun31 : Array<Int> = [2355,2349,2343,2337,2331,2319,2313,2307,2301,2255,2249,2237,2231,2225,2219,
        2213,2207,2155,2149,2143,2137,2131,2119,2113,2107,2101,2055,2049,2037,2031,
        2025,2019,2013,2007,1955,1949,1943,1937,1931,1925,1913,1907,1901,1855,1849,                                                                                             1837,1831,1825,1819,1813,1807,1755,1749,1743,1737,1731,1725,1713,1707,1701,
        1655,1649,1637,1631,1625,1619,1613,1607,1555,1549,1543];
    
    let femaleRun36 : Array<Int> = [2455,2455,2455,2455,2455,2455,2455,2455,2449,2443,2431,2425,2413,2407,2355,
        2349,2343,2331,2325,2313,2301,2255,2249,2237,2231,2219,2213,2207,2155,2149,
        2137,2131,2119,2113,2101,2055,2049,2037,2031,2019,2013,2001,1955,1943,1937,
        1925,1919,1913,1901,1855,1843,1837,1825,1819,1807,1801,1755,1743,1737,1725,
        1719,1707,1701,1649,1643,1631,1625,1619,1607,1601,1549];
    
    let femaleRun41 : Array<Int> = [2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,
        2449,2437,2431,2419,2413,2401,2355,2349,2337,2331,2319,2313,2301,2255,2249,
        2237,2231,2219,2213,2207,2155,2149,2137,2131,2119,2113,2107,2055,2049,2037,
        2031,2019,2013,2007,1955,1949,1937,1931,1919,1913,1907,1855,1849,1837,1831,
        1819,1813,1807,1755,1749,1737,1731,1719,1713,1701,1655];
    
    let femaleRun46 : Array<Int> = [2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,
        2455,2455,2455,2455,2455,2455,2455,2455,2443,2437,2425,2419,2407,2355,2349,
        2337,2331,2319,2313,2301,2249,2243,2231,2225,2213,2207,2155,2143,2137,2125,
        2119,2107,2101,2049,2037,2031,2019,2013,2001,1949,1943,1931,1925,1913,1907,
        1855,1843,1837,1825,1819,1807,1801,1749,1737,1731,1719];
    
    let femaleRun51 : Array<Int> = [2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,
        2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2443,2437,2425,2413,2407,
        2355,2349,2337,2325,2319,2307,2301,2249,2237,2231,2219,2213,2201,2149,2143,
        2131,2125,2113,2101,2055,2043,2037,2025,2013,2007,1955,1949,1937,1925,1919,
        1907,1901,1849,1837,1831,1819,1813,1801,1749,1743,1731];
    
    let femaleRun56 : Array<Int> = [2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,
        2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2443,2437,2431,
        2419,2413,2401,2355,2349,2337,2331,2325,2313,2307,2301,2249,2243,2237,2225,
        2219,2213,2201,2155,2149,2137,2131,2119,2113,2107,2055,2049,2043,2031,2025,
        2019,2007,2001,1955,1943,1937,1931,1919,1913,1907,1855];
    
    
    let femaleRun61 : Array<Int> = [2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,
        2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2449,
        2443,2437,2431,2419,2413,2407,2355,2349,2343,2337,2325,2319,2313,2307,2255,
        2249,2243,2231,2225,2219,2213,2201,2155,2149,2143,2131,2125,2119,2107,2101,
        2055,2049,2037,2031,2025,2019,2007,2001,1955,1943,1937];
    
    
    let femaleRun : Array<Int> = [2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,
    2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,2455,
    2455,2449,2443,2431,2425,2419,2413,2401,2355,2349,2343,2331,2325,2319,2313,
    2301,2255,2249,2243,2231,2225,2219,2213,2201,2155,2149,2143,2131,2125,2119,
    2113,2101,2055,2049,2043,2031,2025,2019,2013,2001,1955];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.extendedLayoutIncludesOpaqueBars = false
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "apft")
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "segmented")
                segment = UISegmentedControl(items: ["MALE", "FEMALE"]);
                segment.frame = CGRectMake(5, 0, tableView.frame.width - 10 , cell.frame.height - 10)
                segment.selectedSegmentIndex = 0
                cell.addSubview(segment)
                segment.addTarget(self, action: "updateChanged", forControlEvents: UIControlEvents.ValueChanged)
                
            } else if indexPath.row == 1 {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "age")
                var nameLabel = UILabel(frame: CGRectMake(10, 0, 100, cell.frame.height))
                nameLabel.text = "Age"
                cell.addSubview(nameLabel)
                
                inputAge = UITextField(frame: CGRectMake(tableView.frame.width - cell.frame.width, 0, cell.frame.width - 10, cell.frame.height))
                inputAge.keyboardType = UIKeyboardType.NumberPad
                inputAge.placeholder = "21"
                inputAge.textAlignment = NSTextAlignment.Right
                cell.addSubview(inputAge)
                inputAge.addTarget(self, action: "updateChanged", forControlEvents: UIControlEvents.EditingChanged)
                

            } else if indexPath.row == 2 {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "picker")
            
                pushupPicker = UIPickerView(frame: CGRectMake(0+10 ,0, cell.frame.width/3, cell.frame.height))
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "age")
                pushupPicker.delegate = self
                pushupPicker.dataSource = self
                //pushupPicker.selectRow(30, inComponent: 0, animated: false)
                cell.addSubview(pushupPicker)
                var pushupLabel = UILabel(frame: CGRectMake(0+10 ,0, cell.frame.width/3, cell.frame.height))
                pushupLabel.text = "Pushups"
                pushupLabel.textAlignment = NSTextAlignment.Center
                cell.addSubview(pushupLabel)
                
                 situpPicker = UIPickerView(frame: CGRectMake(tableView.frame.width/3 + 10,0, cell.frame.width/3, cell.frame.height))
                situpPicker.delegate = self
                situpPicker.dataSource = self
                //situpPicker.selectRow(30, inComponent: 0, animated: false)
                cell.addSubview(situpPicker)
                var situpLabel = UILabel(frame: CGRectMake(tableView.frame.width/3 + 10,0, cell.frame.width/3, cell.frame.height))
                situpLabel.text = "Situps"
                situpLabel.textAlignment = NSTextAlignment.Center
                cell.addSubview(situpLabel)
                
                runPicker = UIPickerView(frame: CGRectMake((tableView.frame.width/3)*2 + 10,0, cell.frame.width/3 , cell.frame.height))
                runPicker.delegate = self
                runPicker.dataSource = self
                //runPicker.selectRow(30, inComponent: 0, animated: false)
                cell.addSubview(runPicker)
                var runLabel = UILabel(frame: CGRectMake((tableView.frame.width/3)*2 + 10,0, cell.frame.width/3 , cell.frame.height))
                runLabel.text = "Run"
                runLabel.textAlignment = NSTextAlignment.Center
                cell.addSubview(runLabel)
                
                
            } else {
                var nameLabel = UILabel(frame: CGRectMake(10, 0, 100, cell.frame.height))
                nameLabel.text = "Total Score"
                cell.addSubview(nameLabel)
                
                valueLabel = UILabel(frame: CGRectMake(0, 0, cell.frame.width-15, cell.frame.height))
                valueLabel.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
                valueLabel.text = "180"
                valueLabel.textAlignment = NSTextAlignment.Right
                valueLabel.textColor = UIColor.grayColor()
                cell.addSubview(valueLabel)
            }
        } else if indexPath.section == 1 {
            
            
            var nameLabel = UILabel(frame: CGRectMake(10, 0, 100, cell.frame.height))
            switch indexPath.row {
            case 0: nameLabel.text = "Pushups"
            case 1: nameLabel.text = "Situps"
            default: nameLabel.text = "Run"
            }
            cell.addSubview(nameLabel)
            
            
            switch indexPath.row {
            case 0:
                pushupLabel = UILabel(frame: CGRectMake(0, 0, cell.frame.width-15, cell.frame.height))
                pushupLabel.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
                pushupLabel.text = "-"
                pushupLabel.textAlignment = NSTextAlignment.Right
                pushupLabel.textColor = UIColor.grayColor()
                cell.addSubview(pushupLabel)
                pushupPicker.selectRow(30, inComponent: 0, animated: true)
                self.pickerView(pushupPicker, didSelectRow: 30, inComponent: 0)
            case 1:
                situpLabel = UILabel(frame: CGRectMake(0, 0, cell.frame.width-15, cell.frame.height))
                situpLabel.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
                situpLabel.text = "-"
                situpLabel.textAlignment = NSTextAlignment.Right
                situpLabel.textColor = UIColor.grayColor()
                cell.addSubview(situpLabel)
                situpPicker.selectRow(30, inComponent: 0, animated: true)
                self.pickerView(situpPicker, didSelectRow: 30, inComponent: 0)
            default:
                runLabel = UILabel(frame: CGRectMake(0, 0, cell.frame.width-15, cell.frame.height))
                runLabel.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
                runLabel.text = "-"
                runLabel.textAlignment = NSTextAlignment.Right
                runLabel.textColor = UIColor.grayColor()
                cell.addSubview(runLabel)
                runPicker.selectRow(30, inComponent: 0, animated: true)
                self.pickerView(runPicker, didSelectRow: 30, inComponent: 0)
            }
            
        }
        
        
        
        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        //super.scrollViewDidScroll(scrollView)
        self.view.endEditing(true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 2 {
            return 162
        }
        return tableView.rowHeight
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        return 3
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
        
        // gender, age, total, pushup, situp, run, results
    }
    
    func updateChanged() {
        println("logged")
        self.pickerView(pushupPicker, didSelectRow: pushupPicker.selectedRowInComponent(0), inComponent: 0)
        self.pickerView(situpPicker, didSelectRow: situpPicker.selectedRowInComponent(0), inComponent: 0)
        self.pickerView(runPicker, didSelectRow: runPicker.selectedRowInComponent(0), inComponent: 0)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int {
            return 71
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(row + 30)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let newValue : Int = row + 30;
        println("value selected = \(newValue)")
        let sum = runPicker.selectedRowInComponent(0) + pushupPicker.selectedRowInComponent(0) + situpPicker.selectedRowInComponent(0) + 90
        println("new sum = \(sum)")
        valueLabel.text = String(sum)
        
        let gender : NSString! = segment.titleForSegmentAtIndex(segment.selectedSegmentIndex)
        
        println("gender = \(gender)")
        
        //println(inputAge.text)
        var age : Int! = inputAge.text.toInt()
        if (age == nil) {
            age = 21
        }
        println("age = \(age)")
        
        switch pickerView {
        case runPicker: println("Changing run value")
            if(gender.isEqualToString("MALE")) {
                if(age < 22) {
                    runLabel.text = String(maleRun21[row])
                } else if(age < 27) {
                    runLabel.text = String(maleRun26[row])
                } else if(age < 32) {
                    runLabel.text = String(maleRun31[row])
                } else if(age < 37) {
                    runLabel.text = String(maleRun36[row])
                } else if(age < 42) {
                    runLabel.text = String(maleRun41[row])
                } else if(age < 47) {
                    runLabel.text = String(maleRun46[row])
                } else if(age < 52) {
                    runLabel.text = String(maleRun51[row])
                } else if(age < 57) {
                    runLabel.text = String(maleRun56[row])
                } else if(age < 62) {
                    runLabel.text = String(maleRun61[row])
                } else {
                    runLabel.text = String(maleRun[row])
                }
            } else  { // is FEMALE
                if(age < 22) {
                    runLabel.text = String(femaleRun21[row])
                } else if(age < 27) {
                    runLabel.text = String(femaleRun26[row])
                } else if(age < 32) {
                    runLabel.text = String(femaleRun31[row])
                } else if(age < 37) {
                    runLabel.text = String(femaleRun36[row])
                } else if(age < 42) {
                    runLabel.text = String(femaleRun41[row])
                } else if(age < 47) {
                    runLabel.text = String(femaleRun46[row])
                } else if(age < 52) {
                    runLabel.text = String(femaleRun51[row])
                } else if(age < 57) {
                    runLabel.text = String(femaleRun56[row])
                } else if(age < 62) {
                    runLabel.text = String(femaleRun61[row])
                } else {
                    runLabel.text = String(femaleRun[row])
                }
            }
        case situpPicker: println("Changing situp value")
            if(gender.isEqualToString("MALE")) {
                if(age < 22) {
                    situpLabel.text = String(maleSitup21[row])
                } else if(age < 27) {
                    situpLabel.text = String(maleSitup26[row])
                } else if(age < 32) {
                    situpLabel.text = String(maleSitup31[row])
                } else if(age < 37) {
                    situpLabel.text = String(maleSitup36[row])
                } else if(age < 42) {
                    situpLabel.text = String(maleSitup41[row])
                } else if(age < 47) {
                    situpLabel.text = String(maleSitup46[row])
                } else if(age < 52) {
                    situpLabel.text = String(maleSitup51[row])
                } else if(age < 57) {
                    situpLabel.text = String(maleSitup56[row])
                } else if(age < 62) {
                    situpLabel.text = String(maleSitup61[row])
                } else {
                    situpLabel.text = String(maleSitup[row])
                }
            } else  { // is FEMALE
                if(age < 22) {
                    situpLabel.text = String(femaleSitup21[row])
                } else if(age < 27) {
                    situpLabel.text = String(femaleSitup26[row])
                } else if(age < 32) {
                    situpLabel.text = String(femaleSitup31[row])
                } else if(age < 37) {
                    situpLabel.text = String(femaleSitup36[row])
                } else if(age < 42) {
                    situpLabel.text = String(femaleSitup41[row])
                } else if(age < 47) {
                    situpLabel.text = String(femaleSitup46[row])
                } else if(age < 52) {
                    situpLabel.text = String(femaleSitup51[row])
                } else if(age < 57) {
                    situpLabel.text = String(femaleSitup56[row])
                } else if(age < 62) {
                    situpLabel.text = String(femaleSitup61[row])
                } else {
                    situpLabel.text = String(femaleSitup[row])
                }
            }
        default: println("Changing pushup value")
            if(gender.isEqualToString("MALE")) {
                if(age < 22) {
                    pushupLabel.text = String(malePushup21[row])
                } else if(age < 27) {
                    pushupLabel.text = String(malePushup26[row])
                } else if(age < 32) {
                    pushupLabel.text = String(malePushup31[row])
                } else if(age < 37) {
                    pushupLabel.text = String(malePushup36[row])
                } else if(age < 42) {
                    pushupLabel.text = String(malePushup41[row])
                } else if(age < 47) {
                    pushupLabel.text = String(malePushup46[row])
                } else if(age < 52) {
                    pushupLabel.text = String(malePushup51[row])
                } else if(age < 57) {
                    pushupLabel.text = String(malePushup56[row])
                } else if(age < 62) {
                    pushupLabel.text = String(malePushup61[row])
                } else {
                    pushupLabel.text = String(malePushup[row])
                }
            } else  { // is FEMALE
                if(age < 22) {
                    pushupLabel.text = String(femalePushup21[row])
                } else if(age < 27) {
                    pushupLabel.text = String(femalePushup26[row])
                } else if(age < 32) {
                    pushupLabel.text = String(femalePushup31[row])
                } else if(age < 37) {
                    pushupLabel.text = String(femalePushup36[row])
                } else if(age < 42) {
                    pushupLabel.text = String(femalePushup41[row])
                } else if(age < 47) {
                    pushupLabel.text = String(femalePushup46[row])
                } else if(age < 52) {
                    pushupLabel.text = String(femalePushup51[row])
                } else if(age < 57) {
                    pushupLabel.text = String(femalePushup56[row])
                } else if(age < 62) {
                    pushupLabel.text = String(femalePushup61[row])
                } else {
                    pushupLabel.text = String(femalePushup[row])
                }
            }
        }
    }
}

